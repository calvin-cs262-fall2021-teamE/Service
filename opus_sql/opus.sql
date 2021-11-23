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
INSERT INTO Patient VALUES (1, 'John Calvin', 'Male', '07/10/1509', 'Noyon', 'France', 'French', 'French');
INSERT INTO Patient VALUES (2, 'Gandalf', 'Male', '02/13/3019', 'Grey Havens', 'Middle Earth', 'Wizard', 'Mannish');
INSERT INTO Patient VALUES (3, 'Bilbo Baggins', 'Male', '09/06/2900', 'Hobbiton', 'Middle Earth', 'Hobbit', 'English');
INSERT INTO Patient VALUES (4, 'Frodo Baggins', 'Male', '09/22/4094', 'Hobbiton', 'Middle Earth', 'Hobbit', 'English');
INSERT INTO Patient VALUES (5, 'Jack Sparrow', 'Male', '05/03/1690', 'Ocean', 'Caribbean', 'English', 'English');
INSERT INTO Patient VALUES (6, 'Elizabeth Swan', 'Female', '12/12/1710', 'London', 'England', 'English', 'English');
INSERT INTO Patient VALUES (7, 'Davy Jones', 'Male', '04/29/1400', 'Isla Serena', 'Caribbean', 'Octopus', 'English');
INSERT INTO Patient VALUES (8, 'Obi-Wan Kenobi', 'Male', '57 BBY', 'Stewjon', 'Galaxy', 'Human', 'English');
INSERT INTO Patient VALUES (9, 'Luke Skywalker', 'Male', '19 BBY', 'Tatooine', 'Galaxy', 'Human', 'English');
INSERT INTO Patient VALUES (10, 'Leia Skywalker', 'Female', '19 BBY', 'Tatooine', 'Galaxy', 'Human', 'English');
INSERT INTO Patient VALUES (11, 'James Bond', 'Male', '11/11/1920', ' Wattenscheid', 'Germany', 'English', 'English');
INSERT INTO Patient VALUES (12, 'Indiana Jones', 'Male', '07/01/1899', 'Princeton', 'New Jersey', 'US', 'English');
INSERT INTO Patient VALUES (13, 'Owen Pruim', 'Male', '11/17/2000', 'Grand Rapids', 'Michigan', 'US', 'English');
INSERT INTO Patient VALUES (14), 'Adam Brink', 'Male', '7/25/2001', 'Hudsonville', 'Guacamole', 'US', 'English');
INSERT INTO Patient VALUES (15, 'Josiah Ryan', 'Male', '8/6/2000', 'Little Rock', 'Arkansas', 'US', 'English');
INSERT INTO Patient VALUES (16, 'Fitsum Maru', 'Male', '6/30/1999', 'Addis Ababa', 'Ethiopia', 'Ethiopian', 'English');

INSERT INTO Visit VALUES (1, '11/11/21', 13, 'Dr. Strange', 'Spongebob', 'Color Blindness', 
	'Pinkeye', '11/12/21', '');
INSERT INTO Visit VALUES (2, '10/12/1530', 1, 'Dr. Octopus', 'Plankton', 'Flu', 
	'Syphillis', '10/12/1530', 'A dog barks when his master is attacked');
INSERT INTO Visit VALUES (1, '10/12/4000', 2, 'Dr. Banner', 'Peter Parker', 'E. coli', 
	'', '11/12/4000', 'Theyre taking the hobbits to Isengard');
INSERT INTO Visit VALUES (3, '06/13/4001', 3, 'Dr. Who', 'Matt Smith', 'Dengue', 
	'', '06/14/40001', 'Going on an adventure');
INSERT INTO Visit VALUES (1, '02/04/4500', 4, 'Dr. Frankenstein', 'Bowser', 'Malaria', 
	'', '02/06/4500', 'Po-tat-toes');
INSERT INTO Visit VALUES (4, '08/23/1720', 5, 'Dr. Doom', 'Toby Maguire', 'The Black Spot', 
	'', '08/31/1720', 'Why is the rum gone');
INSERT INTO Visit VALUES (5, '11/11/1725', 6, 'Dr. Strange', 'Peter Parker', 'Covid-19', 
	'', '11/12/1725', '');
INSERT INTO Visit VALUES (6, '10/16/1714', 7, 'Dr. Octopus', 'Plankton', 'Influenza', 
	'', '10/16/1714', 'A soul for a soul');
INSERT INTO Visit VALUES (7, '30 BBY', 8, 'Dr. Who', 'Spongebob', 'Hepatitis', 
	'', '30 BBY', 'A long time ago in a galaxy far, far away');
INSERT INTO Visit VALUES (8, '19 BBY', 9, 'Dr. Frankenstein', 'Bowser', 'Tetnis', 
	'', '19 BBY', 'A long time ago in a galaxy far, far away');
INSERT INTO Visit VALUES (9, '18 BBY', 10, 'Dr. Who', 'Donkey Kong', 'Bubonic Plague', 
	'', '19 BBY', 'A long time ago in a galaxy far, far away');
INSERT INTO Visit VALUES (10, '01/07/1940', 11, 'Dr. Octopus', 'Bowser', 'Eczema', 
	'', '01/09/1940', 'Bond, James Bond');
INSERT INTO Visit VALUES (11, '12/11/1967', 12, 'Dr. Doom', 'Donkey Kong', 'Cancer', 
	'', '12/15/1967', 'Watch me whip');
INSERT INTO Visit VALUES (12, '10/12/2011', 13, 'Dr. Banner', 'Matt Smith', 'Stroke', 
	'', '12/31/2022', 'Warm cookies');
INSERT INTO Visit VALUES (13, '11/11/2021', 14, 'Dr. Frankenstein', 'Spongebob', 'Ebola', 
	'', '11/12/2021', 'Modernistic simple and quick');
INSERT INTO Visit VALUES (14, '10/12/2011', 15, 'Dr. Who', 'Plankton', 'Smooth Brain', 
	'', '12/31/2011', 'the first for experience and quality');
INSERT INTO Visit VALUES (15, '05/15/2014', 16, 'Dr. Strange', 'Toby Maguire', 'Color Blindness', 
	'', '11/12/2014', 'Like a good neighbor');
INSERT INTO Visit VALUES (16, '04/13/1730', 5, 'Dr. Octopus', 'Peter Parker', 'Shingles', 
	'', '04/13/1730', '');