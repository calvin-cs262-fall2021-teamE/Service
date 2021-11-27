/**
 * This module implements a REST-inspired webservice for the Monopoly DB.
 * The database is hosted on ElephantSQL.
 *
 * Currently, the service supports the player table only.
 *
 * To guard against SQL injection attacks, this code uses pg-promise's built-in
 * variable escaping. This prevents a client from issuing this URL:
 *     https://cs262-monopoly-service.herokuapp.com/players/1%3BDELETE%20FROM%20PlayerGame%3BDELETE%20FROM%20Player
 * which would delete records in the PlayerGame and then the Player tables.
 * In particular, we don't use JS template strings because it doesn't filter
 * client-supplied values properly.
 *
 * TODO: Consider using Prepared Statements.
 *      https://vitaly-t.github.io/pg-promise/PreparedStatement.html
 *
 * @author: kvlinden
 * @date: Summer, 2020
 */

// Set up the database connection.
const pgp = require('pg-promise')();
const db = pgp({
    host: process.env.DB_SERVER,
    port: process.env.DB_PORT,
    database: process.env.DB_USER,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD
});

// Configure the server and its routes.

const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const router = express.Router();
router.use(express.json());

router.get("/", readHelloMessage);

// OPUS Service Routers

router.get("/patients", readPatients);
router.get("/patient/:registrationNumber", readPatient);
router.put("/patient/:registrationNumber", updatePatient);
router.post('/patients', createPatient);
router.delete('/patients/:registrationNumber', deletePatient);
router.get("/visits", readVisits);
router.get("/visit/:id", readVisit);
router.put("/visit/:id", updateVisit);
router.post('/visits', createVisit);
router.delete('/visits/:id', deleteVisit);
router.get("/pVisits/:patient", readPatientVisits);
router.get("/pVisit/:patient/:visitDate", readPatientVisit);


// app.use

app.use(router);
app.use(errorHandler);
app.listen(port, () => console.log(`Listening on port ${port}`));

// Miscellaneous Functions

function errorHandler(err, req, res) {
    if (app.get('env') === "development") {
        console.log(err);
    }
    res.sendStatus(err.status || 500);
}

function returnDataOr404(res, data) {
    if (data == null) {
        res.sendStatus(404);
    } else {
        res.send(data);
    }
}

function readHelloMessage(req, res) {
    res.send('Hello, OPUS data service!');
}

// Implement the CRUD operations for OPUS Service

function readPatients(req, res, next) {
    db.many("SELECT * FROM Patient")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

function readPatient(req, res, next) {
    db.oneOrNone('SELECT * FROM Patient WHERE registrationNumber=${registrationNumber}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function updatePatient(req, res, next) {
    db.oneOrNone('UPDATE Patient SET registrationNumber=${body.registrationNumber}, name=${body.name} WHERE registrationNumber=${params.registrationNumber} RETURNING registrationNumber', req)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function createPatient(req, res, next) {
    db.one('INSERT INTO Patient(registrationNumber, name, sex, DOB, city, region, ethnicity, lang) VALUES (${body.registrationNumber}, ${body.name}, ${body.sex}, ${body.DOB}, ${body.city}, ${body.region}, ${body.ethnicity}, ${body.lang} RETURNING registrationNumber', req.body)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        });
}

function deletePatient(req, res, next) {
    db.oneOrNone('DELETE FROM Patient WHERE registrationNumber=${registrationNumber} RETURNING registrationNumber', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function readVisits(req, res, next) {
    db.many("SELECT * FROM VISIT")
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        })
}

function readVisit(req, res, next) {
    db.oneOrNone('SELECT * FROM Visit WHERE id=${id}', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function updateVisit(req, res, next) {
    db.oneOrNone('UPDATE Visit SET visitDate=${body.visitDate}, patient=${body.patient}, doctor=${body.doctor}, student=${body.student}, primaryDiseases=${body.primaryDiseases}, secondaryDiseases=${body.secondaryDiseases}, dischargedDate=${body.dischargedDate}, notes=${body.notes}, WHERE id=${params.id} RETURNING id', req)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function createVisit(req, res, next) {
    db.one('INSERT INTO Visit(visitDate, patient, doctor, student, primaryDiseases, secondaryDiseases, dischargedDate, notes) VALUES (${visitDate}, ${patient}, ${doctor}, ${student}, ${primaryDiseases}, ${secondaryDiseases}, ${dischargedDate}, ${notes} RETURNING id', req.body)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            next(err);
        });
}

function deleteVisit(req, res, next) {
    db.oneOrNone('DELETE FROM Visit WHERE id=${id} RETURNING id', req.params)
        .then(data => {
            returnDataOr404(res, data);
        })
        .catch(err => {
            next(err);
        });
}

function readPatientVisits(req, res, next) {
    db.many('SELECT * FROM Visit WHERE patient=${patient}', req.params)
    .then(data => {
        returnDataOr404(res, data);
    })
        .catch(err => {
            next(err);
        });
}

function readPatientVisit(req, res, next) {
    db.oneOrNone('SELECT * FROM Visit WHERE patient=${patient} AND visitDate=${visitDate}', req.params)
    .then(data => {
        returnDataOr404(res, data);
    })
        .catch(err => {
            next(err);
        });
}
