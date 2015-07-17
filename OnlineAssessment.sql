create database OnlineAssessment;

USE OnlineAssessment;

create table users (_id int (11) NOT NULL auto_increment , user_name varchar(40) NOT NULL, password varchar(16) NOT NULL, type boolean, primary key (_id) );

create table question_bank (_id int (10) not null auto_incerment, question varchar(100) not null, primary key (_id));

create table options_table(_id int (10) not null auto_incerment, options varchar(20) not null, is_correct  boolean not null,
q_id int (10) not null, primary key (_id)); 

create table answer_table (_id int(10) not null auto_increment, t_id int(10) not null, u_id int(10) not null,q_id int(10) not null, time int(5) ,answer_choosen char(1) not null,primary key (_id));


------------------------inserting user table

insert into users (user_name, password, type) values ("user1", "password1", true);

insert into users (user_name, password, type) values ("user2", "password2", false);

insert into users (user_name, password, type) values ("user3", "password3", false);

insert into users (user_name, password, type) values ("user4", "password4", false);

insert into users (user_name, password, type) values ("user5", "password5", false);

insert into users (user_name, password, type) values ("user6", "password6", false);

-------------------inserting into question_bank;

insert into question_bank(question) values

(" The wildcard in a WHERE clause is useful when?"),
(" You can add a row using SQL in a database with which of the following?"),
("The command to remove rows from a table 'CUSTOMER' is: "),
("The SQL WHERE clause: "),
("A view is which of the following? "),
("The command to eliminate a table from a database is:"),
("ON UPDATE CASCADE ensures which of the following?"),
("SQL data definition commands make up a(n) ________ ."),
("Which of the following is valid SQL for an Index?"),
("The SQL keyword(s) ________ is used with wildcards."),
("Which of the following is the correct order of keywords for SQL SELECT statements?"),
("A subquery in an SQL SELECT statement is enclosed in:"),
(" The result of a SQL SELECT statement is a(n) ________ ."),
("Which of the following are the five built-in functions provided by SQL?."),
("n an SQL SELECT statement querying a single table, according to the SQL-92 standard the asterisk (*) ");

----------------------inserting option table

insert into options_table(options, is_correct ,q_id, option_no) values
("ADD",0,1,'a'),
("insert",0,1,'b'),
("create",1,1,'c'),
("make",0,1,'d'),
("REMOVE FROM CUSTOMER ... ",0,2,'a'),
("DROP FROM CUSTOMER ...",0,2,'b'),
("DELETE FROM CUSTOMER WHERE ...",1,2,'c'),
(" REMOVE FROM CUSTOMER...",0,3,'a'),
("DROP FROM CUSTOMER ...",0,3,'b'),
(" DELETE FROM CUSTOMER WHERE",1,3,'c'),
("UPDATE FROM CUSTOMER ....",0,3,'d'),
(" limits the row data are returned.",1,4,'a'),
("limits the column data that are returned ",0,4,'b'),
("A virtual table that can be accessed via SQL commands",1,5,'a'),
("A base table that cannot be accessed via SQL commands",0,5,'b'),
("REMOVE TABLE CUSTOMER ",0,6,'a'),
("DROP TABLE CUSTOMER;  ",1,6,'b'),
(" Normalization ",0,7,'a'),
(" data integrity ",1,7,'b'),
("all the above",0,7,'c'),
("ddl",1,8,'a'),
("dml",0,8,'b'),
("html",0,8,'c'),
("create index id",1,9,'a'),
("add index id",0,9,'b'),
("remove index id",0,9,'c'),
("not in only",0,10,'a'),
("like only",1,10,'b'),
("in and not in",0,10,'c'),
("WHERE, FROM,SELECT",0,11,'a'),
("FROM, WHERE, SELECT",0,11,'b'),
("SELECT, FROM, WHERE",1,11,'c'),
("braces {...}.",0,12,'a'),
("brackets [...].",0,12,'b'),
("parenthesis (...)",1,12,'c'),

-------------------------inseritng answer_table

insert into answer_table (t_id, u_id, time, answer_choosen,q_id)
values
(1,1,10,'a',12),
(1,1,20,'b',11),
(1,1,10,'a',1),
(1,1,10,'b',6),
(1,2,5,'b',12),(1,2,5,'b',1), (1,2,6,'b',3) ,(1,2,11,'b',4), (1,2,2,'a',11),
(2,3,10,'a',10),(2,3,10,'a',2),(2,3,15,'b',13),(2,3,25,'b',14),(2,3,28,'b',1);





----------------------view 
create view MarksSheet as (

select a.u_id ,a.t_id,count(*) marks from options_table o,answer_table a where (a.q_id=o.q_id and a.answer_choosen=o.option_no) and o.is_correct=1 group by a.u_id, a.t_id;



----------------------------pivot table

DELIMITER //
CREATE PROCEDURE user_Report()
BEGIN
SET @sql = NULL;
select group_concat(distinct concat(
'max(if(td.q_id = ''',
q_id,''',
td.answer_choosen,NULL)) 
as', 
quote(q_id))) 
into 

@sql from answer_table td;


set @sql = concat('select td.u_id,u.user_name,td.t_id,',@sql,' from answer_table td, users u where td.u_id=u._id GROUP BY td.u_id, td.t_id');
prepare statement from @sql;
execute statement;
End//
DELIMITER ;

call user_Report();




