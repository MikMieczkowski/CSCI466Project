DROP TABLE IF EXISTS `Queue`;
DROP TABLE IF EXISTS `Feature`;
DROP TABLE IF EXISTS `Singer`;
DROP TABLE IF EXISTS `Song`;
DROP TABLE IF EXISTS `Contributors`;


CREATE TABLE `Singer` (
    `singerId` INT(20) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`singerId`)
);

CREATE TABLE `Song` (
    `songId` INT(20) NOT NULL,
    `Title` VARCHAR(255) NOT NULL,
    `File` VARCHAR(255) NOT NULL,
    `Artist` VARCHAR(255) NOT NULL,
    `Version` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`songId`)
);

CREATE TABLE `Contributors` (
    `Contributor_id` INT(20) NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`Contributor_id`)
);



CREATE TABLE `Queue` (    
    `singerId` INT(20) NOT NULL,
    `songId`   INT(20) NOT NULL,
    `money`    INT(20) DEFAULT NULL,
    PRIMARY KEY (`singerId`, `songId`),
    FOREIGN KEY (`singerId`) REFERENCES `Singer` (`singerId`),
    FOREIGN KEY (`songId`) REFERENCES `Song` (`songId`)
);


CREATE TABLE `Feature` (
    `songId` INT(20) NOT NULL,
    `Contributor_id` INT(20) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`songId`, `Contributor_id`),
    FOREIGN KEY (`songId`) REFERENCES `Song` (`songId`),
    FOREIGN KEY (`Contributor_id`) REFERENCES `Contributors` (`Contributor_id`)
);


INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (1, "Hey Jude", "Hey Jude-Orginal.mp4", " The Beatles", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (1, " John Lennon (Lead Vocalist, Songwriter), Paul McCartney (Bassist, Songwriter), George Harrison (Lead Guitarist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (2, "Thriller", "Thriller-Orginal.mp4", " Michael Jackson", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (2, " Michael Jackson (Lead Vocalist, Producer, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (3, "Bohemian Rhapsody", "Bohemian Rhapsody-Orginal.mp4", " Queen", "Orginal");
INSERT INTO Song(songId, Title, Artist, Version) VALUES (4, "Bohemian Rhapsody", "Bohemian Rhapsody-Remix.mp4", " Queen", "Remix");
INSERT INTO Contributors(Contributor_id, Name) VALUES (3, " Freddie Mercury (Lead Vocalist, Pianist, Songwriter), Brian May (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (5, "Hello", "Hello-Orginal.mp4", " Adele", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (4, " Adele (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (6, "Shape of You", "Shape of You-Orginal.mp4", " Ed Sheeran", "Orginal");
INSERT INTO Song(songId, Title, Artist, Version) VALUES (7, "Shape of You", "Shape of You-Acoustic.mp4", " Ed Sheeran", "Acoustic");
INSERT INTO Contributors(Contributor_id, Name) VALUES (5, " Ed Sheeran (Lead Vocalist, Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (8, "Shake It Off", "Shake It Off-Orginal.mp4", " Taylor Swift", "Orginal");
INSERT INTO Song(songId, Title, Artist, Version) VALUES (9, "Shake It Off", "Shake It Off-Clean.mp4", " Taylor Swift", "Clean");
INSERT INTO Contributors(Contributor_id, Name) VALUES (6, " Taylor Swift (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (10, "Can't Help Falling in Love", "Can't Help Falling in Love-Orginal.mp4", " Elvis Presley", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (7, " Elvis Presley (Lead Vocalist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (11, "Single Ladies (Put a Ring on It)", "Single Ladies (Put a Ring on It)-Orginal.mp4", " Beyoncé", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (8, " Beyoncé (Lead Vocalist, Producer, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (12, "Umbrella", "Umbrella-Orginal.mp4", " Rihanna", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (9, " Rihanna (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (13, "Just the Way You Are", "Just the Way You Are-Orginal.mp4", " Bruno Mars", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (10, " Bruno Mars (Lead Vocalist, Songwriter, Instrumentalist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (14, "Firework", "Firework-Orginal.mp4", " Katy Perry", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (11, " Katy Perry (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (15, "Viva la Vida", "Viva la Vida-Orginal.mp4", " Coldplay", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (12, " Chris Martin (Lead Vocalist, Pianist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (16, "Lose Yourself", "Lose Yourself-Orginal.mp4", " Eminem", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (13, " Eminem (Lead Rapper, Producer, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (17, "Moves Like Jagger", "Moves Like Jagger-Orginal.mp4", " Maroon 5", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (14, " Adam Levine (Lead Vocalist, Guitarist, Songwriter), James Valentine (Lead Guitarist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (18, "Thank U, Next", "Thank U, Next-Orginal.mp4", " Ariana Grande", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (15, " Ariana Grande (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (19, "Sorry", "Sorry-Orginal.mp4", " Justin Bieber", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (16, " Justin Bieber (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (20, "In My Feelings", "In My Feelings-Orginal.mp4", " Drake", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (17, " Drake (Lead Rapper, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (21, "I Will Always Love You", "I Will Always Love You-Orginal.mp4", " Whitney Houston", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (18, " Whitney Houston (Lead Vocalist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (22, "Purple Rain", "Purple Rain-Orginal.mp4", " Prince", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (19, " Prince (Lead Vocalist, Multi-Instrumentalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (23, "(I Can't Get No) Satisfaction", "(I Can't Get No) Satisfaction-Orginal.mp4", " The Rolling Stones", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (20, " Mick Jagger (Lead Vocalist, Songwriter), Keith Richards (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (24, "No Woman, No Cry", "No Woman, No Cry-Orginal.mp4", " Bob Marley", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (21, " Bob Marley (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (25, "Like a Prayer", "Like a Prayer-Orginal.mp4", " Madonna", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (22, " Madonna (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (26, "Your Song", "Your Song-Orginal.mp4", " Elton John", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (23, " Elton John (Lead Vocalist, Pianist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (27, "With or Without You", "With or Without You-Orginal.mp4", " U2", "Orginal");
INSERT INTO Song(songId, Title, Artist, Version) VALUES (28, "With or Without You", "With or Without You-Remix.mp4", " U2", "Remix");
INSERT INTO Contributors(Contributor_id, Name) VALUES (24, " Bono (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (29, "Blinding Lights", "Blinding Lights-Orginal.mp4", " The Weeknd", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (25, " The Weeknd (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (30, "Comfortably Numb", "Comfortably Numb-Orginal.mp4", " Pink Floyd", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (26, " Roger Waters (Lead Vocalist, Bassist, Songwriter), David Gilmour (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (31, "Dreams", "Dreams-Orginal.mp4", " Fleetwood Mac", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (27, " Stevie Nicks (Lead Vocalist, Songwriter), Lindsey Buckingham (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (32, "Smells Like Teen Spirit", "Smells Like Teen Spirit-Orginal.mp4", " Nirvana", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (28, " Kurt Cobain (Lead Vocalist, Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (33, "Sweet Child o' Mine", "Sweet Child o' Mine-Orginal.mp4", " Guns N' Roses", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (29, " Axl Rose (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (34, "Stairway to Heaven", "Stairway to Heaven-Orginal.mp4", " Led Zeppelin", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (30, " Robert Plant (Lead Vocalist, Songwriter), Jimmy Page (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (35, "Every Breath You Take", "Every Breath You Take-Orginal.mp4", " The Police", "Orginal");
INSERT INTO Song(songId, Title, Artist, Version) VALUES (36, "Every Breath You Take", "Every Breath You Take-Remix.mp4", " The Police", "Remix");
INSERT INTO Contributors(Contributor_id, Name) VALUES (31, " Sting (Lead Vocalist, Bassist, Songwriter), Andy Summers (Guitarist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (37, "Under the Bridge", "Under the Bridge-Orginal.mp4", " Red Hot Chili Peppers", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (32, " Anthony Kiedis (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (38, "Numb", "Numb-Orginal.mp4", " Linkin Park", "Orginal");
INSERT INTO Contributors(Contributor_id, Name) VALUES (33, " Chester Bennington (Lead Vocalist, Songwriter), Mike Shinoda (Rapper, Songwriter)");
