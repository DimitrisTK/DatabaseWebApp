DROP DATABASE IF EXISTS studresumes;
CREATE DATABASE studresumes;
USE studresumes;


#Tables Creation
CREATE TABLE Languages (langID INT(3) NOT NULL AUTO_INCREMENT, Language VARCHAR(30),
	PRIMARY KEY (langID));
 
CREATE TABLE LanguageLevels (lvlID INT(3) NOT NULL, Level VARCHAR(30),
	PRIMARY KEY (lvlID));

CREATE TABLE Hobbies (hobID INT(3) NOT NULL AUTO_INCREMENT, Hobby VARCHAR(30),
	PRIMARY KEY (hobID));

CREATE TABLE Interests (interID INT(3) NOT NULL, Interest VARCHAR(30), IntStudCounter INT DEFAULT 0,
	PRIMARY KEY (interID));
    
CREATE TABLE Institutes (institID INT(3) NOT NULL, Institute VARCHAR(50), InstitStudCounter INT DEFAULT 0,
	PRIMARY KEY (institID));

CREATE TABLE Faculties (facultID INT(3) NOT NULL, Faculty VARCHAR(50),
	PRIMARY KEY (facultID));



CREATE TABLE Credentials(userID INT(3) NOT NULL AUTO_INCREMENT, Username VARCHAR(30) NOT NULL, Password VARCHAR(30) NOT NULL, Email VARCHAR(30), Sex VARCHAR(7), Registration VARCHAR(30),
                         PRIMARY KEY (userID));

CREATE TABLE Students (studID INT(3) NOT NULL AUTO_INCREMENT, Surname VARCHAR(30), FirstName VARCHAR(30), Birthdate DATE, DateofSubmit VARCHAR(30),
	PRIMARY KEY (studID));
    
    
CREATE TABLE CVs (studID INT(3) NOT NULL, Curriculum VARCHAR(5000),
    FOREIGN KEY (studID) REFERENCES Students(studID));
    
      
CREATE TABLE Media (studID INT(3) NOT NULL, Link VARCHAR(500), MediaType VARCHAR(15), UserNumeration INT(3),
	FOREIGN KEY (studID) REFERENCES Students(studID));

CREATE TABLE Quotes (studID INT(3) NOT NULL, Quote VARCHAR(1000), Qdate VARCHAR(30), 
	FOREIGN KEY (studID) REFERENCES Students(studID));

    
    
#Intermediate Tables
CREATE TABLE StudLang (studID INT(3) NOT NULL, langID INT(3), lvlID INT(3),
	FOREIGN KEY (studID) REFERENCES Students(studID), 
    FOREIGN KEY (lvlID) REFERENCES LanguageLevels(lvlID), 
    FOREIGN KEY (langID) REFERENCES Languages(langID));

CREATE TABLE StudHob (studID INT(3) NOT NULL, hobID INT(3),
	FOREIGN KEY (studID) REFERENCES Students(studID), 
    FOREIGN KEY (hobID) REFERENCES Hobbies(hobID));
    
CREATE TABLE StudInt(studID INT(3) NOT NULL, interID INT(3),
	FOREIGN KEY (studID) REFERENCES Students(studID), 
    FOREIGN KEY (interID) REFERENCES Interests(interID)); 

CREATE TABLE University(studID INT(3) NOT NULL, institID INT(3) NOT NULL,  facultID INT(3), Department VARCHAR(50),
	FOREIGN KEY (studID) REFERENCES Students(studID), 
    FOREIGN KEY (institID) REFERENCES Institutes(institID), 
    FOREIGN KEY (facultID) REFERENCES Faculties(facultID));
 
 

#Triggers
	#Καταχωρηση ημερομηνιας/ωρα εγγραφης στο site	
DROP TRIGGER IF EXISTS cred_trig;
CREATE TRIGGER credentials_trig BEFORE INSERT ON credentials 
FOR EACH ROW SET NEW.registration = NOW();

	#Καταχωρηση ημερομηνιας/ωρα εγγραφης δήλωσης βιογραφικου	
DROP TRIGGER IF EXISTS studreg_trig;
CREATE TRIGGER studreg_trig BEFORE INSERT ON students
FOR EACH ROW SET NEW.DateofSubmit = NOW();

	#Μετρητής βιογραφικών ανά ίδρυμα
DROP TRIGGER IF EXISTS inststudcount_trig;
CREATE TRIGGER inststudcount_trig AFTER INSERT ON university 
FOR EACH ROW UPDATE Institutes SET InstitStudCounter = InstitStudCounter + 1 WHERE InstitID = NEW.InstitID;

	#Μετρητής βιογραφικών ανά ενδιαφέρον
DROP TRIGGER IF EXISTS intereststudcount_trig;
CREATE TRIGGER intereststudcount_trig AFTER INSERT ON StudInt 
FOR EACH ROW UPDATE Interests SET IntStudCounter = IntStudCounter + 1 WHERE interID = NEW.interID;   
    
    #Trigger Qdate
DROP TRIGGER IF EXISTS qdate_trig;
CREATE TRIGGER qdate_trig BEFORE INSERT ON Quotes 
FOR EACH ROW SET NEW.Qdate = NOW();
    


#Necessary Inserts
INSERT INTO Languages(Language) VALUES ('English'), ('French'), ('German'), ('Spanish'), ('Italian'), ('Chinese'), ('Japanese'), ('Russian'), ('Turkish'), ('Arabic');

INSERT INTO LanguageLevels(lvlID, Level) VALUES (0, 'Unknown'),(1, 'Elementary'), (2, 'Intermediate'), (3, 'Advanced'), (4, 'Proficient');

INSERT INTO Institutes(institID, Institute) VALUES (1,'ΑΤΕΙ Αθήνας'), (2,'ΑΤΕΙ Ανατολικής Μακεδονίας και Θράκης'), (3,'ΑΤΕΙ Δυτικής Ελλάδας'), (4,'ΑΤΕΙ Δυτικής Μακεδονίας'), (5,'ΑΤΕΙ Ηπείρου'), (6,'ΑΤΕΙ Θεσσαλίας'), (7,'ΑΤΕΙ Θεσσαλονίκης'),
										 (8,'ΑΤΕΙ Ιονίων Νήσων'), (9,'ΑΤΕΙ Κεντρικής Μακεδονίας'), (10,'ΑΤΕΙ Κρήτης'), (11,'ΑΤΕΙ Πειραιά'), (12,'ΑΤΕΙ Πελοποννήσου'), (13,'ΑΤΕΙ Στερεάς Ελλάδας');			
                                         
INSERT INTO Faculties(facultID, faculty) VALUES (0, 'Άγνωστο'),(10, 'Τεχνολογικών Εφαρμογών'), (20, 'Διοίκησης & Οικονομίας'), (30, 'Επαγγελμάτων Υγείας & Πρόνοιας'), (40, 'Τεχνολογίας Τροφίμων & Διατροφης'),
												(50, 'Καλλιτεχνικών Σπουδών'), (60, 'Τεχνολογιών Γεωπονίας'), (70, 'Μουσικής Τεχνολογίας'), (80, 'Εφαρμοσμένων Επιστημών');

INSERT INTO Interests(interID,interest) VALUES(1,'Database'),(2,'Web programming'),(3,'Human Computer Interaction'),(4,'Data Mining'), (5,'Software Engineering'),
											  (6,'Information Retrieval'),(7,'Software Quality'),(8,'e-commerce'),(9,'Management Information Systems'),(10,'Information Systems');

INSERT INTO Hobbies(hobby) VALUES ('Football'), ('Basketball'), ('Volleyball'), ('Tennis'), ('Swimming'),
												('Art'),  ('Music'), ('Martial Arts'), ('Cinema'),('Photography');



#Alpha Phase
INSERT INTO Students(surname, FirstName, Birthdate) values ('Kourias','Dimitris','1995-4-4'),('Pappoutsis','Xristos','1996-2-10');
INSERT INTO CVs VALUES (1,'Απόφοιτος Λυκείου,Φοιτητής Πληροφορικής'),(2,'Φοιτητής Πληροφορικής');
INSERT INTO Quotes(studID,Quote) VALUES(1,'Something Clever'),(2,'Something more clever');
INSERT INTO Media VALUES (1,'https://goo.gl/2pXNkE','Photo',1),(1,'https://goo.gl/Kjfsya','Photo',2),(1,'https://goo.gl/wO6gt1','Photo',3),(2,'https://goo.gl/Sa4kFO','Photo',1),(1,'https://goo.gl/zqb7e0','Video',1),(2,'https://goo.gl/mnrzOM','Video',1);

INSERT INTO studhob VALUES(1,4),(1,5),(1,6),(1,7),(1,9),(2,8),(2,9);
INSERT INTO studlang VALUES(1,4,3),(2,8,2),(1,9,2);
INSERT INTO studint VALUES(1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(1,4),(2,4),(1,5),(1,6);
INSERT INTO university VALUES (1,13,40,'Informatiks'),(2,6,70,'Accoustic');

INSERT INTO Credentials(Username, Password, Email, Sex) VALUES ('Batman', 'alfred', 'wayne@wayne.com', 'Male');