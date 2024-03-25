create table numbers ("number" numeric(2));

insert into numbers("number") values(1);
insert into numbers("number") values(2);
insert into numbers("number") values(3);
insert into numbers("number") values(4);
insert into numbers("number") values(5);
insert into numbers("number") values(6);
insert into numbers("number") values(7);
insert into numbers("number") values(8);
insert into numbers("number") values(9);
insert into numbers("number") values(10);

select n1."number" ||'*'|| n2."number" ||'='|| (n1."number" * n2."number") production
from numbers n1 cross join numbers n2;