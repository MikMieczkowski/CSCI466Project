CREATE TABLE `Singer` ( /*(empty table)user implemented*/
    singerId INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE `Song` (
    songId INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL
);

CREATE TABLE `Contributors` (
    contId INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE `File` (
    fileId INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    filename VARCHAR(255) NOT NULL
);

CREATE TABLE `Queue` (     /*(empty table)user implemented*/
    singerId INT(20) NOT NULL,
    songId INT(20) NOT NULL,
    money INT(20) DEFAULT NULL,
    PRIMARY KEY (singerId, songId),
    FOREIGN KEY (singerId) REFERENCES Singer(singerId),
    FOREIGN KEY (songId) REFERENCES Song(songId)
);

CREATE TABLE `Feature` (
    songId INT(20) NOT NULL,
    contId INT(20) NOT NULL,
    role VARCHAR(255) NOT NULL,
    PRIMARY KEY (songId, contId),
    FOREIGN KEY (songId) REFERENCES Song(songId),
    FOREIGN KEY (contId) REFERENCES Contributors(contId)
);

CREATE TABLE `Stored` (
    songId INT(20) NOT NULL,
    fileId INT(20) NOT NULL,
    version VARCHAR(255) NOT NULL,
    PRIMARY KEY (songId, fileId),
    FOREIGN KEY (songId) REFERENCES Song(songId),
    FOREIGN KEY (fileId) REFERENCES `File`(fileId)
);

INSERT INTO Song(songId, title, artist) VALUES (1, "Hey Jude", "The Beatles");
INSERT INTO Contributors(contId, name) VALUES (1, "John Lennon");
INSERT INTO Contributors(contId, name) VALUES (2, "Paul McCartney");
INSERT INTO Contributors(contId, name) VALUES (3, "George Harrison");

INSERT INTO Song(songId, title, artist) VALUES (2, "Thriller", "Michael Jackson");
INSERT INTO Contributors(contId, name) VALUES (4, "Michael Jackson");

INSERT INTO Song(songId, title, artist) VALUES (3, "Bohemian Rhapsody", "Queen");
INSERT INTO Contributors(contId, name) VALUES (5, "Freddie Mercury");
INSERT INTO Contributors(contId, name) VALUES (6, "Brian May");

INSERT INTO Song(songId, title, artist) VALUES (4, "Hello", "Adele");

INSERT INTO Song(songId, title, artist) VALUES (5, "Shape of You", "Ed Sheeran");
INSERT INTO Contributors(contId, name) VALUES (7, "Ed Sheeran");

INSERT INTO Song(songId, title, artist) VALUES (6, "Shake It Off", "Taylor Swift");
INSERT INTO Contributors(contId, name) VALUES (8, "Taylor Swift");

INSERT INTO Song(songId, title, artist) VALUES (7, "Can't Help Falling in Love", "Elvis Presley");
INSERT INTO Contributors(contId, name) VALUES (9, "Elvis Presley");

INSERT INTO Song(songId, title, artist) VALUES (8, "Single Ladies (Put a Ring on It)", "Beyoncé");

INSERT INTO Song(songId, title, artist) VALUES (9, "Umbrella", "Rihanna");

INSERT INTO Song(songId, title, artist) VALUES (10, "Just the Way You Are", "Bruno Mars");
INSERT INTO Contributors(contId, name) VALUES (10, "Bruno Mars");

INSERT INTO Song(songId, title, artist) VALUES (11, "Firework", "Katy Perry");
INSERT INTO Contributors(contId, name) VALUES (11, "Katy Perry");

INSERT INTO Song(songId, title, artist) VALUES (12, "Viva la Vida", "Coldplay");
INSERT INTO Contributors(contId, name) VALUES (12, "Chris Martin");

INSERT INTO Song(songId, title, artist) VALUES (13, "Lose Yourself", "Eminem");

INSERT INTO Song(songId, title, artist) VALUES (14, "Moves Like Jagger", "Maroon 5");
INSERT INTO Contributors(contId, name) VALUES (13, "Adam Levine");
INSERT INTO Contributors(contId, name) VALUES (14, "James Valentine");

INSERT INTO Song(songId, title, artist) VALUES (15, "Thank U, Next", "Ariana Grande");
INSERT INTO Contributors(contId, name) VALUES (15, "Ariana Grande");

INSERT INTO Song(songId, title, artist) VALUES (16, "Sorry", "Justin Bieber");
INSERT INTO Contributors(contId, name) VALUES (16, "Justin Bieber");

INSERT INTO Song(songId, title, artist) VALUES (17, "In My Feelings", "Drake");

INSERT INTO Song(songId, title, artist) VALUES (18, "I Will Always Love You", "Whitney Houston");
INSERT INTO Contributors(contId, name) VALUES (17, "Whitney Houston");

INSERT INTO Song(songId, title, artist) VALUES (19, "Purple Rain", "Prince");

INSERT INTO Song(songId, title, artist) VALUES (20, "(I Can't Get No) Satisfaction", "The Rolling Stones");
INSERT INTO Contributors(contId, name) VALUES (18, "Mick Jagger");
INSERT INTO Contributors(contId, name) VALUES (19, "Keith Richards");

INSERT INTO Song(songId, title, artist) VALUES (21, "No Woman, No Cry", "Bob Marley");
INSERT INTO Contributors(contId, name) VALUES (20, "Bob Marley");

INSERT INTO Song(songId, title, artist) VALUES (22, "Like a Prayer", "Madonna");

INSERT INTO Song(songId, title, artist) VALUES (23, "Your Song", "Elton John");
INSERT INTO Contributors(contId, name) VALUES (21, "Elton John");

INSERT INTO Song(songId, title, artist) VALUES (24, "With or Without You", "U2");

INSERT INTO Song(songId, title, artist) VALUES (25, "Blinding Lights", "The Weeknd");
INSERT INTO Contributors(contId, name) VALUES (22, "The Weeknd");

INSERT INTO Song(songId, title, artist) VALUES (26, "Comfortably Numb", "Pink Floyd");
INSERT INTO Contributors(contId, name) VALUES (23, "Roger Waters");
INSERT INTO Contributors(contId, name) VALUES (24, "David Gilmour");

INSERT INTO Song(songId, title, artist) VALUES (27, "Dreams", "Fleetwood Mac");
INSERT INTO Contributors(contId, name) VALUES (25, "Stevie Nicks");
INSERT INTO Contributors(contId, name) VALUES (26, "Lindsey Buckingham");

INSERT INTO Song(songId, title, artist) VALUES (28, "Smells Like Teen Spirit", "Nirvana");
INSERT INTO Contributors(contId, name) VALUES (27, "Kurt Cobain");

INSERT INTO Song(songId, title, artist) VALUES (29, "Sweet Child o' Mine", "Guns N' Roses");
INSERT INTO Contributors(contId, name) VALUES (28, "Axl Rose");

INSERT INTO Song(songId, title, artist) VALUES (30, "Stairway to Heaven", "Led Zeppelin");
INSERT INTO Contributors(contId, name) VALUES (29, "Robert Plant");
INSERT INTO Contributors(contId, name) VALUES (30, "Jimmy Page");

INSERT INTO Song(songId, title, artist) VALUES (31, "Every Breath You Take", "The Police");
INSERT INTO Contributors(contId, name) VALUES (31, "Andy Summers");

INSERT INTO Song(songId, title, artist) VALUES (32, "Under the Bridge", "Red Hot Chili Peppers");
INSERT INTO Contributors(contId, name) VALUES (32, "Anthony Kiedis");

INSERT INTO Song(songId, title, artist) VALUES (33, "Numb", "Linkin Park");
INSERT INTO Contributors(contId, name) VALUES (33, "Chester Bennington");
INSERT INTO Contributors(contId, name) VALUES (34, "Mike Shinoda");

INSERT INTO File(fileId, filename) VALUES(1, "Hey Jude.mp4");

INSERT INTO File(fileId, filename) VALUES(2, "Thriller.mp4");

INSERT INTO File(fileId, filename) VALUES(3, "Bohemian Rhapsody.mp4");

INSERT INTO File(fileId, filename) VALUES(4, "Hello.mp4");

INSERT INTO File(fileId, filename) VALUES(5, "Shape of You.mp4");
INSERT INTO File(fileId, filename) VALUES(6, "Shape of You-Acoustic.mp4");

INSERT INTO File(fileId, filename) VALUES(7, "Shake It Off.mp4");

INSERT INTO File(fileId, filename) VALUES(8, "Can't Help Falling in Love.mp4");

INSERT INTO File(fileId, filename) VALUES(9, "Single Ladies (Put a Ring on It).mp4");
INSERT INTO File(fileId, filename) VALUES(10, "Single Ladies (Put a Ring on It)-Acoustic.mp4");

INSERT INTO File(fileId, filename) VALUES(11, "Umbrella.mp4");
INSERT INTO File(fileId, filename) VALUES(12, "Umbrella-Clean.mp4");

INSERT INTO File(fileId, filename) VALUES(13, "Just the Way You Are.mp4");

INSERT INTO File(fileId, filename) VALUES(14, "Firework.mp4");

INSERT INTO File(fileId, filename) VALUES(15, "Viva la Vida.mp4");
INSERT INTO File(fileId, filename) VALUES(16, "Viva la Vida-Clean.mp4");

INSERT INTO File(fileId, filename) VALUES(17, "Lose Yourself.mp4");

INSERT INTO File(fileId, filename) VALUES(18, "Moves Like Jagger.mp4");
INSERT INTO File(fileId, filename) VALUES(19, "Moves Like Jagger-Clean.mp4");

INSERT INTO File(fileId, filename) VALUES(20, "Thank U, Next.mp4");
INSERT INTO File(fileId, filename) VALUES(21, "Thank U, Next-Clean.mp4");

INSERT INTO File(fileId, filename) VALUES(22, "Sorry.mp4");

INSERT INTO File(fileId, filename) VALUES(23, "In My Feelings.mp4");
INSERT INTO File(fileId, filename) VALUES(24, "In My Feelings-Remix.mp4");

INSERT INTO File(fileId, filename) VALUES(25, "I Will Always Love You.mp4");
INSERT INTO File(fileId, filename) VALUES(26, "I Will Always Love You-Acoustic.mp4");

INSERT INTO File(fileId, filename) VALUES(27, "Purple Rain.mp4");

INSERT INTO File(fileId, filename) VALUES(28, "(I Can't Get No) Satisfaction.mp4");
INSERT INTO File(fileId, filename) VALUES(29, "(I Can't Get No) Satisfaction-Remix.mp4");

INSERT INTO File(fileId, filename) VALUES(30, "No Woman, No Cry.mp4");
INSERT INTO File(fileId, filename) VALUES(31, "No Woman, No Cry-Clean.mp4");

INSERT INTO File(fileId, filename) VALUES(32, "Like a Prayer.mp4");
INSERT INTO File(fileId, filename) VALUES(33, "Like a Prayer-Clean.mp4");

INSERT INTO File(fileId, filename) VALUES(34, "Your Song.mp4");

INSERT INTO File(fileId, filename) VALUES(35, "With or Without You.mp4");
INSERT INTO File(fileId, filename) VALUES(36, "With or Without You-Clean.mp4");

INSERT INTO File(fileId, filename) VALUES(37, "Blinding Lights.mp4");
INSERT INTO File(fileId, filename) VALUES(38, "Blinding Lights-Remix.mp4");

INSERT INTO File(fileId, filename) VALUES(39, "Comfortably Numb.mp4");

INSERT INTO File(fileId, filename) VALUES(40, "Dreams.mp4");
INSERT INTO File(fileId, filename) VALUES(41, "Dreams-Acoustic.mp4");

INSERT INTO File(fileId, filename) VALUES(42, "Smells Like Teen Spirit.mp4");

INSERT INTO File(fileId, filename) VALUES(43, "Sweet Child o' Mine.mp4");
INSERT INTO File(fileId, filename) VALUES(44, "Sweet Child o' Mine-Remix.mp4");

INSERT INTO File(fileId, filename) VALUES(45, "Stairway to Heaven.mp4");

INSERT INTO File(fileId, filename) VALUES(46, "Every Breath You Take.mp4");
INSERT INTO File(fileId, filename) VALUES(47, "Every Breath You Take-Remix.mp4");

INSERT INTO File(fileId, filename) VALUES(48, "Under the Bridge.mp4");

INSERT INTO File(fileId, filename) VALUES(49, "Numb.mp4");

INSERT INTO Feature(songId, contId, role) VALUES (1, 1, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (1, 2, "Bassist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (1, 3, "Lead Guitarist");
INSERT INTO Feature(songId, contId, role) VALUES (2, 4, "Lead Vocalist, Producer, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (3, 5, "Lead Vocalist, Pianist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (3, 6, "Lead Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (5, 7, "Lead Vocalist, Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (6, 8, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (7, 9, "Lead Vocalist");
INSERT INTO Feature(songId, contId, role) VALUES (10, 10, "Lead Vocalist, Songwriter, Instrumentalist");
INSERT INTO Feature(songId, contId, role) VALUES (11, 11, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (12, 12, "Lead Vocalist, Pianist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (14, 13, "Lead Vocalist, Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (14, 14, "Lead Guitarist");
INSERT INTO Feature(songId, contId, role) VALUES (15, 15, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (16, 16, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (18, 17, "Lead Vocalist");
INSERT INTO Feature(songId, contId, role) VALUES (20, 18, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (20, 19, "Lead Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (21, 20, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (23, 21, "Lead Vocalist, Pianist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (25, 22, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (26, 23, "Lead Vocalist, Bassist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (26, 24, "Lead Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (27, 25, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (27, 26, "Lead Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (28, 27, "Lead Vocalist, Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (29, 28, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (30, 29, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (30, 30, "Lead Guitarist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (31, 31, "Guitarist");
INSERT INTO Feature(songId, contId, role) VALUES (32, 32, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (33, 33, "Lead Vocalist, Songwriter");
INSERT INTO Feature(songId, contId, role) VALUES (33, 34, "Rapper, Songwriter");

INSERT INTO Stored(songId, fileId, version) VALUES (1, 1, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (2, 2, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (3, 3, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (4, 4, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (5, 5, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (5, 6, "Acoustic");
INSERT INTO Stored(songId, fileId, version) VALUES (6, 7, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (7, 8, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (8, 9, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (8, 10, "Acoustic");
INSERT INTO Stored(songId, fileId, version) VALUES (9, 11, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (9, 12, "Clean");
INSERT INTO Stored(songId, fileId, version) VALUES (10, 13, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (11, 14, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (12, 15, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (12, 16, "Clean");
INSERT INTO Stored(songId, fileId, version) VALUES (13, 17, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (14, 18, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (14, 19, "Clean");
INSERT INTO Stored(songId, fileId, version) VALUES (15, 20, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (15, 21, "Clean");
INSERT INTO Stored(songId, fileId, version) VALUES (16, 22, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (17, 23, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (17, 24, "Remix");
INSERT INTO Stored(songId, fileId, version) VALUES (18, 25, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (18, 26, "Acoustic");
INSERT INTO Stored(songId, fileId, version) VALUES (19, 27, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (20, 28, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (20, 29, "Remix");
INSERT INTO Stored(songId, fileId, version) VALUES (21, 30, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (21, 31, "Clean");
INSERT INTO Stored(songId, fileId, version) VALUES (22, 32, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (22, 33, "Clean");
INSERT INTO Stored(songId, fileId, version) VALUES (23, 34, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (24, 35, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (24, 36, "Clean");
INSERT INTO Stored(songId, fileId, version) VALUES (25, 37, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (25, 38, "Remix");
INSERT INTO Stored(songId, fileId, version) VALUES (26, 39, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (27, 40, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (27, 41, "Acoustic");
INSERT INTO Stored(songId, fileId, version) VALUES (28, 42, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (29, 43, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (29, 44, "Remix");
INSERT INTO Stored(songId, fileId, version) VALUES (30, 45, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (31, 46, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (31, 47, "Remix");
INSERT INTO Stored(songId, fileId, version) VALUES (32, 48, "Orginal");
INSERT INTO Stored(songId, fileId, version) VALUES (33, 49, "Orginal");
