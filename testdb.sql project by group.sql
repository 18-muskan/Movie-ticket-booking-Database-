-- Create Users TablE
CREATE TABLE Users 
(
    UserID INT PRIMARY KEY,
    UserName VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE,
    Password VARCHAR2(255),
    PhoneNumber VARCHAR2(15),
    RegisteredDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT *FROM  Users;
INSERT INTO Users (UserID, UserName, Email, Password, PhoneNumber) 
VALUES (1, 'JUNAID AHMED', 'jUNAID@gmail.com', 'password123', '0334422910');
INSERT INTO Users (UserID, UserName, Email, Password, PhoneNumber) 
VALUES (2, 'ISMAIL HAROON', 'ISMAIL@gmail.com', 'password999', '03657890111');
INSERT INTO Users (UserID, UserName, Email, Password, PhoneNumber) 
VALUES (3, 'bilal HAROON', 'bilal@gmail.com', 'password999', '03657890111');
INSERT INTO Users (UserID, UserName, Email, Password, PhoneNumber) 
VALUES (4, 'saba HAROON', 'saba@gmail.com', 'password999', '03657890111');
-- Create Movies Table
CREATE TABLE Movies 
(
    MovieID INT PRIMARY KEY ,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT,
    ReleaseDate DATE,
    Language VARCHAR(50),
    Rating FLOAT 
);
SELECT *FROM  Movies;
-- Insert Movies 
INSERT INTO Movies (MOVIEID, Title, Genre, Duration, ReleaseDate, Language, Rating)
VALUES (1, 'Avengers: Endgame', 'Action', 181, TO_DATE('2019-04-26', 'YYYY-MM-DD'), 'English', 8.4);
INSERT INTO Movies (MOVIEID, Title, Genre, Duration, ReleaseDate, Language, Rating)
VALUES (2, 'Warrior', 'Action', 148, TO_DATE('2016-07-16', 'YYYY-MM-DD'), 'English', 8.8);
INSERT INTO Movies (MOVIEID, Title, Genre, Duration, ReleaseDate, Language, Rating)
VALUES (3, 'punjab nhi jana', 'comedy', 178, TO_DATE('2022-08-16', 'YYYY-MM-DD'), 'urdu/hindi', 8.8);
INSERT INTO Movies (MOVIEID, Title, Genre, Duration, ReleaseDate, Language, Rating)
VALUES (4, 'chupke chupke', 'comedy', 138, TO_DATE('2023-9-16', 'YYYY-MM-DD'), 'urdu/hindi', 8.8);
-- Create Theaters Table
CREATE TABLE Theaters 
(
    TheaterID INT PRIMARY KEY ,
    TheaterName VARCHAR(100),
    Location VARCHAR(150),
    TotalSeats INT
);
SELECT *FROM  Theaters ;
-- Insert Theaters
INSERT INTO Theaters (THEATERID, TheaterName, Location, TotalSeats)
VALUES (1, 'Universal Cinema', 'Emporium', 200);
INSERT INTO Theaters (THEATERID, TheaterName, Location, TotalSeats)
VALUES (2, 'Cinegold Cinemas', 'Bahria Town', 150);
INSERT INTO Theaters (THEATERID, TheaterName, Location, TotalSeats)
VALUES (3, 'Cinegold Cinemas', 'Bahria Town', 150);
INSERT INTO Theaters (THEATERID, TheaterName, Location, TotalSeats)
VALUES (4, 'Cinegold Cinemas', 'Bahria Town', 150);
-- Create Shows Table
CREATE TABLE Shows
(
   ShowID INT PRIMARY KEY,
   MovieID INT,
   TheaterID INT,
   ShowDate DATE,
   StartTime TIMESTAMP,   
   PricePerSeat DECIMAL(10, 2),
   FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
   FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);
SELECT *FROM  Shows ;
INSERT INTO Shows (ShowID, MovieID, TheaterID, ShowDate, StartTime, PricePerSeat)
VALUES (1, 1, 1, TO_DATE('2023-07-09', 'YYYY-MM-DD'), TO_TIMESTAMP('19:00:00', 'HH24:MI:SS'), 1500);
INSERT INTO Shows (ShowID, MovieID, TheaterID, ShowDate, StartTime, PricePerSeat)
VALUES (2, 2, 2, TO_DATE('2023-07-09', 'YYYY-MM-DD'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'), 1600);
INSERT INTO Shows (ShowID, MovieID, TheaterID, ShowDate, StartTime, PricePerSeat)
VALUES (3, 3, 3, TO_DATE('2023-07-09', 'YYYY-MM-DD'), TO_TIMESTAMP('18:00:00', 'HH24:MI:SS'), 1500);
INSERT INTO Shows (ShowID, MovieID, TheaterID, ShowDate, StartTime, PricePerSeat)
VALUES (4, 4, 4, TO_DATE('2023-07-09', 'YYYY-MM-DD'), TO_TIMESTAMP('23:00:00', 'HH24:MI:SS'), 1500);
-- Create Bookings Table
CREATE TABLE Bookings 
(
    BookingID INT PRIMARY KEY,
    UserID INT,
    ShowID INT,
    SeatsBooked INT,
    TotalAmount DECIMAL(10, 2),
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentStatus VARCHAR2(20) CHECK (PaymentStatus IN ('Pending', 'Completed')),  
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID)
);
SELECT *FROM  Bookings ;
DELETE  FROM Bookings;
INSERT INTO Bookings (BookingID, BookingDate, UserID, ShowID, SeatsBooked, TotalAmount, PaymentStatus) 
VALUES (1, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 1, 1, 3, 3800.00, 'Pending');
INSERT INTO Bookings (BookingID, BookingDate, UserID, ShowID, SeatsBooked, TotalAmount, PaymentStatus) 
VALUES (3, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 3, 3, 3, 3300.00, 'Completed');
INSERT INTO Bookings (BookingID, BookingDate, UserID, ShowID, SeatsBooked, TotalAmount, PaymentStatus) 
VALUES (5, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 2, 2, 3, 3600.00, 'Completed');
INSERT INTO Bookings (BookingID, BookingDate, UserID, ShowID, SeatsBooked, TotalAmount, PaymentStatus) 
VALUES (6, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 4, 4, 3, 3500.00, 'Completed');
-- Create Payments Table
CREATE TABLE Payments
(
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    AmountPaid DECIMAL(10, 2),
    PaymentMode VARCHAR2(20) CHECK (PaymentMode IN ('Credit Card', 'Debit Card', 'Online Net Banking')),  
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
SELECT *FROM  Payments ;
-- Insert Payments
INSERT INTO Payments (PaymentID, BookingID, AmountPaid, PaymentMode, PaymentDate) 
VALUES (1, 1, 2000.00, 'Credit Card', TO_DATE('2023-07-10', 'YYYY-MM-DD'));
INSERT INTO Payments (PaymentID, BookingID, AmountPaid, PaymentMode, PaymentDate) 
VALUES (2, 3, 2200.00, 'Credit Card', TO_DATE('2023-07-11', 'YYYY-MM-DD'));
INSERT INTO Payments (PaymentID, BookingID, AmountPaid, PaymentMode, PaymentDate) 
VALUES (3, 5, 2500.00, 'Credit Card', TO_DATE('2023-07-12', 'YYYY-MM-DD'));
INSERT INTO Payments (PaymentID, BookingID, AmountPaid, PaymentMode, PaymentDate) 
VALUES (4, 6, 2000.00, 'Credit Card', TO_DATE('2023-07-13', 'YYYY-MM-DD'));
CREATE TABLE Feedback 
(
    FeedbackID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 10),
    Comments CLOB,  -- Using CLOB for large text data
    FeedbackDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Using TIMESTAMP for date and time
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);
SELECT *FROM Feedback ;
INSERT INTO Feedback (FeedbackID, UserID, MovieID, Rating, Comments)
VALUES (1, 1, 1, 8, 'Great movie, really enjoyed the storyline!');
INSERT INTO Feedback (FeedbackID, UserID, MovieID, Rating, Comments)
VALUES (2, 2, 2, 5, 'Great movie, really enjoyed it!');
INSERT INTO Feedback (FeedbackID, UserID, MovieID, Rating, Comments)
VALUES (3, 3, 3, 7, 'Great movie!');
INSERT INTO Feedback (FeedbackID, UserID, MovieID, Rating, Comments)
VALUES (4, 4, 4, 8, 'Great movie');
CREATE TABLE UpcomingShows
(
    ShowID INT PRIMARY KEY,
    MovieID INT,
    TheaterID INT,
    ShowDate DATE,
    StartTime TIMESTAMP,
    PricePerSeat DECIMAL(10, 2),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);
SELECT *FROM UpcomingShows ;
-- Insert data into UpcomingShows table
INSERT INTO UpcomingShows (ShowID, MovieID, TheaterID, ShowDate, StartTime, PricePerSeat)
VALUES (1, 1, 1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_TIMESTAMP('19:00:00', 'HH24:MI:SS'), 1500.00);
INSERT INTO UpcomingShows (ShowID, MovieID, TheaterID, ShowDate, StartTime, PricePerSeat)
VALUES (2, 2, 2, TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'), 1600.00);
INSERT INTO UpcomingShows (ShowID, MovieID, TheaterID, ShowDate, StartTime, PricePerSeat)
VALUES (3, 3, 3, TO_DATE('2023-12-10', 'YYYY-MM-DD'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 1200.00);
CREATE TABLE LoyaltyPointsView
(
    UserID INT PRIMARY KEY,
    Points INT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
SELECT * FROM LoyaltyPointsView;
INSERT INTO LoyaltyPointsView (UserID, Points)
VALUES (1, 100);
INSERT INTO LoyaltyPointsView (UserID-- Inserting user preferences data
VALUES (2, 100);
INSERT INTO LoyaltyPointsView (UserID, Points)
VALUES (3, 100);
INSERT INTO LoyaltyPointsView (UserID, Points) 
VALUES (4, 100);
CREATE TABLE MoviePromotions
(
    PromotionID INT PRIMARY KEY,
    PromotionName VARCHAR(100),
    DiscountPercent DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    BannerImage BLOB
);
SELECT * FROM  MoviePromotions;
-- Insert data into MoviePromotions
INSERT INTO MoviePromotions (PromotionID, PromotionName, DiscountPercent, StartDate, EndDate, BannerImage)
VALUES (1, 'Holiday Special', 20, TO_DATE('2024-12-20', 'YYYY-MM-DD'), TO_DATE('2024-12-25', 'YYYY-MM-DD'), 22);
INSERT INTO MoviePromotions (PromotionID, PromotionName, DiscountPercent, StartDate, EndDate, BannerImage)
VALUES (2, 'Weekend Offer', 15, TO_DATE('2024-11-17', 'YYYY-MM-DD'), TO_DATE('2024-11-18', 'YYYY-MM-DD'), 777);
CREATE TABLE Memberships
(
    MembershipID INT PRIMARY KEY,
    UserID INT,
    MembershipType VARCHAR2(10),
    ExpiryDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT chk_membership_type CHECK (MembershipType IN ('Basic', 'Premium', 'VIP'))
);
SELECT * FROM Memberships;
-- Insert data into Memberships
INSERT INTO Memberships (MembershipID, UserID, MembershipType, ExpiryDate) 
VALUES (1, 1, 'Premium', TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO Memberships (MembershipID, UserID, MembershipType, ExpiryDate) 
VALUES (2, 2, 'VIP', TO_DATE('2024-11-30', 'YYYY-MM-DD'));
CREATE TABLE MoviesPoster
(
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    Genre VARCHAR(100),
    ReleaseYear INT,
    Rating DECIMAL(3,1),
    PosterImage BLOB
);
SELECT * FROM MoviesPoster;
-- Inserting Movie Posters with BLOB data
INSERT INTO MoviesPoster (MovieID, Title, Genre, ReleaseYear, Rating, PosterImage)
VALUES (1, 'Avengers: Endgame', 'Action', 2019, 8.4,null);
INSERT INTO MoviesPoster (MovieID, Title, Genre, ReleaseYear, Rating, PosterImage)
VALUES (2, 'punjab nhi jana', 'Action', 2019, 8.4,null);
INSERT INTO MoviesPoster (MovieID, Title, Genre, ReleaseYear, Rating, PosterImage)
VALUES (3, 'Avengers: Endgame', 'Action', 2019, 8.4,null);
INSERT INTO MoviesPoster (MovieID, Title, Genre, ReleaseYear, Rating, PosterImage)
VALUES (4, 'chupke chupke', 'Action', 2019, 8.4,null);
CREATE TABLE UserPreferences 
(
    PreferenceID INT PRIMARY KEY,
    UserID INT,
    Genre VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
SELECT * FROM UserPreferences;
-- Inserting user preferences into the UserPreferences table
INSERT INTO UserPreferences (PreferenceID, UserID, Genre)
VALUES (1, 1, 'Action');
INSERT INTO UserPreferences (PreferenceID, UserID, Genre)
VALUES(2, 2, 'Comedy');
INSERT INTO UserPreferences (PreferenceID, UserID, Genre)
VALUES(3, 3, 'Drama');
INSERT INTO UserPreferences (PreferenceID, UserID, Genre)
VALUES(4, 4, 'Horror');
CREATE TABLE UserWatchHistory 
(
    HistoryID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    WatchDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);
SELECT * FROM UserWatchHistory ;
-- Now insert into UserWatchHistory table
INSERT INTO UserWatchHistory (HistoryID, UserID, MovieID)
VALUES (1, 1, 1);
INSERT INTO UserWatchHistory (HistoryID, UserID, MovieID)
VALUES (2, 2, 2);
INSERT INTO UserWatchHistory (HistoryID, UserID, MovieID)
VALUES(3, 3, 3);
INSERT INTO UserWatchHistory (HistoryID, UserID, MovieID)
VALUES(4, 4, 4);
CREATE TABLE Admin 
(
    AdminID INT PRIMARY KEY,
    AdminName VARCHAR(100),
    AdminEmail VARCHAR(100) UNIQUE,
    AdminPassword VARCHAR(255)
);
SELECT * FROM Admin;
INSERT INTO Admin (AdminID, AdminName, AdminEmail, AdminPassword)
VALUES (1, 'saba', 'saba@gmail.com', 'password123');
INSERT INTO Admin (AdminID, AdminName, AdminEmail, AdminPassword)
VALUES (2, 'muskan', 'muskan@gmail.com', 'password456');
CREATE TABLE Notifications 
(
    NotificationID INT PRIMARY KEY,
    UserID INT,
    Message VARCHAR(255),
    NotificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
SELECT * FROM Notifications;
DELETE FROM Notifications;
INSERT INTO Notifications (NotificationID, UserID, Message)
VALUES (1, 1, 'Your movie has been successfully booked!');
INSERT INTO Notifications (NotificationID, UserID, Message)
VALUES (2, 2, 'Your account has been updated.');
/*upcoming show*/
SELECT 
    Shows.ShowID, 
    Movies.Title AS Movie, 
    Theaters.TheaterName AS Theater, 
    Shows.ShowDate, 
    Shows.StartTime, 
    Shows.PricePerSeat
FROM Shows
JOIN Movies ON Shows.MovieID = Movies.MovieID
JOIN Theaters ON Shows.TheaterID = Theaters.TheaterID;

/*booking histroy*/
SELECT 
    Bookings.BookingID, 
    Movies.Title AS Movie, 
    Theaters.TheaterName AS Theater, 
    Bookings.SeatsBooked, 
    Bookings.TotalAmount, 
    Bookings.BookingDate, 
    Bookings.PaymentStatus
FROM Bookings
JOIN Shows ON Bookings.ShowID = Shows.ShowID
JOIN Movies ON Shows.MovieID = Movies.MovieID
JOIN Theaters ON Shows.TheaterID = Theaters.TheaterID
WHERE Bookings.UserID = 1;
/*movie feedback*/
SELECT 
    Movies.Title,
    AVG(Feedback.Rating) AS AverageRating
FROM Feedback
JOIN Movies ON Feedback.MovieID = Movies.MovieID
GROUP BY Movies.MovieID, Movies.Title;
/*update booking  payment */
UPDATE Bookings
SET PaymentStatus = 'Completed'
WHERE BookingID = 1;
/*update booking seat booked*/
UPDATE Bookings
SET TotalAmount = TotalAmount * 130
WHERE SeatsBooked > 2;
/* total booking*/
SELECT 
    Movies.Title, 
    COUNT(Bookings.BookingID) AS TotalBookings
FROM Bookings
JOIN Shows ON Bookings.ShowID = Shows.ShowID
JOIN Movies ON Shows.MovieID = Movies.MovieID
GROUP BY Movies.MovieID, Movies.Title
ORDER BY TotalBookings DESC
FETCH FIRST 3 ROWS ONLY;

/*membership */
SELECT 
    Users.UserName, 
    Memberships.MembershipType, 
    Memberships.ExpiryDate
FROM Memberships
JOIN Users ON Memberships.UserID = Users.UserID
WHERE MembershipType = 'VIP';
/* theater total ticket sold*/
SELECT 
    Theaters.TheaterName, 
    SUM(Bookings.SeatsBooked) AS TotalTicketsSold
FROM Bookings
JOIN Shows ON Bookings.ShowID = Shows.ShowID
JOIN Theaters ON Shows.TheaterID = Theaters.TheaterID
GROUP BY Theaters.TheaterName
ORDER BY TotalTicketsSold DESC
FETCH FIRST 3 ROWS ONLY;

/*discount for membership holder*/
SELECT 
    Users.UserName,
    Movies.Title,
    Shows.PricePerSeat,
    Memberships.MembershipType,
    CASE 
        WHEN Memberships.MembershipType = 'VIP' THEN Shows.PricePerSeat * 0.8
        WHEN Memberships.MembershipType = 'Premium' THEN Shows.PricePerSeat * 0.9
        ELSE Shows.PricePerSeat
    END AS DiscountedPrice
FROM Users
JOIN Memberships ON Users.UserID = Memberships.UserID
JOIN Bookings ON Users.UserID = Bookings.UserID
JOIN Shows ON Bookings.ShowID = Shows.ShowID
JOIN Movies ON Shows.MovieID = Movies.MovieID;

/*Query to Get the Admin with the Most Users*/
SELECT AdminName, AdminEmail
FROM Admin
WHERE AdminID = (
    SELECT AdminID
    FROM Users
    GROUP BY AdminID
    ORDER BY COUNT(UserID) DESC
    FETCH FIRST 1 ROWS ONLY
);
/*Get Notifications for Users who have Recently Watched a Movie*/
SELECT Message, NotificationDate
FROM Notifications
WHERE UserID IN 
(
    SELECT UserID
    FROM UserWatchHistory
   WHERE WatchDate > SYSDATE - 3
);
/*Get Users Who Have Not Received Any Notifications*/
SELECT UserID, UserName
FROM Users
WHERE UserID NOT IN 
(
    SELECT UserID
    FROM Notifications
);

/*Update Admin Password Based on Admin Email*/
UPDATE Admin
SET AdminPassword = 'newpassword123'
WHERE AdminEmail =
(
    SELECT AdminEmail
    FROM Admin
    WHERE AdminID = 1
);
/*Get the Movie Most Watched by Users*/
SELECT MovieID
FROM UserWatchHistory
GROUP BY MovieID
HAVING COUNT(HistoryID) =
(
    SELECT MAX(WatchCount)
    FROM (
        SELECT MovieID, COUNT(HistoryID) AS WatchCount
        FROM UserWatchHistory
        GROUP BY MovieID
    )
);
/*nsert Notification for Admins when a New Movie is Added*/
INSERT INTO Notifications (NotificationID, UserID, Message)
SELECT seq_notifications.NEXTVAL, a.AdminID, 'A new movie has been added to the system.'
FROM Admin a
WHERE a.AdminID IN (
    SELECT DISTINCT AdminID
    FROM Admin
);
/*Recommend Movies Based on User Preferences*/
SELECT m.MovieID, m.Title
FROM Movies m
WHERE m.Genre IN (
    SELECT Genre
    FROM UserPreferences
    WHERE UserID = 1  -- Replace with dynamic UserID
)
AND m.MovieID NOT IN (
    SELECT MovieID
    FROM UserWatchHistory
    WHERE UserID = 1  -- Replace with dynamic UserID
);
/*Suggest a New Movie Genre*/
SELECT DISTINCT m.Genre
FROM Movies m
WHERE m.Genre NOT IN (
    SELECT DISTINCT m.Genre
    FROM UserWatchHistory uh
    JOIN Movies m ON uh.MovieID = m.MovieID
    WHERE uh.UserID = 1  -- Replace with dynamic UserID
);
/* Active Times for Watching Movies*/
SELECT TO_CHAR(WatchDate, 'HH24') AS Hour, COUNT(*) AS WatchCount
FROM UserWatchHistory
GROUP BY TO_CHAR(WatchDate, 'HH24')
ORDER BY WatchCount DESC;

/*Most Watched Movie by Each User*/
SELECT uh.UserID, m.Title, COUNT(*) AS WatchCount
FROM UserWatchHistory uh
JOIN Movies m ON uh.MovieID = m.MovieID
GROUP BY uh.UserID, m.Title
HAVING COUNT(*) = (
    SELECT MAX(WatchCount)
    FROM (
        SELECT COUNT(*) AS WatchCount
        FROM UserWatchHistory uh2
        WHERE uh2.UserID = uh.UserID
        GROUP BY uh2.MovieID
    )
);

