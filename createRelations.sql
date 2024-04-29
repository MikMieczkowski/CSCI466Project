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
    PRIMARY KEY (`songId`, `Contributor_id`),
    FOREIGN KEY (`songId`) REFERENCES `Song` (`songId`),
    FOREIGN KEY (`Contributor_id`) REFERENCES `Contributors` (`Contributor_id`)
);


INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (1, "Hey Jude", "Hey Jude-Original.mp4", " The Beatles", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (1, " John Lennon (Lead Vocalist, Songwriter), Paul McCartney (Bassist, Songwriter), George Harrison (Lead Guitarist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (2, "Thriller", "Thriller-Original.mp4", " Michael Jackson", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (2, " Michael Jackson (Lead Vocalist, Producer, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (3, "Bohemian Rhapsody", "Bohemian Rhapsody-Original.mp4", " Queen", "Original");
INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (4, "Bohemian Rhapsody", "Bohemian Rhapsody-Remix.mp4", " Queen", "Remix");
INSERT INTO Contributors(Contributor_id, Name) VALUES (3, " Freddie Mercury (Lead Vocalist, Pianist, Songwriter), Brian May (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (5, "Hello", "Hello-Original.mp4", " Adele", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (4, " Adele (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (6, "Shape of You", "Shape of You-Original.mp4", " Ed Sheeran", "Original");
INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (7, "Shape of You", "Shape of You-Acoustic.mp4", " Ed Sheeran", "Acoustic");
INSERT INTO Contributors(Contributor_id, Name) VALUES (5, " Ed Sheeran (Lead Vocalist, Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (8, "Shake It Off", "Shake It Off-Original.mp4", " Taylor Swift", "Original");
INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (9, "Shake It Off", "Shake It Off-Clean.mp4", " Taylor Swift", "Clean");
INSERT INTO Contributors(Contributor_id, Name) VALUES (6, " Taylor Swift (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (10, "Can't Help Falling in Love", "Can't Help Falling in Love-Original.mp4", " Elvis Presley", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (7, " Elvis Presley (Lead Vocalist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (11, "Single Ladies (Put a Ring on It)", "Single Ladies (Put a Ring on It)-Original.mp4", " Beyoncé", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (8, " Beyoncé (Lead Vocalist, Producer, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (12, "Umbrella", "Umbrella-Original.mp4", " Rihanna", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (9, " Rihanna (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (13, "Just the Way You Are", "Just the Way You Are-Original.mp4", " Bruno Mars", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (10, " Bruno Mars (Lead Vocalist, Songwriter, Instrumentalist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (14, "Firework", "Firework-Original.mp4", " Katy Perry", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (11, " Katy Perry (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (15, "Viva la Vida", "Viva la Vida-Original.mp4", " Coldplay", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (12, " Chris Martin (Lead Vocalist, Pianist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (16, "Lose Yourself", "Lose Yourself-Original.mp4", " Eminem", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (13, " Eminem (Lead Rapper, Producer, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (17, "Moves Like Jagger", "Moves Like Jagger-Original.mp4", " Maroon 5", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (14, " Adam Levine (Lead Vocalist, Guitarist, Songwriter), James Valentine (Lead Guitarist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (18, "Thank U, Next", "Thank U, Next-Original.mp4", " Ariana Grande", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (15, " Ariana Grande (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (19, "Sorry", "Sorry-Original.mp4", " Justin Bieber", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (16, " Justin Bieber (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (20, "In My Feelings", "In My Feelings-Original.mp4", " Drake", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (17, " Drake (Lead Rapper, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (21, "I Will Always Love You", "I Will Always Love You-Original.mp4", " Whitney Houston", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (18, " Whitney Houston (Lead Vocalist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (22, "Purple Rain", "Purple Rain-Original.mp4", " Prince", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (19, " Prince (Lead Vocalist, Multi-Instrumentalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (23, "(I Can't Get No) Satisfaction", "(I Can't Get No) Satisfaction-Original.mp4", " The Rolling Stones", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (20, " Mick Jagger (Lead Vocalist, Songwriter), Keith Richards (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (24, "No Woman, No Cry", "No Woman, No Cry-Original.mp4", " Bob Marley", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (21, " Bob Marley (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (25, "Like a Prayer", "Like a Prayer-Original.mp4", " Madonna", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (22, " Madonna (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (26, "Your Song", "Your Song-Original.mp4", " Elton John", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (23, " Elton John (Lead Vocalist, Pianist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (27, "With or Without You", "With or Without You-Original.mp4", " U2", "Original");
INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (28, "With or Without You", "With or Without You-Remix.mp4", " U2", "Remix");
INSERT INTO Contributors(Contributor_id, Name) VALUES (24, " Bono (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (29, "Blinding Lights", "Blinding Lights-Original.mp4", " The Weeknd", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (25, " The Weeknd (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (30, "Comfortably Numb", "Comfortably Numb-Original.mp4", " Pink Floyd", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (26, " Roger Waters (Lead Vocalist, Bassist, Songwriter), David Gilmour (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (31, "Dreams", "Dreams-Original.mp4", " Fleetwood Mac", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (27, " Stevie Nicks (Lead Vocalist, Songwriter), Lindsey Buckingham (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (32, "Smells Like Teen Spirit", "Smells Like Teen Spirit-Original.mp4", " Nirvana", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (28, " Kurt Cobain (Lead Vocalist, Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (33, "Sweet Child o' Mine", "Sweet Child o' Mine-Original.mp4", " Guns N' Roses", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (29, " Axl Rose (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (34, "Stairway to Heaven", "Stairway to Heaven-Original.mp4", " Led Zeppelin", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (30, " Robert Plant (Lead Vocalist, Songwriter), Jimmy Page (Lead Guitarist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (35, "Every Breath You Take", "Every Breath You Take-Original.mp4", " The Police", "Original");
INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (36, "Every Breath You Take", "Every Breath You Take-Remix.mp4", " The Police", "Remix");
INSERT INTO Contributors(Contributor_id, Name) VALUES (31, " Sting (Lead Vocalist, Bassist, Songwriter), Andy Summers (Guitarist)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (37, "Under the Bridge", "Under the Bridge-Original.mp4", " Red Hot Chili Peppers", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (32, " Anthony Kiedis (Lead Vocalist, Songwriter)
");

INSERT INTO Song(songId, Title, File, Artist, Version) VALUES (38, "Numb", "Numb-Original.mp4", " Linkin Park", "Original");
INSERT INTO Contributors(Contributor_id, Name) VALUES (33, " Chester Bennington (Lead Vocalist, Songwriter), Mike Shinoda (Rapper, Songwriter)");


INSERT INTO Feature VALUES (1, 1);
INSERT INTO Feature VALUES (2, 2);
INSERT INTO Feature VALUES (3, 3);
INSERT INTO Feature VALUES (4, 3);
INSERT INTO Feature VALUES (5, 4);
INSERT INTO Feature VALUES (6, 5);
INSERT INTO Feature VALUES (7, 5);
INSERT INTO Feature VALUES (8, 6);
INSERT INTO Feature VALUES (9, 6);
INSERT INTO Feature VALUES (10, 7);
INSERT INTO Feature VALUES (11, 8);
INSERT INTO Feature VALUES (12, 9);
INSERT INTO Feature VALUES (13, 10);
INSERT INTO Feature VALUES (14, 11);
INSERT INTO Feature VALUES (15, 12);
INSERT INTO Feature VALUES (16, 13);
INSERT INTO Feature VALUES (17, 14);
INSERT INTO Feature VALUES (18, 15);
INSERT INTO Feature VALUES (19, 16);
INSERT INTO Feature VALUES (20, 17);
INSERT INTO Feature VALUES (21, 18);
INSERT INTO Feature VALUES (22, 19);
INSERT INTO Feature VALUES (23, 20);
INSERT INTO Feature VALUES (24, 21);
INSERT INTO Feature VALUES (25, 22);
INSERT INTO Feature VALUES (26, 23);
INSERT INTO Feature VALUES (27, 24);
INSERT INTO Feature VALUES (28, 24);
INSERT INTO Feature VALUES (29, 25);
INSERT INTO Feature VALUES (30, 26);
INSERT INTO Feature VALUES (31, 27);
INSERT INTO Feature VALUES (32, 28);
INSERT INTO Feature VALUES (33, 29);
INSERT INTO Feature VALUES (34, 30);
INSERT INTO Feature VALUES (35, 31);
INSERT INTO Feature VALUES (36, 31);
INSERT INTO Feature VALUES (37, 32);
INSERT INTO Feature VALUES (38, 33);
