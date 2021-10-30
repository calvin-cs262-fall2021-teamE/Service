--
-- This SQL script builds a database for the OPUS app, deleting any pre-existing version.
--
-- @author owenpruim
-- @version 10/16/21
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Visit;
DROP TABLE IF EXISTS Patient;

-- Create the schema.
CREATE TABLE Patient (
	registrationNumber integer PRIMARY KEY, 
	name varchar(50),
	sex varchar(50),
	DOB date,
	city varchar(50),
	region varchar(50),
	ethnicity varchar(50),
	lang varchar(50)
	);

CREATE TABLE Visit (
	ID integer PRIMARY KEY,
	visitDate date,
	patient integer REFERENCES Patient(registrationNumber), 
	doctor varchar(50),
	student varchar(50),
	primaryDiseases varchar(50),
	secondaryDiseases varchar(50),
	dischargedDate date,
	Notes varchar(500)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Visit TO PUBLIC;
GRANT SELECT ON Patient TO PUBLIC;

-- Add sample records.
INSERT INTO Patient VALUES (1, 'Owen', 'Male', '11/17/2000', 'Grand Rapids', 'Michigan', 'White', 'English');
INSERT INTO Patient VALUES (2, 'Adam', 'Male', '7/21/2001', 'Hudsonville', 'Guacamole', 'White', 'English');
INSERT INTO Patient VALUES (3, 'Josiah', 'Male', '8/6/2000', 'Somewhere', 'Arkansas', 'White', 'English');
INSERT INTO Patient VALUES (4, 'Fitsum', 'Male', '6/30/1999', 'Addis Ababa', 'Ethiopia', 'Ethiopian', 'English');

INSERT INTO Visit VALUES (1, '11/11/2', 1, 'Dr. Strange', 'Peter Parker', 'Color Blindness', 
	'Pinkeye', '11/12/21', 'Modernistic simple and quick');
INSERT INTO Visit VALUES (2, '10/12/11', 3, 'Dr. Octopus', 'Toby Maguire', 'Smooth Brain', 
	'Syphillis', '12/31/22', 'the first for experience and quality');