# DBMS Assignment-2
This repository contains sql files to create tables and data values for these tables. There is an automation script also in python to feed this sql script in your sql server without any effort. It just asks for your sql username and the path of the `.sql` file that has the sql script to be run. 

For example to run script to setup swiggy databse run below command:
```
python3 auto.py
```
OR 
You can just run command 
```
make
```
When asked for path of sql file enter the path (here for swiggy db it will be `./swiggy/swiggy.sql`).
## Writeup for redbus

### For 1NF
1. **Bus Table:** Each column contains single, indivisible values, and each record is uniquely identified by the `BusNumber`..

2. **Driver Table:** Columns store atomic values, and each record is uniquely identified by the `DriverID`.

3. **Conductor Table:** Columns store atomic values, and each record is uniquely identified by the `ConductorID`.

4. **Route Table:** Columns store atomic values, and each record is uniquely identified by the `RouteID`. It could have contained stops as a multiple value attribute but more than 1 route could have same stop in their route. so to make that redunacy go away I made seperate table for stops and then linked routes and stops in seperate table;

5. **Seat Table:** Columns store atomic values, and each record is uniquely identified by the composite primary key (`SeatID`, `BusNumber`).

6. **User Table:** Columns store atomic values, and each record is uniquely identified by the `UserID`.

7. **Reservation Table:** Columns store atomic values, and each record is uniquely identified by the `ReservationID`. Seats could have been multiple value attribute but I stored seats in a seperate table and gave reservationID to them as foreign key.

8. **RouteSchedule Table:** Columns store atomic values, and each record is uniquely identified by the composite primary key (`RouteID`, `ScheduleID`).

9. **Schedule Table:** Columns store atomic values, and each record is uniquely identified by the `ScheduleID`.

### For 2NF

In feedbacks table PassengerID could have been omitted for feedbacks meant for reservations but to make calculations less I stored PassesngerID also.
## Writeup for swiggy 

### For 1NF
I stored favourite restaurants in seperate table to avoid multi valued field in Customer Table. 
1. **Atomic Values:**
   - Each column in the tables contains atomic (indivisible) values. For example, the `ContactNumber` column in the `DeliveryPerson` table and the `PhoneNumber` column in the `Customer` table hold indivisible phone numbers.

2. **No Repeating Groups:**
   - The tables are designed to avoid repeating groups. For instance, the `Address` table doesn't have a column like `PhoneNumbers` with a list of phone numbers; instead, it has individual columns for each attribute like `AddressLine1`, `AddressLine2`, etc.

3. **No Multivalued Attributes:**
   - There are no multivalued attributes in the tables. Each attribute contains a single value. For example, the `SpecialInstructions` column in the `Orders` table contains a single string value.

4. **Unique Column Names:**
   - Each column in a table has a unique name, and there are no duplicated column names. This is essential for identifying each attribute uniquely.

### For 2NF