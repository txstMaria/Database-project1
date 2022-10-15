-- File name: proj2.makeSchema.sql
-- Author: Maria Adela Soto Alvarez del Castillo
-- Date: 4/1/2019
-- Project part 2
-- Database Theory and Design
-- CS5332 Spring 2019
-- Instructor: Dr. Anne Hee Hiong Ngu 
--
--  This file clean up the Who does that database
--



drop table Membership cascade constraint;
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