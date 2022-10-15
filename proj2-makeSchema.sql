-- File name: proj2.makeSchema.sql
-- Author: Maria Adela Soto Alvarez del Castillo
-- Date: 4/1/2019
-- Project part 2
-- Database Theory and Design
-- CS5332 Spring 2019
-- Instructor: Dr. Anne Hee Hiong Ngu 
--
-- This file includes the creation of the database
-- of the project "Who does that".  
--


set termout on
set feedback on
prompt Who does that database.  Please wait ...
-- set termout off
set feedback on

-- There is no need to drop the database tables because, 
-- is the first time that the query is running.
-- If the query has been run, it is necessary to
-- uncomment the next 17 command lines.


drop table Membership cascade constraint;
prompt "Membership dropped";
drop table appUser cascade constraint;
drop table Feature cascade constraint;
drop table Membership_includes_feature cascade constraint;
drop table Business cascade constraint;
drop table Categories cascade constraint;
drop table Business_has_categories cascade constraint;
drop table Messages cascade constraint;
drop table Job cascade constraint;
drop table Reviews cascade constraint;
drop table User_request_job cascade constraint;
drop table Service cascade constraint;
drop table CustomerUser cascade constraint;
drop table BusinessUser cascade constraint;
drop table AdminUser cascade constraint;
drop table Subcategory cascade constraint;

prompt "All Data removed";

create table Membership (
	membershipID NUMBER(7),
	membershipName CHAR(50),
	cost CHAR(6),
	goodStanding NUMBER(1),
	PRIMARY KEY (membershipID)
);

insert into Membership values (0000001, 'B-MLB-Basic', 'free', '1');
insert into Membership values (0000002, 'B-MLS-STANDARD', '$19.99', '1');
insert into Membership values (0000003, 'B-MLP-PREMIUM', '$34.99', '1');
insert into Membership values (0000004, 'U-MLB-BASIC', 'free', '1');
insert into Membership values (0000005, 'u-MLB-STANDARD', '$4.99', '1');
prompt "Membership";
create table appUser (
	userID NUMBER(7),
	name CHAR(50),
	email CHAR(30),
	userPassword CHAR(20),
    street CHAR(50),
    city CHAR(50),
    state CHAR(50),
    zipcode NUMBER(7),
    phone CHAR(15),
    paymentInfo CHAR(50),
    startDate CHAR(10),
    membershipID NUMBER(7),
	PRIMARY KEY (userID),
	FOREIGN KEY (membershipID) REFERENCES Membership(membershipID)
);

insert into appUser values (0000001, 'Alejandro Rojas Torres' ,'art@gmail.com' ,'abc123', '2310 N.Camp St.','Seguin','Tx','78155', '12345678', 'card number card name security code', '04/01/2019',0000001);
insert into appUser values (0000002, 'Gerardo Soto' ,'gs@gmail.com' ,'def456', 'Court St.','Seguin','Tx','78155', '91011121', 'card number card name security code', '03/31/2019',0000002);
insert into appUser values (0000003, 'Maria de Soto' ,'mds@gmail.com' ,'ghi789', 'Walnut St.','Seguin','Tx','78155', '31415161', 'card number card name security code', '02/14/2019',0000003);
insert into appUser values (0000004, 'Cristina Calderon' ,'crc@gmail.com' ,'jkl101', 'Dorado Ln.','Seguin','Tx','78155', '71819202', 'card number card name security code', '03/15/2019',0000004);
insert into appUser values (0000005, 'Veronica Espinoza' ,'vee@gmail.com' ,'mno112', 'Thorpe St.','Seguin','Tx','78155', '12223242', 'card number card name security code', '03/10/2019',0000005);
prompt "appUser";

create table Feature (
	featureID NUMBER(7),
	featureDescription CHAR(1000),
	PRIMARY KEY (featureID)
);

insert into Feature values (0000001,'Business name and contact information available to all users. Links to business website and Facebook page made available to all users. Access to 5 most recent reviews.');
insert into Feature values (0000002,'All features of the BASIC plan. 25% discount on banner/promotional style advertisements. FREE access to CONNECT limited to 25 connections. FREE access to CONNECT-PA. 0.5% per transaction for first 25 transactions. 1.5% per transaction for each additional transaction. Access to 10 most recent reviews');
insert into Feature values (0000003,'All features of the STANDARD plan. 2 FREE banner/promotional style advertisements. FREE access to CONNECT with unlimited connections. FREE access to CONNECT-PAY. 0.25% per transaction, unlimited transactions. FREE monthly database ‘DUMPS’ containing all connection and Click information. FREE access to all PUBLIC user information to be used for direct marketing. FREE social media blasts with business information. Real-time correspondence with current/potential users. Access to ALL reviews');
insert into Feature values (0000004,'Full access to search Who Does That? database of businesses, phone numbers, and real-time reviews.');
insert into Feature values (0000005,'All features of the BASIC plan. Ability to set additional user preferences. For example, only show services with a set rating. Constant contact with business on all pending services. Ability to link social media accounts. Free access to CONNECT');
prompt "Feature";

create table Membership_includes_feature (
	membershipID NUMBER(7),
	featureID NUMBER(8),
	PRIMARY KEY (membershipID,featureID),
	FOREIGN KEY (membershipID) REFERENCES Membership(membershipID),
	FOREIGN KEY (featureID) REFERENCES Feature(featureID)
);

insert into Membership_includes_feature values(0000001,0000001);
insert into Membership_includes_feature values(0000002,0000002);
insert into Membership_includes_feature values(0000003,0000003);
insert into Membership_includes_feature values(0000004,0000004);
insert into Membership_includes_feature values(0000005,0000005);
prompt "Membership_includes_feature";

create table Business (
	businessID NUMBER(7),
	businessName CHAR(50),
	email CHAR(30),
    businessPassword CHAR(20),
    address CHAR(50),
    phone CHAR(15),
	paymentInfo CHAR(50),
    coverageArea CHAR(140),
    membershipID NUMBER(7),
    ownername CHAR(50),
	PRIMARY KEY (businessID),
	FOREIGN KEY (membershipID) REFERENCES Membership(membershipID)
);

insert into Business values (0000001,'Wok','wokroll@gmail.com','abc123','812 S Guadalupe St', '(512) 216-6247', 'card number card name security code', 'San Marcos', 0000001, 'Gerardo Soto');
insert into Business values (0000002,'We Us I Wellness','wellness@gmail.com','def456','2626 Hunter R', '(512) 214-2493', 'card number card name security code', 'San Marcos', 0000002, 'Jose Rojas');
insert into Business values (0000003,'Italian Garden','italian@gmail.com','ghi789','415 N Lbj Dr', '(512) 392-8730', 'card number card name security code', 'San Marcos', 0000003, 'Alfredo Calderon');
insert into Business values (0000004,'AquaBrew','aqua@gmail.com','klm012','150 S Lbj Dr', '(512) 353-2739', 'card number card name security code', 'San Marcos', 0000004, 'Carlos Sanchez');
insert into Business values (0000005,'Industry','industry@gmail.com','nop345','110 E Martin Luther King Dr', '(512) 392-8686', 'card number card name security code', 'San Marcos', 0000005, 'Jose Luis Bermudez');
prompt "Business";

create table Categories (
	categoryID NUMBER(7),
	categoryName CHAR(50),
	PRIMARY KEY (categoryID)
);


insert into Categories values (0000001, 'restaurants');
insert into Categories values (0000002, 'barbershops');
insert into Categories values (0000003, 'nightlife');
insert into Categories values (0000004, 'homeservices');
insert into Categories values (0000005, 'delivery');
prompt "Categories";

create table Business_has_categories (
	businessID NUMBER(7),
	categoryID NUMBER(7),
	PRIMARY KEY (businessID,categoryID),
	FOREIGN KEY (businessID) REFERENCES Business(businessID),
	FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

insert into Business_has_categories values(0000001,0000001);
insert into Business_has_categories values(0000002,0000002);
insert into Business_has_categories values(0000003,0000003);
insert into Business_has_categories values(0000004,0000004);
insert into Business_has_categories values(0000005,0000005);
prompt "Business_has_categories";

create table Messages (
	messageID NUMBER(7),
	messageDescription CHAR(140),
	aswered	 NUMBER(1),
    userID NUMBER(7),
    businessID NUMBER(7),
	PRIMARY KEY (messageID),
	FOREIGN KEY (userID) REFERENCES appUser(userID),
	FOREIGN KEY (businessID) REFERENCES Business(businessID)
);

insert into Messages values(0000001,'Question1', 1, 0000001, 0000001);
insert into Messages values(0000002,'Question2', 1, 0000002, 0000002);
insert into Messages values(0000003,'Question3', 1, 0000003, 0000003);
insert into Messages values(0000004,'Question4', 1, 0000004, 0000004);
insert into Messages values(0000005,'Question5', 1, 0000005, 0000005);
prompt "Messages";

create table Job (
	jobID NUMBER(7),
	paymentStatus NUMBER(1),
	jobDescription	 CHAR(140),
	accepted     NUMBER(1),
    price CHAR(6),
    completionStatus  NUMBER(1),
    businessID NUMBER(7),
	PRIMARY KEY (jobID),
	FOREIGN KEY (businessID) REFERENCES Business(businessID)
);

insert into Job values(0000001,1,'Electrical',1,'$29.39',1,0000002);
insert into Job values(0000002,1,'Landscaping',1,'$50.00',1,0000003);
insert into Job values(0000003,1,'Plumbing',1,'$75.00',1,0000004);
insert into Job values(0000004,1,'Roofing',1,'$80.00',1,0000001);
insert into Job values(0000005,1,'Painting',1,'$70.00',1,0000005);
prompt "Job";

create table Reviews (
	reviewID NUMBER(7),
	reviewDescription CHAR(1000),
	rating	 NUMBER(7),
	userID   NUMBER(7),
    jobID NUMBER(7),
	PRIMARY KEY (reviewID),
	FOREIGN KEY (userID) REFERENCES appUser(userID),
	FOREIGN KEY (jobID) REFERENCES Job(jobID)
);

insert into Reviews values(0000001,'From the very start, I had a bit of a parking issue being on a cable car line and my expectation of a smaller vehicle. The moving truck is very big (easily taking up 3 parking spots) so make sure to have enough loading area for it. I only had 2 spots reserved. Despite the underestimation of size on the part of the booking agent, the team did their very best. After several tries fitting into different size spots, they parked around the corner a block over to load my belongings',5,0000005,0000003);
insert into Reviews values(0000002,'Edgar and the entire team of 4 guys were extremely quick-witted and helped problem solve during a very stressful situation, and to top it all off, had an amazing attitude. Several times they were asked to move by residents, cable car operators, and cars honking incessantly, and luckily they finally secured closer parking. They were patient, hardworking, fast moving, and careful with my things the entire time. I dont think my move would have happened without them. ',5,0000004,0000005);
insert into Reviews values(0000003,'I would definitely recommend this team, especially to anyone looking to make their move efficient and as relatively stress-free as possible. ',5,0000002,0000004);
insert into Reviews values(0000004,'Came here for a burger and brisket during lunch.',5,0000002,0000002);
insert into Reviews values(0000005,'Hipster coffee shop located a block away from Ocean Beach',5,0000001,0000001);
prompt "Reviews";

create table User_request_job (
	userID NUMBER(7),
	jobID NUMBER(7),
	PRIMARY KEY (userID,jobID),
	FOREIGN KEY (userID) REFERENCES appUser(userID),
	FOREIGN KEY (jobID) REFERENCES Job(jobID)
);

insert into User_request_job values(0000001,0000001);
insert into User_request_job values(0000002,0000002);
insert into User_request_job values(0000003,0000003);
insert into User_request_job values(0000004,0000004);
insert into User_request_job values(0000005,0000005);
prompt "User_request_job";

create table Service (
	serviceID NUMBER(7),
	serviceDescription CHAR(140),
	jobId	 NUMBER(7),
	businessID	 NUMBER(7),
	PRIMARY KEY (serviceID,businessId),
	FOREIGN KEY (jobId) REFERENCES Job(jobId),
	FOREIGN KEY (businessID) REFERENCES Business(businessID)
);

insert into Service values(0000001,'Landscaping for garden',0000002,0000001);
insert into Service values(0000002,'Cry clearing',0000003, 0000002);
insert into Service values(0000003,'Gutters',0000004, 0000003);
insert into Service values(0000004,'Electric wiring update',0000001, 0000004);
insert into Service values(0000005,'Kitchen paint',0000005, 0000005);
prompt "Service";

create table CustomerUser (
	loyaltyPoints NUMBER(7),
	userID NUMBER(7),
	PRIMARY KEY (userID),
	FOREIGN KEY (userID) REFERENCES appUser(userID)
);

insert into CustomerUser values(50, 0000001);
insert into CustomerUser values(10, 0000002);
insert into CustomerUser values(10, 0000003);
insert into CustomerUser values(10, 0000004);
insert into CustomerUser values(10, 0000005);
prompt "CustomerUser";


create table BusinessUser (
	userID NUMBER(7),
	PRIMARY KEY (userID),
	FOREIGN KEY (userID) REFERENCES appUser(userID)
);

insert into BusinessUser values(0000001);
insert into BusinessUser values(0000002);
insert into BusinessUser values(0000003);
insert into BusinessUser values(0000004);
insert into BusinessUser values(0000005);
prompt "BusinessUser";

create table AdminUser (
	userID NUMBER(7),
	PRIMARY KEY (userID),
	FOREIGN KEY (userID) REFERENCES appUser(userID)
);

insert into AdminUser values(0000001);
insert into AdminUser values(0000002);
insert into AdminUser values(0000003);
insert into AdminUser values(0000004);
insert into AdminUser values(0000005);
prompt "AdminUser";

create table Subcategory (
	categoryID NUMBER(7),
    catDescription CHAR(140), 
	PRIMARY KEY (categoryID),
	FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);

insert into Subcategory values(0000001, 'Burgers');
insert into Subcategory values(0000002, 'Male barbershop');
insert into Subcategory values(0000003, 'Lounge');
insert into Subcategory values(0000004, 'Plumbing');
insert into Subcategory values(0000005, 'General');
prompt "Subcategory";