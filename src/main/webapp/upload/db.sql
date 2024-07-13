create database yc9798film;

use yc9798film;

drop table testuser;

create table testuser(
   userid int primary key auto_increment,
   uname varchar(100),
   upwd varchar(100)
);

select * from testuser;

insert into testuser(uname, upwd) values(   'a','a' );

commit;



