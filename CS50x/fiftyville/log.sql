-- Keep a log of any SQL queries you execute as you solve the mystery.

-- The CS50 Duck has been stolen! The town of Fiftyville has called upon you to solve the mystery of the stolen duck.
-- Authorities believe that the thief stole the duck and then, shortly afterwards, took a flight out of town with
-- the help of an accomplice. Your goal is to identify:
-- Who the thief is,
-- What city the thief escaped to, and
-- Who the thief’s accomplice is who helped them escape
-- All you know is that the theft took place on July 28, 2023 and that it took place on Humphrey Street.


-- tables

-- airports              crime_scene_reports   people
-- atm_transactions      flights               phone_calls
-- bakery_security_logs  interviews
-- bank_accounts         passengers

SELECT description
FROM crime_scene_reports
WHERE month = 7 AND day = 28
AND street = 'Humphrey Street';


-- crime_scene_report description

-- Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
-- Interviews were conducted today with three witnesses who were present at the time
-- each of their interview transcripts mentions the bakery.
-- Littering took place at 16:36. No known witnesses.

-- CREATE TABLE bakery_security_logs (
--     id INTEGER,
--     year INTEGER,
--     month INTEGER,
--     day INTEGER,
--     hour INTEGER,
--     minute INTEGER,
--     activity TEXT,
--     license_plate TEXT,
--     PRIMARY KEY(id)
-- );

-- CREATE TABLE interviews (
--     id INTEGER,
--     name TEXT,
--     year INTEGER,
--     month INTEGER,
--     day INTEGER,
--     transcript TEXT,
--     PRIMARY KEY(id)
-- );

SELECT minute, activity, license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND activity = 'exit' ;

-- +--------+----------+---------------+
-- | minute | activity | license_plate |
-- +--------+----------+---------------+
-- | 16     | exit     | 5P2BI95       |
-- | 18     | exit     | 94KL13X       |
-- | 18     | exit     | 6P58WS2       |
-- | 19     | exit     | 4328GD8       |
-- | 20     | exit     | G412CB7       |
-- | 21     | exit     | L93JTIZ       |
-- | 23     | exit     | 322W7JE       |
-- | 23     | exit     | 0NTHK55       |
-- | 35     | exit     | 1106N58       |
-- +--------+----------+---------------+

SELECT name, transcript FROM interviews WHERE month = 7 AND day = 28  ;


-- | Jose    | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from
--           | the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”


-- | Eugene  | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed
--           | at your having gone to the ball.”


-- | Barbara | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent.
--           | “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.

---------------------------------------------------------------------------------------------------------------------------------
-- | Ruth    | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking
--           | lot and drive away. If you have security footage from the bakery parking lot, you might want
--           | to look for cars that left the parking lot in that time frame.

SELECT minute, activity, license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND activity = 'exit' ;

-- +--------+----------+---------------+
-- | minute | activity | license_plate |
-- +--------+----------+---------------+
-- | 16     | exit     | 5P2BI95       |
-- | 18     | exit     | 94KL13X       |
-- | 18     | exit     | 6P58WS2       |
-- | 19     | exit     | 4328GD8       |
-- | 20     | exit     | G412CB7       |
-- | 21     | exit     | L93JTIZ       |
-- | 23     | exit     | 322W7JE       |
-- | 23     | exit     | 0NTHK55       |
-- | 35     | exit     | 1106N58       |
-- +--------+----------+---------------+


-- CREATE TABLE people (
--     id INTEGER,
--     name TEXT,
--     phone_number TEXT,
--     passport_number INTEGER,
--     license_plate TEXT,
--     PRIMARY KEY(id)
-- );

--------------------------------------------------------------------------------------------------------------------------------
-- | Eugene  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived
--           | at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.

-- CREATE TABLE atm_transactions (
--     id INTEGER,
--     account_number INTEGER,
--     year INTEGER,
--     month INTEGER,
--     day INTEGER,
--     atm_location TEXT,
--     transaction_type TEXT,
--     amount INTEGER,
--     PRIMARY KEY(id)
-- );
-- CREATE TABLE bank_accounts (
--     account_number INTEGER,
--     person_id INTEGER,
--     creation_year INTEGER,
--     FOREIGN KEY(person_id) REFERENCES people(id)
-- );


SELECT account_number, transaction_type FROM atm_transactions WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street' ;

-- +----------------+------------------+
-- | account_number | transaction_type |
-- +----------------+------------------+
-- | 28500762       | withdraw         |
-- | 28296815       | withdraw         |
-- | 76054385       | withdraw         |
-- | 49610011       | withdraw         |
-- | 16153065       | withdraw         |
-- | 86363979       | deposit          |
-- | 25506511       | withdraw         |
-- | 81061156       | withdraw         |
-- | 26013199       | withdraw         |
-- +----------------+------------------+

-- CREATE TABLE people (
--     id INTEGER,
--     name TEXT,
--     phone_number TEXT,
--     passport_number INTEGER,
--     license_plate TEXT,
--     PRIMARY KEY(id)
-- );


----------------------------------------------------------------------------------------------------------------------------------
-- | Raymond | As the thief was leaving the bakery, they called someone who talked to them for less than a minute.
--           | In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
--           | The thief then asked the person on the other end of the phone to purchase the flight ticket.

-- CREATE TABLE people (
--     id INTEGER,
--     name TEXT,
--     phone_number TEXT,
--     passport_number INTEGER,
--     license_plate TEXT,
--     PRIMARY KEY(id)
-- );

SELECT caller, receiver, duration FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60;

-- +----------------+----------------+----------+
-- |     caller     |    receiver    | duration |
-- +----------------+----------------+----------+
-- | (130) 555-0289 | (996) 555-8899 | 51       |
-- | (499) 555-9472 | (892) 555-8872 | 36       |
-- | (367) 555-5533 | (375) 555-8161 | 45       |
-- | (499) 555-9472 | (717) 555-1342 | 50       |
-- | (286) 555-6063 | (676) 555-6554 | 43       |
-- | (770) 555-1861 | (725) 555-3243 | 49       |
-- | (031) 555-6622 | (910) 555-3251 | 38       |
-- | (826) 555-1652 | (066) 555-9701 | 55       |
-- | (338) 555-6650 | (704) 555-2131 | 54       |
-- +----------------+----------------+----------+

SELECT name, phone_number, license_plate, passport_number FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE month = 7
 AND day = 28 AND duration < 60);
-- +------------+----------------+---------------+-----------------+
-- |    name    |  phone_number  | license_plate | passport_number |
-- +------------+----------------+---------------+-----------------+
-- | James      | (676) 555-6554 | Q13SVG6       | 2438825627      |
-- | Larry      | (892) 555-8872 | O268ZZ0       | 2312901747      |
-- | Anna       | (704) 555-2131 | NULL          | NULL            |
-- | Jack       | (996) 555-8899 | 52R0Y8U       | 9029462229      |
-- | Melissa    | (717) 555-1342 | NULL          | 7834357192      |
-- | Jacqueline | (910) 555-3251 | 43V0R5D       | NULL            |
-- | Philip     | (725) 555-3243 | GW362R6       | 3391710505      |
-- | Robin      | (375) 555-8161 | 4V16VO0       | NULL            |
-- | Doris      | (066) 555-9701 | M51FA04       | 7214083635      |
-- +------------+----------------+---------------+-----------------+

SELECT passport_number FROM people WHERE phone_number IN (SELECT caller FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60);
-- +-----------------+
-- | caller_pass.... |
-- +-----------------+
-- | 9878712108      |
-- | 1695452385      |
-- | 9586786673      |
-- | 1988161715      |
-- | 3592750733      |
-- | 8294398571      |
-- | 5773159633      |
-- | 9628244268      |
-- +-----------------+

SELECT name, phone_number, license_plate, passport_number FROM people WHERE phone_number IN (SELECT caller FROM phone_calls WHERE month = 7 A
ND day = 28 AND duration < 60);
-- +---------+----------------+---------------+-----------------+
-- |  name   |  phone_number  | license_plate | passport_number |
-- +---------+----------------+---------------+-----------------+
-- | Kenny   | (826) 555-1652 | 30G67EN       | 9878712108      |
-- | Sofia   | (130) 555-0289 | G412CB7       | 1695452385      |
-- | Benista | (338) 555-6650 | 8X428L0       | 9586786673      |
-- | Taylor  | (286) 555-6063 | 1106N58       | 1988161715      |
-- | Diana   | (770) 555-1861 | 322W7JE       | 3592750733      |
-- | Kelsey  | (499) 555-9472 | 0NTHK55       | 8294398571      |
-- | Bruce   | (367) 555-5533 | 94KL13X       | 5773159633      |
-- | Carina  | (031) 555-6622 | Q12B3Z3       | 9628244268      |
-- +---------+----------------+---------------+-----------------+

SELECT passport_number FROM people WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60);
-- +-----------------+
-- | reciever_pass.. |
-- +-----------------+
-- | 2438825627      |
-- | 2312901747      |
-- | NULL            |
-- | 9029462229      |
-- | 7834357192      |
-- | NULL            |
-- | 3391710505      |
-- | NULL            |
-- | 7214083635      |
-- +-----------------+

-- CREATE TABLE phone_calls (
--     id INTEGER,
--     caller TEXT,
--     receiver TEXT,
--     year INTEGER,
--     month INTEGER,
--     day INTEGER,
--     duration INTEGER,
--     PRIMARY KEY(id)
-- );

SELECT passport_number, flight_id
FROM passengers
    WHERE passport_number IN (
        SELECT passport_number
        FROM people
            WHERE phone_number IN (
                SELECT receiver
                FROM phone_calls
                    WHERE month = 7 AND day = 28 AND duration < 60
                ) OR (
                SELECT caller
                FROM phone_calls
                    WHERE month = 7 AND day = 28 AND duration < 60
                )
);
-- +-----------------+-----------+
-- | passport_number | flight_id |
-- +-----------------+-----------+
-- | 3391710505      | 10        |
-- | 2438825627      | 10        |
-- | 2312901747      | 17        |
-- | 7834357192      | 17        |
-- | 2438825627      | 21        |
-- | 9029462229      | 22        |
-- | 7834357192      | 25        |
-- | 3391710505      | 28        |
-- | 7214083635      | 36        |
-- | 2312901747      | 37        |
-- | 3391710505      | 47        |
-- | 2438825627      | 47        |
-- | 2312901747      | 53        |
-- | 7834357192      | 53        |
-- +-----------------+-----------+

-- CREATE TABLE airports (
--     id INTEGER,
--     abbreviation TEXT,
--     full_name TEXT,
--     city TEXT,
--     PRIMARY KEY(id)
-- );

SELECT full_name FROM airports WHERE id = 8;
-- +-----------------------------+
-- |          full_name          |
-- +-----------------------------+
-- | Fiftyville Regional Airport |
-- +-----------------------------+

SELECT * FROM airports WHERE id IN (SELECT destination_airport_id FROM flights WHERE id IN ( SELECT flight_id FROM passengers WHERE p
assport_number IN ( SELECT passport_number FROM people WHERE phone_number IN ( SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND dura
tion < 60 ) OR phone_number IN ( SELECT caller FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60 ) ) ) AND month = 7 AND day = 29);
-- +----+--------------+-----------------------------+---------------+
-- | id | abbreviation |          full_name          |     city      |
-- +----+--------------+-----------------------------+---------------+
-- | 4  | LGA          | LaGuardia Airport           | New York City |
-- | 6  | BOS          | Logan International Airport | Boston        |
-- | 9  | HND          | Tokyo International Airport | Tokyo         |
-- +----+--------------+-----------------------------+---------------+

-- CREATE TABLE flights (
--     id INTEGER,
--     origin_airport_id INTEGER,
--     destination_airport_id INTEGER,
--     year INTEGER,
--     month INTEGER,
--     day INTEGER,
--     hour INTEGER,
--     minute INTEGER,
--     PRIMARY KEY(id),
--     FOREIGN KEY(origin_airport_id) REFERENCES airports(id),
--     FOREIGN KEY(destination_airport_id) REFERENCES airports(id)
-- );

SELECT *
FROM flights
WHERE id IN (
    SELECT flight_id
    FROM passengers
    WHERE passport_number IN (
        SELECT passport_number
        FROM people
        WHERE phone_number IN (
            SELECT receiver
            FROM phone_calls
            WHERE month = 7 AND day = 28 AND duration < 60
        ) OR phone_number IN (
            SELECT caller
            FROM phone_calls
            WHERE month = 7 AND day = 28 AND duration < 60
        )
    )
) AND month = 7 AND day = 29;

-- +----+-------------------+------------------------+------+-------+-----+------+--------+
-- | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
-- +----+-------------------+------------------------+------+-------+-----+------+--------+
-- | 18 | 8                 | 6                      | 2023 | 7     | 29  | 16   | 0      |
-- | 36 | 8                 | 4                      | 2023 | 7     | 29  | 8    | 20     |
-- | 53 | 8                 | 9                      | 2023 | 7     | 29  | 15   | 20     |
-- +----+-------------------+------------------------+------+-------+-----+------+--------+

-- CREATE TABLE passengers (
--     flight_id INTEGER,
--     passport_number INTEGER,
--     seat TEXT,
--     FOREIGN KEY(flight_id) REFERENCES flights(id)
-- );


---------------------------------------------------------------------------------------------------------------------------------

-- | Lily    | Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and
--           | Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have s
--           | uccessfully arrived in Paris.


SELECT name
FROM people
WHERE id IN (
    SELECT id
    FROM people
    WHERE phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE month = 7 AND day = 28 AND duration < 60
    )
    OR phone_number IN (
        SELECT receiver
        FROM phone_calls
        WHERE month = 7 AND day = 28 AND duration < 60
    )
    AND id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street'
        )
    )
    AND id IN (
        SELECT id
        FROM people
        WHERE license_plate IN (
            SELECT license_plate
            FROM bakery_security_logs
            WHERE month = 7 AND day = 28 AND hour = 10 AND activity = 'exit'
        )
    )
);


-- +---------+
-- |  name   |
-- +---------+
-- | Kenny   |
-- | Sofia   |
-- | Benista |
-- | Taylor  |
-- | Diana   |
-- | Kelsey  |
-- | Bruce   |
-- | Carina  |
-- +---------+



SELECT * FROM people
WHERE passport_number IN
(SELECT passport_number
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE phone_number IN (
        SELECT receiver
        FROM phone_calls
        WHERE month = 7 AND day = 28 AND duration < 60
    )
    OR phone_number IN (
        SELECT caller
        FROM phone_calls
        WHERE month = 7 AND day = 28 AND duration < 60
    )
)
AND passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT person_id
        FROM bank_accounts
        WHERE account_number IN (
            SELECT account_number
            FROM atm_transactions
            WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street'
        )
    )
)
AND passport_number IN (
    SELECT passport_number
    FROM people
    WHERE id IN (
        SELECT id
        FROM people
        WHERE license_plate IN (
            SELECT license_plate
            FROM bakery_security_logs
            WHERE month = 7 AND day = 28 AND hour = 10 AND activity = 'exit'
        )
    )
));

-- +--------+--------+----------------+-----------------+---------------+
-- |   id   |  name  |  phone_number  | passport_number | license_plate |
-- +--------+--------+----------------+-----------------+---------------+
-- | 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       |
-- | 514354 | Diana  | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
-- +--------+--------+----------------+-----------------+---------------+


SELECT passport_number, flight_id
FROM passengers
    WHERE passport_number IN
    (SELECT passport_number
    FROM passengers
    WHERE passport_number
    IN (
        SELECT passport_number
        FROM people
            WHERE phone_number
                IN (
                    SELECT receiver
                    FROM phone_calls
                    WHERE month = 7
                        AND day = 28 AND duration < 60
                            )
                            OR phone_number IN (
                                SELECT caller
                                FROM phone_calls
                                WHERE month = 7
                                AND day = 28 AND duration < 60
                                )
        )
    AND passport_number
    IN (
            SELECT passport_number
            FROM people
            WHERE id IN (
                 SELECT person_id
                 FROM bank_accounts
                 WHERE account_number IN (
                 SELECT account_number
                 FROM atm_transactions
                 WHERE month = 7 AND day = 28 AND atm_location = 'Leggett Street'
                            )
                        )
        )
    AND passport_number
    IN (
            SELECT passport_number
            FROM people
            WHERE id IN (
                        SELECT id
                        FROM people
                        WHERE license_plate IN (
                            SELECT license_plate
                            FROM bakery_security_logs
                            WHERE month = 7 AND day = 28 AND hour = 10
                            AND activity = 'exit'
                                )
                        )
        )
);
-- +-----------------+-----------+
-- | passport_number | flight_id |
-- +-----------------+-----------+
-- | 3592750733      | 18        |
-- | 3592750733      | 24        |
-- | 5773159633      | 36        |
-- | 1988161715      | 36        |
-- | 3592750733      | 54        |
-- +-----------------+-----------+
