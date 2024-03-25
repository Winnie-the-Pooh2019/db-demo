/*==============================================================*/
/*Ivan Kazakevich */
/*==============================================================*/




drop table S_CUSTOMER cascade constraints;

drop table S_DEPT cascade constraints;

drop table S_EMP cascade constraints;

drop table S_ITEM cascade constraints;

drop table S_ORD cascade constraints;

drop table S_PRODUCT cascade constraints;

drop table S_REGION cascade constraints;




/*==============================================================*/
/* Table: S_CUSTOMER                                            */
/*==============================================================*/
create table S_CUSTOMER
(
    ID                   NUMBER(7)       ,
    NAME                 VARCHAR2(50) constraint  S_Cus_Name_nn not null,
    PHONE                VARCHAR2(25),
    ADDRESS              VARCHAR2(400),
    CITY                 VARCHAR2(30),
    STATE                VARCHAR2(20),
    COUNTRY              VARCHAR2(30),
    ZIP_CODE             VARCHAR2(75),
    CREDIT_RATING        VARCHAR2(9),
    SALES_REP_ID         NUMBER(7),
    REGION_ID            NUMBER(7),
    COMMENTS             VARCHAR2(255),
    constraint PK_S_CUSTOMER primary key (ID)
);
/*==============================================================*/
/* Table: S_DEPT                                                */
/*==============================================================*/
create table S_DEPT
(
    ID                   NUMBER(7)       ,
    NAME                 VARCHAR2(25)constraint S_de_name_nn not null,
    REGION_ID            NUMBER(7),
    constraint PK_S_DEPT primary key (ID)
);

/*==============================================================*/
/* Table: S_EMP                                                 */
/*==============================================================*/
create table S_EMP
(
    ID                   NUMBER(7)      ,
    LAST_NAME            VARCHAR2(25)constraint S_em_l_n_nn not null,
    FIRST_NAME           VARCHAR2(25),
    USERID               VARCHAR2(8)constraint S_em_us_nn not null,
    START_DATE           DATE,
    COMMENTS             VARCHAR2(25),
    MANAGER_ID           NUMBER(7),
    TITLE                VARCHAR2(25),
    DEPT_ID              NUMBER(7),
    SALARY               NUMBER(11,2),
    COMMISSION_PCT       NUMBER(4,2),
    constraint PK_S_EMP primary key (ID)
);
/*==============================================================*/
/* Table: S_ITEM                                                */
/*==============================================================*/
create table S_ITEM
(
    ORD_ID               NUMBER(7) ,
    ITEM_ID              NUMBER(7),
    PRODUCT_ID           NUMBER(7),
    PRICE                NUMBER(11,2),
    QUANTITY             NUMBER(9),
    QUANTITY_SHIPPED     NUMBER(9),
    constraint PK_S_ITEM primary key (ORD_ID,PRODUCT_ID)
);

/*==============================================================*/
/* Table: S_ORD                                                 */
/*==============================================================*/
create table S_ORD
(
    ID                             NUMBER(7),
    CUSTOMER_ID                    NUMBER(7),
    DATE_ORDERED                   DATE,
    DATE_SHIPPED                   DATE,
    SALES_REP_ID                   NUMBER(7),
    TOTAL                          NUMBER(11,2),
    PAYMENT_TYPE                   VARCHAR2(6),
    ORDER_FILLED                   VARCHAR2(1),
    constraint PK_S_ORD primary key (ID)
);


/*==============================================================*/
/* Table: S_PRODUCT                                             */
/*==============================================================*/
create table S_PRODUCT
(
    ID                   NUMBER(7) ,
    NAME                 VARCHAR2(50) constraint S_pr_na_nn not null,
    SHORT_DESC           VARCHAR2(255),
    LONGTEXT_ID          NUMBER(7),
    SUGGESTED_WHLSL_PRICE NUMBER(11,2),
    WHLSL_UNITS          VARCHAR2(25),
    constraint PK_S_PRODUCT primary key (ID)
);
/*==============================================================*/
/* Table: S_REGION                                              */
/*==============================================================*/
create table S_REGION
(
    ID                   NUMBER(7)            ,
    NAME                 VARCHAR2(50)  constraint S_re_na_nn not null,
    constraint PK_S_REGION primary key (ID)
);


alter table S_CUSTOMER
    add constraint FK_S_CUSTOM_REFERENCE_S_EMP foreign key (SALES_REP_ID)
        references S_EMP (ID);

alter table S_CUSTOMER
    add constraint FK_S_CUSTOM_REFERENCE_S_REGION foreign key (REGION_ID)
        references S_REGION (ID);

alter table S_DEPT
    add constraint FK_S_DEPT_VHH_S_REGION foreign key (REGION_ID)
        references S_REGION (ID);

alter table S_EMP
    add constraint FK_S_EMP_REFERENCE_S_DEPT foreign key (DEPT_ID)
        references S_DEPT (ID);

alter table S_EMP
    add constraint FK_S_EMP_REFERENCE_S_EMP foreign key (MANAGER_ID)
        references S_EMP (ID);

alter table S_ITEM
    add constraint FK_S_ITEM_REFERENCE_S_PRODUC foreign key (PRODUCT_ID)
        references S_PRODUCT (ID);

alter table S_ITEM
    add constraint FK_S_ORD_REFERENCE_S_ITEM foreign key (ORD_ID)
        references S_ORD(ID);

alter table S_ORD
    add constraint FK_S_ORD_REFERENCE_S_CUSTOM foreign key (CUSTOMER_ID)
        references S_CUSTOMER (ID);

alter table S_ORD
    add constraint FK_S_ORD_REFERENCE_S_EMP foreign key (SALES_REP_ID)
        references S_EMP (ID);

INSERT INTO s_region
(ID,NAME)
VALUES
    (1,'USA')
    /
INSERT INTO s_region
(ID,NAME)
VALUES
    (2,'S.America')
    /
INSERT INTO s_region
(ID,NAME)
VALUES
    (3,'Africa')
    /
INSERT INTO s_region
(ID,NAME)
VALUES
    (4,'Aziya')
    /
INSERT INTO s_region
(ID,NAME)
VALUES
    (5,'Europe')
    /
INSERT INTO s_region
(ID,NAME)
VALUES
    (6,'Central America')
    /

INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (10,'Finance',1)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (31,'Sales',1)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (32,'Sales',2)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (33,'Sales',3)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (34,'Sales',4)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (35,'Sales',5)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (41,'Operations',1)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (42,'Operations',2)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (43,'Operations',3)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (44,'Operations',4)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (45,'Operations',5)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (50,'Administration',1)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (11,'Finance',2)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (61,'Accounting',2)
    /
INSERT INTO s_dept
(ID,NAME,REGION_ID)
VALUES
    (54,'Education',1)
    /

INSERT INTO s_emp
VALUES
    (1,'Velasquez','Carmen','cvelasqu',to_date('3.03.1990','dd.mm.yyyy'),NULL,NULL,'President',32,2550,NULL)
    /
INSERT INTO s_emp
VALUES
    (2,'Ngao','LaDoris','lngao',to_date('8.03.1990','dd.mm.yyyy'),NULL,1,'VP, Operations',54,1450,NULL)
    /
INSERT INTO s_emp
VALUES
    (3,'Nagayamn','Midori','mnagayam',to_date('17.06.1991','dd.mm.yyyy'),NULL,1,'VP, Sales',31,1400,NULL)
    /
INSERT INTO s_emp
VALUES
    (4,'Quick-To-See','Mark','mquickto',to_date('7.04.1990','dd.mm.yyyy'),NULL,1,'VP, Finance',10,1450,NULL)
    /
INSERT INTO s_emp
VALUES
    (5,'Ropeburn','Audry','aropebur',to_date('4.03.1990','dd.mm.yyyy'),NULL,1,'VP, Administration',50,1550,NULL)
    /
INSERT INTO s_emp
VALUES
    (6,'Urguhart','Molly','murguhar',to_date('18.01.1991','dd.mm.yyyy'),NULL,2,'Warehouse Manager',41,1200,NULL)
    /
INSERT INTO s_emp
VALUES
    (7,'Menchu','Robertn','rmenchu',to_date('14.05.1990','dd.mm.yyyy'),NULL,2,'Warehouse Manager',42,1250,NULL)
    /
INSERT INTO s_emp
VALUES
    (8,'Biri','Ben','bbiri',to_date('7.04.1990','dd.mm.yyyy'),NULL,2,'Warehouse Manager',43,1100,NULL)
    /
INSERT INTO s_emp
VALUES
    (9,'Catchpole','Antoinette','acatchpo',to_date('9.02.1992','dd.mm.yyyy'),NULL,2,'Warehouse Manager',44,1300,NULL)
    /
INSERT INTO s_emp
VALUES
    (10,'Havel','Marta','mhavel',to_date('27.02.1991','dd.mm.yyyy'),NULL,2,'Warehouse Manager',45,1307,NULL)
    /
INSERT INTO s_emp
VALUES
    (11,'Magee','Colin','cmagee',to_date('14.05.1990','dd.mm.yyyy'),NULL,3,'Sales Representative',31,1400,10)
    /
INSERT INTO s_emp
VALUES
    (13,'Sedeghi','Yasmin','ysedeghi',to_date('18.02.1991','dd.mm.yyyy'),NULL,3,'Sales Representative',33,1515,10)
    /
INSERT INTO s_emp
VALUES
    (14,'Nguyen','Mai','mnguyen',to_date('22.01.1992','dd.mm.yyyy'),NULL,3,'Sales Representative',34,1525,15)
    /
INSERT INTO s_emp
VALUES
    (16,'Maduro','Elena','emaduro',to_date('7.02.1992','dd.mm.yyyy'),NULL,6,'Stock Clerk',41,1400,NULL)
    /
INSERT INTO s_emp
VALUES
    (17,'Smith','George','gsmith',to_date('8.03.1990','dd.mm.yyyy'),NULL,6,'Stock Clerk',41,940,NULL)
    /
INSERT INTO s_emp
VALUES
    (18,'Nozaki','Akira','anozaki',to_date('9.02.1991','dd.mm.yyyy'),NULL,7,'Stock Clerk',42,1200,NULL)
    /
INSERT INTO s_emp
VALUES
    (19,'Patel','Vikram','vpatel',to_date('6.08.1991','dd.mm.yyyy'),NULL,7,'Stock Clerk',42,795,NULL)
    /
INSERT INTO s_emp
VALUES
    (20,'Newman','Chad','cnewman',to_date('21.07.1991','dd.mm.yyyy'),NULL,8,'Stock Clerk',43,750,NULL)
    /
INSERT INTO s_emp
VALUES
    (21,'Markarian','Alexander','amarkari',to_date('26.05.1991','dd.mm.yyyy'),NULL,8,'Stock Clerk',43,850,NULL)
    /
INSERT INTO s_emp
VALUES
    (22,'Chang','Eddie','echang',to_date('30.11.1990','dd.mm.yyyy'),NULL,9,'Stock Clerk',44,800,NULL)
    /
INSERT INTO s_emp
VALUES
    (23,'Patel','Radha','rpatel',to_date('17.10.1990','dd.mm.yyyy'),NULL,9,'Stock Clerk',34,795,NULL)
    /
INSERT INTO s_emp
VALUES
    (24,'Dancs','Bela','bdancs',to_date('17.03.1991','dd.mm.yyyy'),NULL,10,'Stock Clerk',45,860,NULL)
    /
INSERT INTO s_emp
VALUES
    (25,'Schwart,z','Sylvie','sschwart',to_date('9.05.1991','dd.mm.yyyy'),NULL,10,'Stock Clerk',45,1100,NULL)
    /

INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (201,'Unisports','55-2066101','72 Via Bahia','Sao Paolo',NULL,'Brazil',NULL,'EXCELLENT',11,2,'Customer usually orders large amounts and has a high order total. This is okay as long')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (202,'Simms Atheletics','8 1-20101','6741 Takashi Blvd.','Osaka',NULL,'Japan',NULL,'POOR',14,4,'Customer should always pay by cash until his credit rating improves.')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (203,'Delhi Sports','91-10351','11368 Chanakya','New Delhi',NULL,'India',NULL,'GOOD',14,4,'Customer specializes in baseball equipment and is the largest retailer in India.')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (204,'Womansport','1-206-104-0103','281 King Street','Seattle',NULL,'USA','98 101','EXCELLENT',11,1,NULL)
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (205,'Kams Sporting Goods','852-3692888','15 Henessey Road','Hong Kong',NULL,NULL,NULL,'EXCELLENT',21,4,NULL)
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (206,'Sportique','33-2257201','172 Rue de Rivoli','Cannes',NULL,'France',NULL,'EXCELLENT',11,5,'Customer specializes in Soccer. Likes to order accessories in bright colors.')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (207,'Sweet Rock Sports','234-6036201','6 Saint Antoine','Lagos',NULL,'Nigeria',NULL,'GOOD',NULL,3,NULL)
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (208,'Muench Sports','49-527454','435 Gruenestrasse','Stuttgart',NULL,'Germany',NULL,'GOOD',17,5,'Customer usually pays small orders by cash and large orders on credit.')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (209,'Beisbol Si!','809-352689','792 Playa Del Mar','Sen Pedro de Macons',NULL,'Dominican Republic',NULL,'EXCELLENT',11,1,NULL)
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (210,'Futbol Sonora','52-404562','3 Via Saguaro','Nogales',NULL,'Mexico',NULL,'EXCELLENT',21,2,'Customer is difficult to reach by phone. Try mail.')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (211,'Kuhns Sports','42-111292','7 Modrany','Prague',NULL,'Czechoslovakia',NULL,'EXCELLENT',NULL,5,NULL)
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (212,'Hamada Sport','20-1209211','57A Corniche','Alexandria',NULL,'Egypt',NULL,'EXCELLENT',13,3,'Customer orders sea and water equipment.')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (213,'Big Johns Sports Emporium','1-415-555-6281','4783 18th Street','San Fracisco',NULL,'USA','94117','EXCELLENT',11,1,'Customer has a dependable credit record.')
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (214,'Ojibvay Retail','1-716-555-7171','415 Main Street','Buffalo',NULL,'USA','14202','POOR',11,1,NULL)
    /
INSERT INTO s_customer
(ID,NAME,PHONE,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE,CREDIT_RATING,SALES_REP_ID,REGION_ID,COMMENTS)
VALUES
    (215,'Sporta Russia','7-3892456','6000 Yekatamina','Saint Petersburg',NULL,'Russia',NULL,'POOR',NULL,5,'This customer is very friendly, but has difficulty paying bills. Insist upon cash.')
    /

INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (10012,'Ace Ski Boot','Intermediate ski boot',1002,200,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (10013,'Pro Ski Boot','Advanced ski boot',1003,410,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (20106,'Junior Soccer Ball','Junior soccer ball',NULL,11,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (10011,'Bunny Boot','Beginners ski boot',1001,150,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (20108,'World Cup Soccer Ball','World cup soccer ball',NULL,28,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (20201,'World Cup Net','World cup net',NULL,123,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (20510,'Black Hawk Knee Pads','Knee pads, pair',NULL,9,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (20512,'Black Hawk Elbow Pads','Elbow pads, pair',NULL,8,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (30321,'Grand Prix Bicycle','Road bicycle',1291,1669,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (30326,'Himalaya Bicycle','Mountain bicycle',1296,582,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (30421,'Grand Prix Bicycle Tires','Road bicycle tires',NULL,16,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (30433,'New Air Pump','Tire pump',NULL,20,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (32779,'Slaker Water Bottle','Mater bottle',NULL,7,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (32861,'Safe-T Helmet','Bicycle helmet',1829,60,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (40421,'Alexeyer Pro Lifting Bar','Straight bar',1381,65,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (40422,'Pro Curling Bar','Curling bar',1382,50,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (41010,'Prostar 10 Pound Weight','Ten pound weight',NULL,8,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (41020,'Prostar 20 Pound Weight','Twenty pound weight',NULL,12,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (41050,'Prostar 50 Pound Weight','Fifty pound weight',NULL,25,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (41080,'Prostar 80 Pound Weight','Eighty pound weight',NULL,35,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (50417,'Griffey Glove','Outfielders glove',80,77,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (50418,'Alomar Glove','Infielders glove',1368,75,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (50419,'Steinbach Glove','Catchers glove',1369,80,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (50530,'Cabrera Bat','Thirty inch bat',1480,45,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (50532,'Puckett Bat','Thirty-two inch bat',1482,47,NULL)
    /
INSERT INTO s_product
(ID,NAME,SHORT_DESC,LONGTEXT_ID,SUGGESTED_WHLSL_PRICE,WHLSL_UNITS)
VALUES
    (50536,'Winfield Bat','Thirty-six inch bat',1486,50,NULL)
    /

INSERT INTO s_ord
VALUES
    (100,204,to_date('31.08.1992','dd.mm.yyyy'),to_date('10.09.1992','dd.mm.yyyy'),11,601100,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (102,206,to_date('1.09.1992','dd.mm.yyyy'),to_date('8.09.1992','dd.mm.yyyy'),11,8335,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (103,208,to_date('2.09.1992','dd.mm.yyyy'),to_date('22.09.1992','dd.mm.yyyy'),11,377,'CASH',NULL)
    /
INSERT INTO s_ord
VALUES
    (104,208,to_date('3.09.1992','dd.mm.yyyy'),to_date('23.09.1992','dd.mm.yyyy'),21,32430,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (106,210,to_date('7.09.1992','dd.mm.yyyy'),to_date('15.09.1992','dd.mm.yyyy'),21,15634,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (107,211,to_date('7.09.1992','dd.mm.yyyy'),to_date('21.09.1992','dd.mm.yyyy'),21,142171,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (108,212,to_date('7.09.1992','dd.mm.yyyy'),to_date('10.09.1992','dd.mm.yyyy'),13,149570,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (109,213,to_date('8.09.1992','dd.mm.yyyy'),to_date('28.09.1992','dd.mm.yyyy'),11,1020935,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (111,204,to_date('9.09.1992','dd.mm.yyyy'),to_date('21.09.1992','dd.mm.yyyy'),11,2770,'CASH',NULL)
    /
INSERT INTO s_ord
VALUES
    (97,201,to_date('28.08.1992','dd.mm.yyyy'),to_date('17.09.1992','dd.mm.yyyy'),11,84000,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (98,202,to_date('31.08.1992','dd.mm.yyyy'),to_date('10.09.1992','dd.mm.yyyy'),14,595,'CASH',NULL)
    /
INSERT INTO s_ord
VALUES
    (99,203,to_date('31.08.1992','dd.mm.yyyy'),to_date('18.09.1992','dd.mm.yyyy'),14,7707,'CREDIT',NULL)
    /
INSERT INTO s_ord
VALUES
    (112,210,to_date('31.08.1992','dd.mm.yyyy'),to_date('10.09.1992','dd.mm.yyyy'),21,550,'CREDIT',NULL)
    /

INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (97,1,20106,9,1000,1000)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (97,2,30321,1500,50,50)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (98,1,40421,85,7,7)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (99,1,20510,9,18,18)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (99,2,20512,8,25,25)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (99,3,50417,80,53,53)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (99,4,50530,45,69,69)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (100,1,10011,135,500,500)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (100,2,10013,380,400,400)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (100,3,50530,14,500,500)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (100,4,50417,36,400,400)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (100,5,30326,582,600,600)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (100,6,30433,20,450,450)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (100,7,41010,8,250,250)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,1,30421,16,15,15)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,2,40422,50,30,30)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,3,41010,8,20,20)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,4,32779,45,35,35)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,6,50417,80,27,27)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,7,50530,45,50,50)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,4,20108,28,100,100)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (102,2,20201,123,45,45)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (103,4,30433,20,15,15)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (103,2,32779,7,11,11)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (104,4,20510,9,7,7)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (104,2,20512,8,12,12)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (104,3,30321,1669,19,19)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (104,4,30421,16,35,35)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (104,2,50419,80,13,13)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (104,3,50532,47,28,28)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (106,1,20108,28,46,46)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (106,2,20201,123,21,21)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (106,5,50418,75,98,98)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (106,6,50419,80,27,27)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (107,1,20106,11,50,50)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (107,2,20108,28,22,22)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (107,3,20201,115,130,130)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (107,4,30321,1669,75,75)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (107,5,30421,16,55,55)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (108,1,20510,9,9,9)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (108,2,20512,8,18,18)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (108,3,30321,1669,85,85)
    /
INSERT INTO s_item
(ORD_ID,ITEM_ID,PRODUCT_ID,PRICE,QUANTITY,QUANTITY_SHIPPED)
VALUES
    (108,4,32779,7,60,60)
    /
INSERT INTO s_item
VALUES
    (108,5,50418,60,57,57)
    /
INSERT INTO s_item
VALUES
    (108,6,10012,35,50,50)
    /
INSERT INTO s_item
VALUES
    (108,4,50536,45,42,42)
    /
INSERT INTO s_item
VALUES
    (109,4,10011,140,150,150)
    /
INSERT INTO s_item
VALUES
    (109,2,10012,175,600,600)
    /
INSERT INTO s_item
VALUES
    (109,1,30326,582,1500,1500)
    /
INSERT INTO s_item
VALUES
    (109,6,50536,60,50,50)
    /
INSERT INTO s_item
VALUES
    (109,7,50418,75,43,43)
    /
INSERT INTO s_item
VALUES
    (111,2,50536,50,23,23)
    /
INSERT INTO s_item
VALUES
    (111,1,40421,65,27,27)
    /
INSERT INTO s_item
VALUES
    (111,2,41080,35,29,29)
    /
INSERT INTO s_item
VALUES
    (112,1,20106,11,50,50)
    /

select table_name from user_tables where lower(table_name) like 's_%';