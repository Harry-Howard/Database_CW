CREATE DATABASE SOLENT_BOATS; 

\c solent_boats;


CREATE TABLE ROLE(
    role_id serial primary KEY,
    role_name varchar (30) NOT NULL
);
CREATE TABLE STAFF(
    staff_id serial primary key,
    staff_fname varchar(50) NOT NULL, 
    staff_lname varchar(50)NOT NULL,
    staff_email varchar (255)NOT NULL,
    staff_phone varchar(20) NOT NULL
    
);
CREATE TABLE STAFF_ROLES(
    staff_id INT,
    role_id INT,
    primary KEY (staff_id, role_id),
    FOREIGN KEY (staff_id) REFERENCES STAFF (staff_id),
    FOREIGN key (role_id) REFERENCES ROLE (role_id)
);
CREATE TABLE BOATS(
    boat_id serial primary key,
    boat_name  varchar (150),
    build_date date ,
    fuel_type varchar (80),
    boat_capacity int
);

CREATE TABLE SERVICES(
    service_id serial primary key,
    booking_date date,
    service_type varchar (255),
    service_desc varchar(255),
    boat_id int REFERENCES BOATS (boat_id)
);

CREATE TABLE BOATYARDS(
    boatyard_id serial primary key,
    boatyard_name varchar (50),
    no_of_staff int,
    yard_address1 varchar (100),
    yard_address2 varchar (100),
    yard_town varchar (30),
    yard_postcode varchar(15),
    yard_phone varchar(20)
);

CREATE TABLE staff_on_service(
   staff_id int,
   service_id int,
   boatyard_id int,
   PRIMARY KEY (staff_id,service_id,boatyard_id),
   FOREIGN KEY (staff_id) REFERENCES STAFF (staff_id),
   FOREIGN key (service_id)   REFERENCES SERVICES (service_id),
   FOREIGN key (boatyard_id) REFERENCES BOATYARDS (boatyard_id)  
);




CREATE TABLE CUSTOMERS(
    customer_id serial primary key,
    cust_fname varchar(30),
    cust_lname varchar(30),
    cust_email varchar(150),
    cust_mobile varchar(20),
    cust_address1 varchar(100),
    cust_address2 varchar(100),
    cust_postcode varchar (10)
);


ALTER TABLE BOATS ADD customer_id int REFERENCES CUSTOMERS(customer_id);
ALTER TABLE BOATS ADD boatyard_id int REFERENCES BOATYARDS(boatyard_id);


ALTER TABLE BOATS ADD FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (customer_id);
ALTER TABLE BOATS ADD FOREIGN KEY (boatyard_id) REFERENCES BOATYARDS (boatyard_id);


ALTER TABLE STAFF ADD boatyard_id int REFERENCES BOATYARDS (boatyard_id);
ALTER TABLE STAFF ADD FOREIGN KEY (boatyard_id) REFERENCES BOATYARDS (boatyard_id);
ALTER TABLE SERVICES ADD staff_id int REFERENCES STAFF (staff_id);
ALTER TABLE SERVICES ADD customer_id int  REFERENCES CUSTOMERS (customer_id);
ALTER TABLE SERVICES ADD boatyard_id int REFERENCES BOATYARDS (boatyard_id);

ALTER TABLE SERVICES ADD FOREIGN KEY  (staff_id) REFERENCES STAFF (staff_id);
ALTER TABLE SERVICES ADD FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (customer_id);
ALTER TABLE SERVICES ADD FOREIGN KEY (boatyard_id) REFERENCES BOATYARDS (boatyard_id);





INSERT INTO ROLE (role_name)
VALUES ('Manager');
INSERT INTO ROLE (role_name)
VALUES ('Glass Fibre Technician');
INSERT INTO ROLE (role_name)
VALUES('ENGINE TECHNICIAN');
INSERT INTO ROLE (role_name)
VALUES('GENERAL STAFF');
INSERT INTO ROLE (role_name)
VALUES(' ELECTRICIAN ');
INSERT INTO ROLE (role_name)
VALUES('TECHNICIAN');

INSERT INTO BOATYARDS (boatyard_name, no_of_staff, yard_address1, yard_address2, yard_town, yard_postcode, yard_phone)
values('Endeavour Quay','5','Mumby Rd','Gosport,','Gosport','PO12 1AH','02392584200');
INSERT INTO BOATYARDS (boatyard_name, no_of_staff, yard_address1, yard_address2, yard_town, yard_postcode, yard_phone)
VALUES('Bournemouth Branch','3', 'Cobs Quay','Dorset','Poole','BH15 45J','07234566701');
INSERT INTO BOATYARDS (boatyard_name, no_of_staff, yard_address1, yard_address2, yard_town, yard_postcode, yard_phone)
VALUES('York Branch','7','Naburn','North Yorkshire','York','Y019 4RW', '01904 643123');
INSERT INTO BOATYARDS (boatyard_name, no_of_staff, yard_address1, yard_address2, yard_town, yard_postcode, yard_phone)
VALUES('Swansea Branch','5','Church Rd','Milford Haven','Swansea','SA73 1NU','01646 643289');

INSERT INTO STAFF (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id )
VALUES('Harry','Howard','solentboats224@gmail.com','07991 454321','1');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Dion', 'Coate', 'dcoate0@tripadvisor.com', '+49-310-330-0514','1');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Wilow', 'Chilcott', 'wchilcott1@icq.com', '+7-365-910-5816','1');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Marchelle', 'Strick', 'mstrick2@youku.com', '+7-137-202-6431','1');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Horten', 'Brahan', 'hbrahan3@stumbleupon.com', '+7-173-505-4662','1');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Orton', 'Gilbane', 'ogilbane4@mac.com', '+46-777-645-5168','2');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Doralia', 'Threadgould', 'dthreadgould5@themeforest.net', '+55-588-530-3894','2');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Derk', 'Swash', 'dswash6@ucla.edu', '+63-161-434-0472','2');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Nari', 'Shevill', 'nshevill7@google.pl', '+63-745-171-6763','3');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Giuditta', 'Pacitti', 'gpacitti8@so-net.ne.jp', '+60-995-614-5509','3');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Staffard', 'Badby', 'sbadby9@tuttocitta.it', '+57-941-727-8346','3');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Courtney', 'Risen', 'crisena@ted.com', '+1-175-787-4658','3');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Rosaline', 'Grisdale', 'rgrisdaleb@simplemachines.org', '+86-885-656-7568','3');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Benjamin', 'Lorryman', 'blorrymanc@yolasite.com', '+231-875-996-7053','3');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Debby', 'Krystof', 'dkrystofd@youku.com', '+7-494-551-6545','3');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Modestine', 'Symington', 'msymingtone@ed.gov', '+62-786-602-0496','4');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Aurthur', 'Ewan', 'aewanf@vinaora.com', '+216-652-784-7796','4');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Lorilee', 'Gainseford', 'lgainsefordg@devhub.com', '+249-875-640-3007','4');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Cyrille', 'Beves', 'cbevesh@1688.com', '+351-617-287-1368','4');
insert into staff (staff_fname, staff_lname, staff_email, staff_phone,boatyard_id) values ('Somerset', 'Coupe', 'scoupei@blinklist.com', '+86-727-297-7059','4');

insert into staff_roles (staff_id,role_id) values(1,1);
insert into staff_roles (staff_id,role_id) values(1,3);
insert into staff_roles (staff_id,role_id) values(2,4);
insert into staff_roles (staff_id,role_id) values(2,2);
insert into staff_roles (staff_id,role_id) values(3,4);
insert into staff_roles (staff_id,role_id) values(3,5);
insert into staff_roles (staff_id,role_id) values(4,4);
insert into staff_roles (staff_id,role_id) values(4,6);
insert into staff_roles (staff_id,role_id) values(5,4);
insert into staff_roles (staff_id,role_id) values(6,1);
insert into staff_roles (staff_id,role_id) values(6,2);
insert into staff_roles (staff_id,role_id) values(6,6);
insert into staff_roles (staff_id,role_id) values(7,4);
insert into staff_roles (staff_id,role_id) values(7,3);
insert into staff_roles (staff_id,role_id) values(7,5);
insert into staff_roles (staff_id,role_id) values(7,4);
insert into staff_roles (staff_id,role_id) values(7,2);
insert into staff_roles (staff_id,role_id) values(7,3);
insert into staff_roles (staff_id,role_id) values(8,1);
insert into staff_roles (staff_id,role_id) values(9,2);
insert into staff_roles (staff_id,role_id) values(10,3);
insert into staff_roles (staff_id,role_id) values(11,4);
insert into staff_roles (staff_id,role_id) values(12,5);
insert into staff_roles (staff_id,role_id) values(13,6);
insert into staff_roles (staff_id,role_id) values(14,4);
insert into staff_roles (staff_id,role_id) values(15,1);
insert into staff_roles (staff_id,role_id) values(15,3);
insert into staff_roles (staff_id,role_id) values(16,4);
insert into staff_roles (staff_id,role_id) values(16,5);
insert into staff_roles (staff_id,role_id) values(17,6);
insert into staff_roles (staff_id,role_id) values(18,2);
insert into staff_roles (staff_id,role_id) values(19,3);
insert into staff_roles (staff_id,role_id) values(20,1);


insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Dylan', 'Trowbridge', 'dtrowbridge0@berkeley.edu', '933-486-9339', '09 Northfield Drive', 'Room 531', '630008');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Jordan', 'Spurgeon', 'jspurgeon1@google.de', '414-686-7195', '7 6th Circle', 'PO Box 67132', '30000-000');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Cammy', 'Farnes', 'cfarnes2@telegraph.co.uk', '786-984-7710', '2 Hauk Park', 'Room 1880', '29700-000');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Barbe', 'Gerrad', 'bgerrad3@github.io', '232-521-6332', '82 Esch Junction', '9th Floor', '84400-000');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Jessamine', 'Crankhorn', 'jcrankhorn4@topsy.com', '814-178-4633', '9 Hovde Road', 'Apt 1321', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Trixie', 'Doman', 'tdoman5@stanford.edu', '591-827-6455', '72651 Rowland Plaza', 'Apt 986', '62880-000');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Shandy', 'Fenne', 'sfenne6@flickr.com', '608-498-9512', '2116 Lighthouse Bay Place', 'Apt 610', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Domenic', 'Townrow', 'dtownrow7@springer.com', '650-500-5326', '75 Center Alley', 'PO Box 33350', '41521');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Lorraine', 'Worral', 'lworral8@unblog.fr', '933-760-7593', '36829 Burning Wood Place', 'Apt 500', '3525-606');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Raychel', 'Piaggia', 'rpiaggia9@thetimes.co.uk', '847-974-4870', '802 Esker Parkway', '11th Floor', '5899');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Andeee', 'Faulkes', 'afaulkesa@google.ru', '892-105-2748', '84002 Fairfield Avenue', 'PO Box 43822', '62-004');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Fowler', 'Densham', 'fdenshamb@blogs.com', '110-117-8306', '7 Parkside Junction', '10th Floor', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Moyra', 'Mechell', 'mmechellc@chron.com', '789-417-7283', '120 Prairieview Street', '2nd Floor', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Worden', 'Smeath', 'wsmeathd@businessweek.com', '659-968-0837', '88 Aberg Road', '10th Floor', '85200');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Stacie', 'Amphlett', 'samphlette@com.com', '281-123-7942', '82 Pearson Hill', 'Suite 66', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Dario', 'Matten', 'dmattenf@google.com.br', '173-839-5988', '06514 Monterey Court', 'Suite 74', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Etienne', 'Beamand', 'ebeamandg@phoca.cz', '711-187-1534', '18 Hanson Circle', 'Suite 36', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Kaia', 'Scriven', 'kscrivenh@cafepress.com', '952-582-7206', '1812 Kipling Park', '3rd Floor', '729-0141');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Tillie', 'Piaggia', 'tpiaggiai@cmu.edu', '820-775-5691', '9847 Jay Point', '19th Floor', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Yettie', 'Benson', 'ybensonj@joomla.org', '175-465-6418', '2381 Farmco Place', 'Suite 22', 'S6W');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Saree', 'Walsham', 'swalshamk@simplemachines.org', '558-564-9975', '8209 Calypso Road', 'Suite 28', '1239');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Drusilla', 'Gehrts', 'dgehrtsl@tripod.com', '261-775-4313', '31 Jay Trail', 'Room 1548', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Xena', 'Lambert', 'xlambertm@indiegogo.com', '703-770-0684', '16 2nd Drive', 'PO Box 35714', '82037 CEDEX');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Morey', 'Brusby', 'mbrusbyn@prlog.org', '824-886-2501', '5850 7th Place', 'Suite 14', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Olva', 'Burfield', 'oburfieldo@guardian.co.uk', '518-768-7176', '23287 Kim Court', '13th Floor', '4100');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Lorant', 'Giacovetti', 'lgiacovettip@paginegialle.it', '183-151-6547', '39 Hooker Avenue', 'Apt 808', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Lodovico', 'Tootell', 'ltootellq@amazon.de', '266-751-3210', '2110 Loeprich Place', '10th Floor', '32-031');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Andras', 'Aspray', 'aasprayr@latimes.com', '393-827-3437', '980 Nobel Trail', '16th Floor', '41-608');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Aurea', 'Grossier', 'agrossiers@so-net.ne.jp', '778-576-4797', '11 Maple Parkway', 'PO Box 21642', '13510-000');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Cherilynn', 'Ilyushkin', 'cilyushkint@chronoengine.com', '281-791-7040', '67248 2nd Alley', '5th Floor', '2630-015');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Ariella', 'Axell', 'aaxellu@ask.com', '990-437-7243', '6 Heath Lane', 'Apt 1883', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Marge', 'Treuge', 'mtreugev@thetimes.co.uk', '505-715-0313', '4883 Swallow Pass', 'Suite 68', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Kala', 'Auchterlonie', 'kauchterloniew@bigcartel.com', '428-593-8104', '3 Brown Terrace', 'Room 1530', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Townie', 'Maryan', 'tmaryanx@smugmug.com', '924-678-1781', '75002 Fieldstone Hill', 'Apt 1103', '9800-325');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Catie', 'Maestro', 'cmaestroy@vkontakte.ru', '816-966-1274', '17174 Orin Center', 'PO Box 94415', '331 54');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Kelley', 'Delete', 'kdeletez@weibo.com', '397-425-1621', '331 Kipling Way', 'Apt 985', '601293');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Junie', 'Havvock', 'jhavvock10@1688.com', '521-601-1478', '084 Old Shore Lane', 'Apt 1873', '391448');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Lindsay', 'Adamec', 'ladamec11@alibaba.com', '174-428-2530', '466 Namekagon Trail', '7th Floor', '9206');
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Prue', 'Mattessen', 'pmattessen12@pen.io', '816-357-3896', '1 Dottie Alley', 'Suite 50', null);
insert into customers (cust_fname, cust_lname, cust_email, cust_mobile, cust_address1, cust_address2, cust_postcode) values ('Raeann', 'Idell', 'ridell13@bravesites.com', '604-359-4392', '6 Crowley Road', 'Suite 3', '50730');

insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Xanthoparmelia Lichen', '12/07/2018', 'Petrol DIsel Lpg', 6, 15, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Longtube Iris', '09/09/2005', 'Petrol DIsel Lpg', 6, 24, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Cloud Sedge', '07/04/2012', 'Petrol DIsel Lpg', 4, 35, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Zigzag Bladderwort', '01/16/2013', 'Petrol DIsel Lpg', 7, 19, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Cartilage Lichen', '02/27/2009', 'Petrol DIsel Lpg', 2, 3, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Buckley''s Goldenrod', '06/02/2018', 'Petrol DIsel Lpg', 3, 21, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Indian Shot', '04/04/2020', 'Petrol DIsel Lpg', 1, 36, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Poranopsis', '04/10/2013', 'Petrol DIsel Lpg', 6, 23, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Sewer Vine', '10/23/2017', 'Petrol DIsel Lpg', 4, 2, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Pterigynandrum Moss', '08/14/2014', 'Petrol DIsel Lpg', 2, 12, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Buckley''s Yucca', '02/15/2020', 'Petrol DIsel Lpg', 5, 32, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Sand Pygmyweed', '02/12/2008', 'Petrol DIsel Lpg', 1, 37, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Fewleaf Thistle', '07/28/2004', 'Petrol DIsel Lpg', 2, 15, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Peppermint Drop Lichen', '11/01/2013', 'Petrol DIsel Lpg', 5, 25, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Tall Barbara''s Buttons', '07/08/2011', 'Petrol DIsel Lpg', 7, 38, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Shortia', '03/09/2016', 'Petrol DIsel Lpg', 1, 23, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Haworth''s Aeonium', '06/07/2017', 'Petrol DIsel Lpg', 6, 5, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Selfing Willowherb', '05/26/2017', 'Petrol DIsel Lpg', 1, 7, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Filiform Anomobryum Moss', '04/30/2013', 'Petrol DIsel Lpg', 4, 32, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Tracadigash Mountain Alkaligrass', '10/29/2007', 'Petrol DIsel Lpg', 6, 7, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Mottled Wakerobin', '05/26/2011', 'Petrol DIsel Lpg', 1, 1, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Japanese Apricot', '04/19/2014', 'Petrol DIsel Lpg', 1, 38, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Roundflower Catclaw', '01/19/2006', 'Petrol DIsel Lpg', 5, 12, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Sevennerve Roughleaf', '08/22/2020', 'Petrol DIsel Lpg', 6, 10, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Barnes'' Eurhynchium Moss', '04/09/2014', 'Petrol DIsel Lpg', 1, 22, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('African Breadfruit', '05/10/2004', 'Petrol DIsel Lpg', 7, 12, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Pacific Anemone', '09/21/2010', 'Petrol DIsel Lpg', 1, 38, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Pleatleaf', '06/24/2013', 'Petrol DIsel Lpg', 2, 9, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Henderson''s Needlegrass', '04/30/2011', 'Petrol DIsel Lpg', 5, 5, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Plumed Jewelflower', '10/07/2016', 'Petrol DIsel Lpg', 4, 39, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Tapertip Smartweed', '08/21/2007', 'Petrol DIsel Lpg', 5, 21, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Santa Barbara Ceanothus', '07/23/2009', 'Petrol DIsel Lpg', 5, 29, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Rockcastle Aster', '11/23/2012', 'Petrol DIsel Lpg', 2, 33, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Plum Pine', '06/24/2011', 'Petrol DIsel Lpg', 4, 5, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Melanelia Lichen', '10/28/2016', 'Petrol DIsel Lpg', 4, 25, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Brazilian Peppertree', '12/13/2012', 'Petrol DIsel Lpg', 2, 4, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Coastalcreeper', '11/25/2019', 'Petrol DIsel Lpg', 3, 39, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Creamcups', '02/01/2013', 'Petrol DIsel Lpg', 5, 11, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Hinckley Oak', '08/12/2010', 'Petrol DIsel Lpg', 1, 2, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Hinds'' Nightshade', '07/23/2014', 'Petrol DIsel Lpg', 1, 31, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Harlequinbush', '02/04/2005', 'Petrol DIsel Lpg', 4, 38, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Aleutian Bog Orchid', '11/12/2007', 'Petrol DIsel Lpg', 4, 29, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Braun''s Rockcress', '11/26/2007', 'Petrol DIsel Lpg', 4, 32, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Callingcard Vine', '03/01/2013', 'Petrol DIsel Lpg', 4, 9, 3);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Peepul Tree', '12/23/2019', 'Petrol DIsel Lpg', 2, 31, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Pensacola Marsh Elder', '11/01/2008', 'Petrol DIsel Lpg', 7, 39, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Girgensohn''s Sphagnum', '05/30/2018', 'Petrol DIsel Lpg', 7, 25, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Desert Starvine', '05/08/2007', 'Petrol DIsel Lpg', 3, 8, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Graceful Wattle', '09/17/2011', 'Petrol DIsel Lpg', 1, 40, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Flowering Dogwood', '02/12/2019', 'Petrol DIsel Lpg', 6, 14, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('California Prickly Phlox', '06/07/2007', 'Petrol DIsel Lpg', 6, 14, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Mediterranean Pepperweed', '09/26/2014', 'Petrol DIsel Lpg', 4, 35, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Lavalle Corktree', '10/10/2004', 'Petrol DIsel Lpg', 1, 11, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Sentry Milkvetch', '07/18/2012', 'Petrol DIsel Lpg', 7, 22, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Wild Lime', '07/06/2013', 'Petrol DIsel Lpg', 3, 32, 2);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Common Screwpine', '12/25/2008', 'Petrol DIsel Lpg', 2, 34, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Panamint Phacelia', '03/20/2016', 'Petrol DIsel Lpg', 2, 15, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Woollyleaf Manzanita', '07/20/2014', 'Petrol DIsel Lpg', 2, 8, 4);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Sticky Indian Paintbrush', '02/18/2019', 'Petrol DIsel Lpg', 4, 9, 1);
insert into boats (boat_name, build_date, fuel_type, boat_capacity, customer_id, boatyard_id) values ('Steele''s Dewberry', '10/04/2009', 'Petrol DIsel Lpg', 3, 30, 1);




insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('06/01/2018', 'Storage', 'Completed', 40, 2, 36, 11);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('08/14/2022', 'Storage', ' Completed', 26, 3, 47, 18);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/14/2019', 'Engine Repair', 'Completed', 4, 2, 19, 14);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('02/07/2023', 'Engine Repair', 'Not Completed', 26, 2, 40, 18);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/01/2023', 'Paint job', 'Completed', 13, 2, 1, 14);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('11/30/2016', 'Storage', ' Completed', 30, 1, 1, 3);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('03/18/2022', 'Storage', 'Completed', 33, 4, 41, 10);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/09/2021', 'Paint job', ' Completed', 7, 3, 28, 18);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('10/01/2019', 'Total Repair', 'Completed', 16, 1, 58, 14);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('10/19/2020', 'water pump check', ' Completed', 21, 2, 28, 9);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/10/2022', 'Paint job', 'Completed', 25, 2, 7, 6);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/15/2020', 'Paint job', ' Completed', 34, 4, 22, 20);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/01/2020', 'Engine Repair', 'Completed', 27, 2, 28, 11);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('07/04/2018', 'Storage', ' Completed', 20, 2, 56, 4);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('06/10/2023', 'water pump check', 'Not Completed', 10, 4, 54, 16);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('02/24/2017', 'Engine Repair', ' Completed', 24, 4, 41, 14);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/19/2019', 'Engine Repair', 'Completed', 34, 4, 26, 4);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('01/29/2023', 'water pump check', 'Completed', 23, 1, 47, 15);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('09/20/2022', 'Total Repair', 'Completed', 24, 1, 43, 17);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('01/20/2023', 'Engine Repair', 'Not Completed', 16, 4, 19, 20);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('02/20/2021', 'Storage', 'Completed', 37, 4, 31, 9);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('09/02/2017', 'Total Repair', ' Completed', 6, 1, 2, 3);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/12/2022', 'water pump check', 'Completed', 1, 3, 55, 11);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('08/20/2019', 'Total Repair', ' Completed', 35, 3, 12, 3);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('06/08/2016', 'Engine Repair', 'Completed', 2, 4, 33, 3);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('03/30/2020', 'Total Repair', ' Completed', 10, 3, 49, 8);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('08/02/2019', 'Total Repair', 'Completed', 24, 4, 16, 15);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/12/2021', 'Engine Repair', ' Completed', 27, 1, 55, 6);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('02/03/2022', 'water pump check', 'Completed', 36, 4, 13, 1);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('01/17/2016', 'Storage', ' Completed', 34, 1, 23, 10);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('12/23/2017', 'Total Repair', 'Completed', 23, 4, 35, 10);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('06/21/2020', 'water pump check', ' Completed', 33, 3, 13, 19);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('09/03/2021', 'Storage', 'Completed', 9, 4, 34, 13);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('01/19/2019', 'Storage', ' Completed', 1, 1, 53, 4);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/10/2018', 'Paint job', 'Completed', 5, 2, 37, 16);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('12/05/2021', 'Paint job', ' Completed', 39, 4, 58, 10);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('10/01/2021', 'Paint job', 'Completed', 10, 1, 10, 2);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('06/20/2017', 'Storage', ' Completed', 9, 4, 60, 17);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('09/17/2021', 'Engine Repair', 'Completed', 27, 1, 19, 2);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('10/16/2019', 'Engine Repair', ' Completed', 6, 4, 54, 1);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('02/25/2021', 'Storage', 'Completed', 35, 3, 8, 11);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('07/03/2021', 'Storage', ' Completed', 29, 4, 35, 17);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('02/12/2021', 'Total Repair', 'Completed', 38, 1, 50, 19);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('08/13/2021', 'Engine Repair', ' Completed', 39, 1, 38, 1);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/11/2021', 'water pump check', 'Completed', 13, 2, 60, 17);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/22/2020', 'Engine Repair', ' Completed', 9, 3, 54, 17);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('06/28/2016', 'Total Repair', 'Completed', 22, 2, 20, 8);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/08/2021', 'Total Repair', ' Completed', 8, 4, 2, 13);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/24/2016', 'Paint job', 'Completed', 29, 2, 8, 5);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('12/14/2018', 'Engine Repair', ' Completed', 5, 1, 23, 12);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('11/05/2019', 'Engine Repair', 'Completed', 20, 3, 34, 1);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/16/2023', 'Paint job', 'Npt Completed', 24, 2, 11, 12);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('08/26/2023', 'Total Repair', 'Not Completed', 36, 2, 15, 19);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/20/2022', 'Paint job', ' Completed', 38, 3, 12, 1);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('09/23/2022', 'water pump check', 'Completed', 21, 1, 50, 2);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('05/17/2020', 'water pump check', ' Completed', 23, 3, 58, 1);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('01/05/2019', 'water pump check', 'Completed', 6, 4, 59, 7);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('11/13/2016', 'Engine Repair', ' Completed', 35, 2, 55, 7);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('04/06/2021', 'Engine Repair', 'Completed', 26, 4, 22, 11);
insert into services (booking_date, service_type, service_desc, customer_id, boatyard_id, boat_id , staff_id) values ('03/10/2023', 'Paint job', 'Not Completed', 32, 3, 13, 15);


insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 23, 19);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 35, 14);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 29, 1);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 42, 20);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 39, 7);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 24, 16);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 2, 1);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 3, 12);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 29, 9);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 55, 12);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 61, 1);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 50, 9);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 57, 2);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 55, 15);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 22, 5);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 51, 8);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 41, 14);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 45, 11);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 10, 13);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 14, 11);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 2, 5);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 25, 14);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 60, 5);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 30, 18);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 25, 17);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 2, 6);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 60, 16);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 58, 4);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 46, 16);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 39, 1);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 18, 13);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 8, 9);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 47, 7);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 21, 9);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 62, 18);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 41, 12);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 17, 1);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 17, 14);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 35, 15);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 65, 16);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 6, 1);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 33, 8);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 60, 16);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 41, 14);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 15, 17);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 1, 6);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 62, 19);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 43, 8);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 26, 16);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 17, 11);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 61, 8);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (2, 50, 2);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 14, 9);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 30, 14);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 47, 2);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 25, 8);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 47, 9);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 41, 18);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 64, 16);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 2, 18);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 12, 7);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 40, 13);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (1, 62, 4);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (3, 64, 4);
insert into staff_on_service (boatyard_id, service_id, staff_id) values (4, 58, 6);
