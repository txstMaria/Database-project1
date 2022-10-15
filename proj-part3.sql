-- Cs5332 Project, Part 3
-- Maria Adela Soto Alvarez del Castillo

create or replace view q1 as
	select categoryname as category, catdescription as subcategory
    from categories C, subcategories S
    where C.categoryid = S.categoryid
;

create or replace view q2 as
	select S.catdescription as subcategory
    from subcategory S
    where S.categoryid
    in
    (select B.categoryid
    from business_has_categories B
    where B.categoryid =
    (select categoryid 
    from categories C
    where C.categoryname = '&Subcat'));
;

create or replace view q3 as
	select F.featuredescription as features
    from feature F
    where F.featureid
    in
    (select I.featureid
    from membership_includes_feature I
    where I.membershipid
    in
    (select M.membership 
    from membership M
    where M.membershipname = '&Mem_Type'))
    prompt "If business please enter B-MLB-Basic, B-MLS-Standard, or B-MLP-Premium, for user please enter U-MLB-Basic, U-MLB-Satandard, U-MLP-Premium"
;

create or replace view q4a as
	select U.name, U.street || ',' || U.city || ',' || U.state || ',' || U.zipcode as address,
    U.email, M.membershipname, M.cost, U.phone, M.goodstanding
    from appuser U, membership M
    where U.email = '&username' and U.usserpassword = '&pass' and U.membershipid = M.membershipid
;

create or replace view q4b as
	select B.ownername, M.cost, B.businessname as business,
    C.categoryname as category,
    B.desc as description
    from business B, membership M, categories C, business_has_categories H
    where B.email = '&username' and B.password = '&pass'
    and B.membershipid = M.membershipid
    and B.businessid = H.businessid
    and C.categoryid = H.categoryid
;

create or replace view q5 as
	select B.businessname as name
    from business B, appuser U
    where U.userid='&userid' 
    and B.bussinessid = U.businessid
;

create or replace view q6 as
	select U.userid as customerid,
    substring(U.name,1,(charindex(' ', U.name + ' ')-1)) as first_name,
    C.consults as times
    from appuser U, consults C
    where C.userid = U.userid
    and C.businessid = '&businessid'
;

create or replace view q7 as
	select B.businessname as business, B.url as url, C.categoryname
    from business B, category C, business_has_category H, appuser U
    where C.categoryid = H.categoryid
    and B.businessid = H.businessid
    and B.zipcode = U.zipcode
;

create or replace view q8 as
	select B.businessname as business_name
    from business B, membership M
    where M.membershipname = 'B-MLP'
    and M.membershipid = B.membershipid
;

create or replace view q9 as
	select U.name, B.businessname as business_name,
    s.servicedescription as services
    from appuser U, business B, service V, job J, user_request_job T
    where U.userid = T.userid
    and V.serviceid = J.serviceid
    and S.businessid = B.businessid
    order by U.name
;

create or replace view q10 is
	select B.businessid as user_id,
    B.membershipid as membership_id,
    M.cost,
    M.duration,
    M.membershipname as membership_name,
    B.businessname as name
    from busines B, membership M
    where B.membershipid = M.membershipid
    and M.membershipname = 'B-MLP'
    update membership M
    set M.cost = 0.9*M.cost
    where M.subscriptionperiod = 'annually'
    and M.membershipname = 'B-MLP'
    select B.businessid as user_id,
    B.membershipid as membership_id,
    M.cost,
    M.subscriptionperiod,
    M.membershipname as membership_name
    B.businessname as name
    from business B, membership M
    where B.membershipid = M.membershipid
    and M.membershipname = 'B-MLP'
;
create or replace view q11 is
	-Update goodstanding M
    from membership M, appuser U
    set M.goodstanding = 'True'
    where U.membershipid = '&User_ID'
;


create or replace
procedure p1 (id IN Integer, start-date IN date, end-date IN date) 
is
	-- replace this line with your PL/SQL procedure
end;
/
