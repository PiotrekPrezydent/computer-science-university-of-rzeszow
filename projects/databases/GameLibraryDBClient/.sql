--------------------------------------------------------
--  File created - piątek-stycznia-24-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_GATUNKI_ID
--------------------------------------------------------

   CREATE SEQUENCE  "C##student"."SEQ_GATUNKI_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 31 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GRY_ID
--------------------------------------------------------

   CREATE SEQUENCE  "C##student"."SEQ_GRY_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RECENZJE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "C##student"."SEQ_RECENZJE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 99 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_TWORCOW_ID
--------------------------------------------------------

   CREATE SEQUENCE  "C##student"."SEQ_TWORCOW_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 31 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_WYDAWCY_ID
--------------------------------------------------------

   CREATE SEQUENCE  "C##student"."SEQ_WYDAWCY_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 31 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table GATUNKI
--------------------------------------------------------

  CREATE TABLE "C##student"."GATUNKI" 
   (	"ID" NUMBER(*,0), 
	"NAZWA" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GRY
--------------------------------------------------------

  CREATE TABLE "C##student"."GRY" 
   (	"ID" NUMBER(*,0), 
	"TYTUL" VARCHAR2(255 BYTE), 
	"DATA_WYDANIA" DATE, 
	"CENA" NUMBER(5,2), 
	"ID_TWORCY" NUMBER(*,0), 
	"ID_WYDAWCY" NUMBER(*,0), 
	"ILOSC_SPRZEDANYCH_KOPI" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table GRY_GATUNKI
--------------------------------------------------------

  CREATE TABLE "C##student"."GRY_GATUNKI" 
   (	"ID_GRY" NUMBER(*,0), 
	"ID_GATUNEK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RECENZJE
--------------------------------------------------------

  CREATE TABLE "C##student"."RECENZJE" 
   (	"ID" NUMBER(*,0), 
	"OCENA" NUMBER(3,1), 
	"TRESC" VARCHAR2(4000 BYTE), 
	"ID_GRY" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TWORCY
--------------------------------------------------------

  CREATE TABLE "C##student"."TWORCY" 
   (	"ID" NUMBER(*,0), 
	"NAZWA" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WYDAWCY
--------------------------------------------------------

  CREATE TABLE "C##student"."WYDAWCY" 
   (	"ID" NUMBER(*,0), 
	"NAZWA" VARCHAR2(255 BYTE), 
	"MARZA_PROCENT" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into "C##student".GATUNKI
SET DEFINE OFF;
Insert into "C##student".GATUNKI (ID,NAZWA) values ('1','Action-Adventure');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('2','First-Person Shooter');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('3','Role-Playing3231');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('4','Strategy');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('5','Simulation');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('6','Sports');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('7','Fighting');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('8','Platformer');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('9','Racing');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('10','Survival');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('11','Puzzle');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('12','Horror');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('13','Open World');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('14','MOBA');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('15','Battle Royale');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('16','Stealth');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('17','Multiplayer');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('18','MMORPG');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('19','RTS');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('20','Visual Novel');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('21','Music');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('22','Tactical');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('23','Idle');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('24','Adventure');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('25','Sandbox');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('26','MMOFPS');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('27','Card');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('28','Augmented Reality');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('29','Virtual Reality');
Insert into "C##student".GATUNKI (ID,NAZWA) values ('30','Indie');
REM INSERTING into "C##student".GRY
SET DEFINE OFF;
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('1','The Witcher 3: Wild Hunt',to_date('15/05/19','RR/MM/DD'),'53,99','1','1','20000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('2','Cyberpunk 2077',to_date('20/12/10','RR/MM/DD'),'49,99','1','2','15000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('3','Grand Theft Auto V',to_date('13/09/18','RR/MM/DD'),'39,99','2','3','150000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('4','Red Dead Redemption 2',to_date('18/10/26','RR/MM/DD'),'59,99','3','4','50000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('5','The Elder Scrolls V: Skyrim',to_date('11/11/11','RR/MM/DD'),'29,99','4','5','40000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('6','Horizon Zero Dawn',to_date('17/02/28','RR/MM/DD'),'51,74','5','6','12000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('7','Ghost of Tsushima',to_date('20/07/17','RR/MM/DD'),'59,99','6','7','10000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('8','Spider-Man: Miles Morales',to_date('20/11/12','RR/MM/DD'),'49,99','7','8','7000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('9','Animal Crossing: New Horizons',to_date('20/03/20','RR/MM/DD'),'59,99','8','9','40000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('10','Mario Kart 8 Deluxe',to_date('17/04/28','RR/MM/DD'),'59,99','9','10','37000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('11','The Legend of Zelda: Breath of the Wild',to_date('17/03/03','RR/MM/DD'),'59,99','10','11','25000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('12','Fortnite',to_date('17/07/25','RR/MM/DD'),'0','11','12','400000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('13','Minecraft',to_date('11/11/18','RR/MM/DD'),'26,95','12','13','250000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('14','Overwatch',to_date('16/05/24','RR/MM/DD'),'39,99','13','14','60000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('15','Battlefield V',to_date('18/11/20','RR/MM/DD'),'59,99','14','15','15000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('16','Call of Duty: Modern Warfare',to_date('19/10/25','RR/MM/DD'),'59,99','15','16','35000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('17','Apex Legends',to_date('19/02/04','RR/MM/DD'),'0','16','17','60000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('18','Destiny 2',to_date('17/09/06','RR/MM/DD'),'39,99','17','18','25000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('19','Sea of Thieves',to_date('18/03/20','RR/MM/DD'),'39,99','18','19','18000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('20','Fallout 4',to_date('15/11/10','RR/MM/DD'),'59,99','19','20','140000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('21','The Division 2',to_date('19/03/15','RR/MM/DD'),'59,99','20','21','12000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('22','Kingdom Come: Deliverance',to_date('18/02/13','RR/MM/DD'),'49,99','21','22','4000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('23','Rainbow Six Siege',to_date('15/12/01','RR/MM/DD'),'39,99','22','23','70000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('24','Tomb Raider',to_date('13/11/05','RR/MM/DD'),'39,99','23','24','13000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('25','Hitman 3',to_date('21/01/20','RR/MM/DD'),'59,99','24','25','4500000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('26','Mortal Kombat 11',to_date('19/04/23','RR/MM/DD'),'59,99','25','26','12000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('27','Watch Dogs: Legion',to_date('20/10/29','RR/MM/DD'),'59,99','26','27','6000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('28','Shadow of the Tomb Raider',to_date('18/09/14','RR/MM/DD'),'49,99','27','28','9000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('29','Death Stranding',to_date('19/11/08','RR/MM/DD'),'59,99','28','29','6000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('30','Assassins Creed Valhalla',to_date('20/11/10','RR/MM/DD'),'59,99','1','3','18000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('31','FIFA 21',to_date('20/10/09','RR/MM/DD'),'49,99','2','4','50000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('32','Gears 5',to_date('19/09/10','RR/MM/DD'),'39,99','3','5','15000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('33','Far Cry 5',to_date('18/03/27','RR/MM/DD'),'59,99','4','6','15000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('34','Metro Exodus',to_date('19/02/15','RR/MM/DD'),'49,99','5','7','10000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('35','Dead Redemption',to_date('21/03/25','RR/MM/DD'),'69,99','6','8','7000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('36','Need for Speed Heat',to_date('19/11/08','RR/MM/DD'),'59,99','7','9','8000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('37','Kingdoms of Amalur: Re-Reckoning',to_date('20/09/08','RR/MM/DD'),'39,99','8','10','5000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('38','Monster Hunter: World',to_date('18/08/09','RR/MM/DD'),'59,99','9','11','16000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('39','Star Wars Jedi: Fallen Order',to_date('19/11/15','RR/MM/DD'),'59,99','10','12','12000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('40','Call of Duty: Warzone',to_date('20/03/10','RR/MM/DD'),'0','11','13','100000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('41','Madden NFL 21',to_date('20/08/28','RR/MM/DD'),'49,99','12','14','6000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('42','Watch Dogs 2',to_date('16/11/15','RR/MM/DD'),'39,99','13','15','11000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('43','Borderlands 3',to_date('19/09/13','RR/MM/DD'),'59,99','14','16','14000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('44','Sekiro: Shadows Die Twice',to_date('19/03/22','RR/MM/DD'),'59,99','15','17','8000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('45','The Outer Worlds',to_date('19/10/25','RR/MM/DD'),'59,99','16','18','5000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('46','Control',to_date('19/08/27','RR/MM/DD'),'59,99','17','19','4000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('47','CyberConnect2: Naruto',to_date('17/10/27','RR/MM/DD'),'49,99','18','20','7000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('48','Tales of Vesperia',to_date('08/08/06','RR/MM/DD'),'39,99','19','21','6000000');
Insert into "C##student".GRY (ID,TYTUL,DATA_WYDANIA,CENA,ID_TWORCY,ID_WYDAWCY,ILOSC_SPRZEDANYCH_KOPI) values ('49','Dragon Age: Inquisition',to_date('14/11/18','RR/MM/DD'),'59,99','20','22','13000000');
REM INSERTING into "C##student".GRY_GATUNKI
SET DEFINE OFF;
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('1','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('2','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('2','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('3','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('3','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('3','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('4','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('4','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('4','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('5','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('5','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('5','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('6','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('6','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('6','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('7','9');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('7','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('8','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('8','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('9','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('9','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('9','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('10','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('10','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('11','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('11','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('11','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('12','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('12','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('13','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('13','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('14','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('14','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('14','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('15','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('15','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('15','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('16','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('16','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('17','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('17','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('18','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('18','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('19','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('19','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('20','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('20','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('21','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('21','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('21','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('22','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('22','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('22','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('23','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('23','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('23','9');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('24','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('24','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('24','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('25','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('25','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('25','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('26','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('26','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('27','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('27','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('27','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('28','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('28','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('28','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('29','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('29','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('29','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('30','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('30','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('30','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('31','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('31','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('31','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('32','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('32','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('32','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('33','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('33','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('33','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('34','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('34','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('34','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('35','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('35','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('35','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('36','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('36','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('36','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('37','9');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('37','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('37','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('38','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('38','9');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('38','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('39','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('39','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('39','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('40','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('40','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('40','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('41','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('41','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('42','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('42','1');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('43','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('43','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('43','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('44','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('44','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('44','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('45','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('45','12');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('46','9');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('46','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('46','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('47','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('47','10');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('47','7');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('48','6');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('48','15');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('49','2');
Insert into "C##student".GRY_GATUNKI (ID_GRY,ID_GATUNEK) values ('49','10');
REM INSERTING into "C##student".RECENZJE
SET DEFINE OFF;
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('1','9','Świetna gra, niesamowity świat i fabuła!','1');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('2','8','Bardzo dobra, ale nieco powtarzalna.','1');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('3','7','Bardzo podobne do poprzednich wersji, ale nadal świetna zabawa.','2');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('4','6','Zbyt dużo mikrotransakcji, ale graficznie ładna.','2');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('5','8','Solidna kontynuacja, wciągająca fabuła i świetna grafika.','3');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('6','7','Mechanika gry nieco przestarzała, ale nadal dobra.','3');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('7','8','Otwarte środowisko i przyjemna zabawa, ale historia mogła być lepsza.','4');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('8','9','Piękny świat, pełno aktywności do wykonania!','4');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('9','9','Wciągająca historia i przepiękna grafika.','5');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('10','8','Zdecydowanie polecam, ale wymaga lepszego optymalizowania na PC.','5');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('11','10','Jedna z najlepszych gier, jakie kiedykolwiek grałem.','6');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('12','8','Klimatyczna, ale zbyt długa.','6');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('13','8','Szybka zabawa i świetna ściganka!','7');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('14','7','Wspaniała grafika, ale rozgrywka dość przewidywalna.','7');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('15','7','Bardzo przyjemna gra, choć nieco staromodna.','8');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('16','8','Wciągająca historia, ale trochę za mało innowacji.','8');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('17','10','Świetny tytuł z niesamowitymi bossami i dużą ilością grindu.','9');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('18','9','Niezwykle zabawne, ale może być przytłaczające dla nowych graczy.','9');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('19','9','Wspaniała przygoda w uniwersum Star Wars, grafika na najwyższym poziomie.','10');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('20','8','Fajna gra, ale nieco za krótka.','10');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('21','8','Dobra zabawa, ale wciąż zbyt wiele błędów.','11');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('22','9','Zabawa na godzinami, świetna grafika i mechanika.','11');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('23','7','Dla fanów NFL, gra jest świetna, ale reszta graczy może się nudzić.','12');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('24','8','Dobrze odwzorowuje mecze NFL, ale brak innowacji.','12');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('25','8','Wciągająca fabuła i świetna zabawa w otwartym świecie.','13');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('26','7','Graficznie dobra, ale nieco powtarzalna.','13');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('27','9','Bardzo zabawna, świetna rozgrywka i humor.','14');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('28','8','Zabawne, ale fabuła mogła być lepsza.','14');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('29','10','Jedna z najlepszych gier akcji, która wymaga cierpliwości i umiejętności.','15');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('30','9','Bardzo trudna, ale wciągająca. Dla fanów wyzwań!','15');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('31','9','Wspaniała gra RPG z ciekawą fabułą i bardzo dobrym humorem.','16');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('32','8','Gra zbyt krótka, ale świetna zabawa.','16');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('33','9','Świetna grafika i wciągająca fabuła.','17');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('34','8','Bardzo dobry klimat, ale miejscami mechanika może rozczarować.','17');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('35','7','Dla fanów Naruto, bardzo dobra gra, ale nieco za mało innowacji.','18');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('36','8','Dobre, ale mogłoby być więcej postaci i historii.','18');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('37','8','Wspaniała gra RPG z interesującymi postaciami.','19');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('38','9','Świetna zabawa z naprawdę bogatym światem.','19');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('39','9','Świetne, klasyczne RPG z genialnym światem i postaciami.','20');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('40','8','Fajna gra, ale miejscami za dużo powtarzalnych zadań.','20');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('41','8','Dynamiczna gra, ale czasami zdarzają się błędy serwerowe.','21');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('42','9','Bardzo dobra gra, która przyciąga na długie godziny.','21');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('43','10','Niesamowita gra, prawdziwe arcydzieło w otwartym świecie.','22');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('44','9','Piękny, ale długa kampania.','22');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('45','7','Gra wciąż popularna, ale stale się zmienia.','23');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('46','6','Gra zbyt uzależniająca, nie ma większych innowacji.','23');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('47','10','Bez wątpienia najlepsza gra RPG, którą można zagrać!','24');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('48','9','Zajmuje dużo czasu, ale warto.','24');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('49','10','Klasyka gatunku, wciągająca na wiele godzin.','25');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('50','9','Bardzo długa gra, pełna przygód, ale czasami ma swoje problemy techniczne.','25');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('51','8','Odświeżona wersja z nową mechaniką, bardzo fajna.','26');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('52','7','Klimatyczna gra, ale miejscami nużąca.','26');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('53','9','Perfekcyjnie zaplanowane misje, naprawdę dobrze zaprojektowane lokacje.','27');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('54','8','Fajna gra, ale miejscami przewidywalna.','27');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('55','10','Genialna gra, która przyciąga na długie godziny!','28');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('56','9','Wciągająca historia, ale mogłoby być więcej misji pobocznych.','28');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('57','9','Świetna gra drużynowa, idealna dla fanów FPS.','29');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('58','8','Zabawa na godzinami, ale balans w drużynach czasem bywa problematyczny.','29');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('59','9','Wielka przygoda w starożytnej Grecji, mnóstwo godzin zabawy.','30');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('60','8','Długa gra, zbyt wiele powtarzalnych zadań.','30');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('61','9,5','Niesamowita VR-owa przygoda, grafika i mechanika na najwyższym poziomie!','31');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('62','8','Wciągająca gra, ale VR może być nie dla każdego.','31');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('63','10','Najlepsza gra roku, przełomowa fabuła i emocje.','32');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('64','9','Piękna opowieść, ale niektóre decyzje fabularne budzą kontrowersje.','32');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('65','8,5','Dynamika gry i akcja na najwyższym poziomie, ale wymaga sporo czasu na naukę.','33');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('66','9','Wciągająca, świetna gra drużynowa, ale wymaga cierpliwości.','33');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('67','7,5','Gra jest świetna w wielu aspektach, ale techniczne błędy psują zabawę.','34');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('68','9','Niesamowity świat, fabuła i postacie, jednak grywalność bywa zakłócona.','34');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('69','10','Po prostu arcydzieło, fantastyczny świat i historia.','35');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('70','9','Piękna gra, ale bardzo długa, co nie każdemu pasuje.','35');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('71','8','Świetna zabawa z przyjaciółmi, ale bardzo trudna.','36');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('72','7','Zabawa na krótkie sesje, ale zbyt łatwo się nudzi.','36');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('73','9','Wciągająca gra, mnóstwo godzin zabawy z potworami.','37');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('74','8,5','Gra oferuje świetną zabawę, ale grind może być nużący.','37');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('75','10','Bez wątpienia najlepsza gra RPG, którą można zagrać!','38');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('76','9','Zajmuje dużo czasu, ale warto każdą minutę.','38');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('77','9','Świetna zabawa z Mario, świetna mechanika i koloryt gry!','39');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('78','8,5','Niezła gra, ale momentami za łatwa.','39');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('79','10','Genialna przygoda w pełnym otwartym świecie.','40');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('80','9','Zdecydowanie jedna z najlepszych gier, ale czasami można się zgubić.','40');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('81','8,5','Świetna gra na imprezy, ale momentami zbyt chaotyczna.','41');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('82','7','Dobre, ale może szybko nudzić, jeśli gra się za długo.','41');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('83','9','Znakomita gra, mnóstwo do zrobienia w tym ogromnym świecie.','42');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('84','8,5','Wciągająca, ale już trochę przestarzała.','42');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('85','8,5','Ciekawa fabuła, świetna atmosfera, ale optymalizacja wymaga poprawek.','43');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('86','9','Świetny tytuł z fantastycznym światem.','43');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('87','9','Strasznie dobra gra, super klimat i fabuła.','44');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('88','8,5','Wciągająca gra, ale rozgrywka jest nieco krótka.','44');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('89','9,5','Świetna gra, misje wymagają dużej precyzji i pomysłowości.','45');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('90','9','Perfekcyjnie zaplanowane misje, z dobrze zaprojektowanymi lokacjami.','45');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('91','9','Urocza, spokojna gra, idealna do relaksu.','46');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('92','8','Gra idealna na odstresowanie, ale nieco za powtarzalna.','46');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('93','10','Jedna z najlepszych gier akcji, wyzwań jest naprawdę sporo!','47');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('94','9','Dla prawdziwych fanów trudnych gier, naprawdę satysfakcjonująca rozgrywka.','47');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('95','8','Bardzo fajna gra drużynowa, idealna na szybkie sesje.','48');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('96','7,5','Gra jest świetna, ale wymaga dużo czasu na naukę sterowania.','48');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('97','9,5','Wspaniała gra, odświeżona wersja klasyka z niesamowitymi efektami wizualnymi.','49');
Insert into "C##student".RECENZJE (ID,OCENA,TRESC,ID_GRY) values ('98','9','Wciągająca fabuła, piękna oprawa graficzna, ale trochę za krótka.','49');
REM INSERTING into "C##student".TWORCY
SET DEFINE OFF;
Insert into "C##student".TWORCY (ID,NAZWA) values ('30','dasdas');
Insert into "C##student".TWORCY (ID,NAZWA) values ('1','TobyFox');
Insert into "C##student".TWORCY (ID,NAZWA) values ('2','CDProjektRed');
Insert into "C##student".TWORCY (ID,NAZWA) values ('3','NaughtyDog');
Insert into "C##student".TWORCY (ID,NAZWA) values ('4','RockstarGames');
Insert into "C##student".TWORCY (ID,NAZWA) values ('5','Ubisoft');
Insert into "C##student".TWORCY (ID,NAZWA) values ('6','Bethesda');
Insert into "C##student".TWORCY (ID,NAZWA) values ('7','Valve');
Insert into "C##student".TWORCY (ID,NAZWA) values ('8','SquareEnix');
Insert into "C##student".TWORCY (ID,NAZWA) values ('9','InsomniacGames');
Insert into "C##student".TWORCY (ID,NAZWA) values ('10','FromSoftware');
Insert into "C##student".TWORCY (ID,NAZWA) values ('11','Bungie');
Insert into "C##student".TWORCY (ID,NAZWA) values ('12','EpicGames');
Insert into "C##student".TWORCY (ID,NAZWA) values ('13','RespawnEntertainment');
Insert into "C##student".TWORCY (ID,NAZWA) values ('14','ElectronicArts');
Insert into "C##student".TWORCY (ID,NAZWA) values ('15','BlizzardEntertainment');
Insert into "C##student".TWORCY (ID,NAZWA) values ('16','Bioware');
Insert into "C##student".TWORCY (ID,NAZWA) values ('17','Treyarch');
Insert into "C##student".TWORCY (ID,NAZWA) values ('18','BandaiNamco');
Insert into "C##student".TWORCY (ID,NAZWA) values ('19','Mojang');
Insert into "C##student".TWORCY (ID,NAZWA) values ('20','ParadoxInteractive');
Insert into "C##student".TWORCY (ID,NAZWA) values ('21','RemedyEntertainment');
Insert into "C##student".TWORCY (ID,NAZWA) values ('22','PlatinumGames');
Insert into "C##student".TWORCY (ID,NAZWA) values ('23','505Games');
Insert into "C##student".TWORCY (ID,NAZWA) values ('24','DontnodEntertainment');
Insert into "C##student".TWORCY (ID,NAZWA) values ('25','ObsidianEntertainment');
Insert into "C##student".TWORCY (ID,NAZWA) values ('26','KojimaProductions');
Insert into "C##student".TWORCY (ID,NAZWA) values ('27','King');
Insert into "C##student".TWORCY (ID,NAZWA) values ('28','Nexon');
Insert into "C##student".TWORCY (ID,NAZWA) values ('29','LarianStudios');
REM INSERTING into "C##student".WYDAWCY
SET DEFINE OFF;
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('30','dasdas','21');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('1','ElectronicArts','30');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('2','Activision','25');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('3','Nintendo','20');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('4','SonyInteractive','18');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('5','Microsoft','22');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('6','Ubisoft','28');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('7','SquareEnix','15');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('8','Bethesda','19');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('9','Valve','10');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('10','BandaiNamco','17');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('11','TakeTwoInteractive','23');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('12','Capcom','16');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('13','ActivisionBlizzard','25');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('14','EA','30');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('15','ParadoxInteractive','12');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('16','DeepSilver','20');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('17','FocusHomeInteractive','18');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('18','2KGames','24');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('19','WarnerBrosInteractive','22');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('20','CIGames','15');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('21','RiotGames','30');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('22','Bungie','20');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('23','KoeiTecmo','16');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('24','EpicGames','10');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('25','Mojang','18');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('26','Sega','22');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('27','Zynga','17');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('28','Nexon','25');
Insert into "C##student".WYDAWCY (ID,NAZWA,MARZA_PROCENT) values ('29','RemedyEntertainment','12');
--------------------------------------------------------
--  DDL for Trigger TRG_DELETE_GAME_CASCADE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##student"."TRG_DELETE_GAME_CASCADE" 
AFTER DELETE ON gry
FOR EACH ROW
BEGIN
    -- Usuń powiązania w Gry_Gatunki
    DELETE FROM gry_gatunki WHERE id_gry = :OLD.id;

    -- Usuń recenzje powiązane z grą
    DELETE FROM recenzje WHERE id_gry = :OLD.id;
END;
/
ALTER TRIGGER "C##student"."TRG_DELETE_GAME_CASCADE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DELETE_GAMES_CASCADE_ON_PUBLISHER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##student"."TRG_DELETE_GAMES_CASCADE_ON_PUBLISHER" 
AFTER DELETE ON wydawcy
FOR EACH ROW
BEGIN
    -- Usuń gry powiązane z usuniętym wydawcą
    DELETE FROM gry WHERE id_wydawcy = :OLD.id;
END;
/
ALTER TRIGGER "C##student"."TRG_DELETE_GAMES_CASCADE_ON_PUBLISHER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DELETE_GENRE_CASCADE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##student"."TRG_DELETE_GENRE_CASCADE" 
AFTER DELETE ON gatunki
FOR EACH ROW
BEGIN
    DELETE FROM gry_gatunki WHERE id_gatunek = :OLD.id;
END;
/
ALTER TRIGGER "C##student"."TRG_DELETE_GENRE_CASCADE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_UPDATE_GAME_ID_CASCADE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##student"."TRG_UPDATE_GAME_ID_CASCADE" 
AFTER UPDATE OF id ON gry
FOR EACH ROW
BEGIN
    -- Aktualizuj ID Gry w Gry_Gatunki
    UPDATE gry_gatunki
    SET id_gry = :NEW.id
    WHERE id_gry = :OLD.id;

    -- Aktualizuj ID Gry w Recenzjach
    UPDATE recenzje
    SET id_gry = :NEW.id
    WHERE id_gry = :OLD.id;
END;
/
ALTER TRIGGER "C##student"."TRG_UPDATE_GAME_ID_CASCADE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_UPDATE_GAMES_ON_PUBLISHER_ID_CHANGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##student"."TRG_UPDATE_GAMES_ON_PUBLISHER_ID_CHANGE" 
AFTER UPDATE OF id ON wydawcy
FOR EACH ROW
BEGIN
    -- Zaktualizuj ID_Wydawcy w tabeli Gry
    UPDATE gry
    SET id_wydawcy = :NEW.id
    WHERE id_wydawcy = :OLD.id;
END;
/
ALTER TRIGGER "C##student"."TRG_UPDATE_GAMES_ON_PUBLISHER_ID_CHANGE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_UPDATE_GENRE_ID_CASCADE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##student"."TRG_UPDATE_GENRE_ID_CASCADE" 
AFTER UPDATE OF id ON gatunki
FOR EACH ROW
BEGIN
    UPDATE gry_gatunki
    SET id_gatunek = :NEW.id
    WHERE id_gatunek = :OLD.id;
END;
/
ALTER TRIGGER "C##student"."TRG_UPDATE_GENRE_ID_CASCADE" ENABLE;
--------------------------------------------------------
--  DDL for Package GATUNKI_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "C##student"."GATUNKI_PACKAGE" AS
    --crud
    PROCEDURE ADDGENRE (GenreName VARCHAR);

    PROCEDURE UPDATEGENRE (GenreID INT, NewGenreName VARCHAR);

    PROCEDURE REMOVEGENRE (GenreID INT);

    FUNCTION GetAllGenres RETURN SYS_REFCURSOR;

    FUNCTION GetBestRatedGenre RETURN SYS_REFCURSOR;

    FUNCTION GetBestEarningGenre RETURN SYS_REFCURSOR;

    FUNCTION GetGamesByGenre(GenreID INT) RETURN SYS_REFCURSOR;

    FUNCTION GetAverageRatingByGenre(GenreID INT) RETURN SYS_REFCURSOR;

    FUNCTION GetTotalEarningsByGenre(GenreID INT) RETURN SYS_REFCURSOR;

END gatunki_package;

/
--------------------------------------------------------
--  DDL for Package GRY_GATUNKI_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "C##student"."GRY_GATUNKI_PACKAGE" AS
    PROCEDURE ADDGAMEGENRE
    (
        GameID INT,
        GenreID INT
    );

    PROCEDURE UPDATEGAMEGENREBYGAMEID (
    GameID INT,
    OldGenreID INT,
    NewGenreID INT
);

PROCEDURE REMOVEGAMEGENRE (
    GameID INT,
    GenreID INT
);

FUNCTION GetALLGameGenresNames RETURN SYS_REFCURSOR;

FUNCTION GetGameNameByID(GameID INT) 
RETURN SYS_REFCURSOR;

FUNCTION GetGenreNameByID(GenreID INT) 
RETURN SYS_REFCURSOR;


END gry_gatunki_package;

/
--------------------------------------------------------
--  DDL for Package GRY_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "C##student"."GRY_PACKAGE" AS
    PROCEDURE ADDGAME (
        GameTitle VARCHAR,           -- Tytuł gry
        ReleaseDate DATE,            -- Data wydania
        GamePrice NUMBER,            -- Cena gry
        GameAuthorId INT,            -- ID autora gry
        GamePublisherId INT,         -- ID wydawcy gry
        ILOSC_SPRZEDANYCH_KOPI NUMBER -- Liczba sprzedanych kopii
    );

    PROCEDURE REMOVEGAME (
    GameID INT
);

PROCEDURE UPDATEGAME (
    GameID INT,
    NewGameTitle VARCHAR,
    NewReleaseDate DATE,
    NewGamePrice NUMBER,
    NewGameAuthorId INT,
    NewGamePublisherId INT,
    NewIloscSprzedanychKopii NUMBER
);

PROCEDURE UpdateGamePriceBasedOnMonthlySales (
    p_GameID INT,              -- ID gry
    p_MonthlySales INT         -- Liczba sprzedanych kopii w danym miesiącu
);

FUNCTION GetGamesAndEarningsByAuthor(GameID INT) 
RETURN SYS_REFCURSOR;

FUNCTION GetGamePublisherName(GameID INT)
RETURN SYS_REFCURSOR;

FUNCTION GetAllGames
RETURN SYS_REFCURSOR;


FUNCTION GetBestRatedGame RETURN SYS_REFCURSOR;

FUNCTION GetHighestEarningGame 
RETURN SYS_REFCURSOR;

FUNCTION GetGameReviews(GameID INT) RETURN SYS_REFCURSOR;

FUNCTION GetGameGenres(GameID INT) RETURN SYS_REFCURSOR;

FUNCTION GetAverageGameRating (
    p_GameID INT
) RETURN SYS_REFCURSOR;

FUNCTION GetTotalRevenue(GameID INT) 
RETURN SYS_REFCURSOR;

FUNCTION GetGameCreatorName(GameID INT)
RETURN SYS_REFCURSOR;




END gry_package;

/
--------------------------------------------------------
--  DDL for Package RECENZJE_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "C##student"."RECENZJE_PACKAGE" AS
PROCEDURE ADDREVIEW (
    ReviewRate NUMBER,        -- Ocena recenzji
    ReviewContent VARCHAR,    -- Treść recenzji
    ReviewGameId INT          -- ID gry, do której przypisana jest recenzja
);

PROCEDURE UPDATEREVIEW (
    ReviewID INT,              -- ID recenzji, którą chcemy zaktualizować
    NewReviewRate NUMBER,      -- Nowa ocena recenzji
    NewReviewContent VARCHAR,  -- Nowa treść recenzji
    NewReviewGameId INT        -- Nowe ID gry, do której przypisana jest recenzja
);

PROCEDURE REMOVEREVIEW (
    ReviewID INT
);

FUNCTION GetAllReviews RETURN SYS_REFCURSOR;

END recenzje_package;

/
--------------------------------------------------------
--  DDL for Package TWORCY_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "C##student"."TWORCY_PACKAGE" AS

PROCEDURE ADDAUTHOR (
    AuthorName VARCHAR -- Nazwa autora
);

PROCEDURE UPDATEAUTHOR (
    AuthorID INT,          -- ID autora, którego chcemy zmienić
    NewAuthorName VARCHAR  -- Nowa nazwa autora
);


PROCEDURE REMOVEAUTHOR (
    AuthorID INT
);


FUNCTION GetAllAuthors RETURN SYS_REFCURSOR;

FUNCTION GetBestEarningAuthor RETURN SYS_REFCURSOR;

FUNCTION GetBestRatedAuthor RETURN SYS_REFCURSOR;

FUNCTION GetAverageRatingByAuthor(AuthorID INT) RETURN SYS_REFCURSOR;

FUNCTION GetGenresWithEarningsAndAvgRatingsByAuthor(AuthorID INT) RETURN SYS_REFCURSOR;

FUNCTION GetGamesByAuthor(AuthorID INT) RETURN SYS_REFCURSOR;

FUNCTION GetBestEarningGameByAuthor(AuthorID INT) RETURN SYS_REFCURSOR;

FUNCTION GetBestRatedGameForAuthor(AuthorID INT) RETURN SYS_REFCURSOR;

FUNCTION GetBestEarningGenreByAuthor(AuthorID INT) RETURN SYS_REFCURSOR;




END tworcy_package;

/
--------------------------------------------------------
--  DDL for Package WYDAWCY_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "C##student"."WYDAWCY_PACKAGE" AS
PROCEDURE ADDPUBLISHER (
    publisherName VARCHAR,  -- Nazwa wydawcy
    publisherMargin INT    -- Marża procentowa wydawcy
);

PROCEDURE REMOVEPUBLISHER (
    PublisherID INT
);

PROCEDURE UPDATEPUBLISHER (
    PublisherID INT,               -- ID wydawcy, którego chcemy zaktualizować
    NewPublisherName VARCHAR,      -- Nowa nazwa wydawcy
    NewPublisherMargin INT         -- Nowa marża procentowa wydawcy
);

FUNCTION GetAllGamesByPublisher(PublisherID INT) RETURN SYS_REFCURSOR;

FUNCTION GetAllPublishers RETURN SYS_REFCURSOR;

FUNCTION GetAverageRatingByPublisher(PublisherID INT) RETURN SYS_REFCURSOR;

FUNCTION GetBestEarningPublisher RETURN SYS_REFCURSOR;

FUNCTION GetBestRatedGameForPublisher(PublisherID INT) RETURN SYS_REFCURSOR;

FUNCTION GetBestRatedGenreForPublisher(PublisherID INT) RETURN SYS_REFCURSOR;

FUNCTION GetBestRatedPublisher RETURN SYS_REFCURSOR;

FUNCTION GetBestSellingGameForPublisher(PublisherID INT) RETURN SYS_REFCURSOR;

FUNCTION GetBestSellingGenreForPublisher(PublisherID INT) RETURN SYS_REFCURSOR;

FUNCTION GetGameCreatorName(GameID INT) RETURN SYS_REFCURSOR;

FUNCTION GetGenresWithRatingsAndEarningsByPublisher(PublisherID INT) RETURN SYS_REFCURSOR;




END wydawcy_package;

/
--------------------------------------------------------
--  DDL for Package Body GATUNKI_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "C##student"."GATUNKI_PACKAGE" AS
    PROCEDURE ADDGENRE (
        GenreName VARCHAR -- Nazwa nowego gatunku
    ) AS
        NewGenreID INT; -- Zmienna do przechowywania nowego ID gatunku
    BEGIN
        -- Pobranie nowego ID gatunku z sekwencji
        SELECT seq_gatunki_id.NEXTVAL
        INTO NewGenreID
        FROM dual;

        -- Dodanie nowego rekordu z wygenerowanym ID
        INSERT INTO GATUNKI(ID, NAZWA)
        VALUES(NewGenreID, GenreName);

        -- Opcjonalne wyświetlenie informacji
        DBMS_OUTPUT.PUT_LINE('Dodano nowy gatunek o ID: ' || NewGenreID || ', Nazwa: ' || GenreName);
    EXCEPTION
        -- Obsługa błędów
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
    END;


    PROCEDURE REMOVEGENRE
    (
        GenreID INT -- ID gatunku do usunięcia
    )
    AS
    BEGIN
        -- Próba usunięcia rekordu
        DELETE FROM Gatunki
        WHERE ID = GenreID;

        -- Jeśli nie usunięto żadnego wiersza, rzuć wyjątek
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Nie znaleziono gatunku o ID: ' || GenreID);
        END IF;

        -- Komunikat o sukcesie (opcjonalne w DBMS_OUTPUT)
        DBMS_OUTPUT.PUT_LINE('Gatunek o ID ' || GenreID || ' został usunięty i ID zostały naprawione.');
    EXCEPTION
        -- Obsługa wyjątków
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Wystąpił błąd podczas usuwania: ' || SQLERRM);
    END;


    PROCEDURE UPDATEGENRE (
        GenreID INT,               -- ID gatunku, który chcemy zaktualizować
        NewGenreName VARCHAR       -- Nowa nazwa gatunku
    ) AS
    BEGIN
        -- Zaktualizowanie rekordu w tabeli Gatunki na podstawie GenreID
        UPDATE Gatunki
        SET Nazwa = NewGenreName
        WHERE ID = GenreID;

        -- Sprawdzanie, czy zmiana się udała
        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Nie znaleziono gatunku o ID: ' || GenreID);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Zmieniono nazwę gatunku o ID: ' || GenreID || ' na: ' || NewGenreName);
        END IF;
    EXCEPTION
        -- Obsługa błędów
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
    END;


    FUNCTION GetAllGenres RETURN SYS_REFCURSOR IS
        v_Genres SYS_REFCURSOR;   -- Kursor wyników
    BEGIN
        -- Wybierz wszystkie gatunki z tabeli "gatunki"
        OPEN v_Genres FOR
            SELECT g.ID, g.Nazwa
            FROM gatunki g;

        -- Zwróć kursor z wynikami
        RETURN v_Genres;
    END GetAllGenres;


    FUNCTION GetBestRatedGenre RETURN SYS_REFCURSOR IS
        v_BestRatedGenre SYS_REFCURSOR; -- Kursor wynikowy
    BEGIN
        -- Otwórz kursor, który zwraca nazwę najlepiej ocenianego gatunku oraz średnią ocenę
        OPEN v_BestRatedGenre FOR
            SELECT 
                g.Nazwa AS GenreName,
                AVG(r.OCENA) AS AverageRating
            FROM gatunki g
            JOIN Gry_Gatunki gg ON g.ID = gg.ID_GATUNEK
            JOIN Gry gr ON gg.ID_GRY = gr.ID
            LEFT JOIN RECENZJE r ON gr.ID = r.ID_GRY
            GROUP BY g.Nazwa
            ORDER BY AVG(r.OCENA) DESC
            FETCH FIRST 1 ROWS ONLY; -- Pobierz tylko najlepiej oceniany gatunek

        -- Zwróć kursor
        RETURN v_BestRatedGenre;
    END GetBestRatedGenre;


    FUNCTION GetBestEarningGenre RETURN SYS_REFCURSOR IS
        v_BestEarningGenre SYS_REFCURSOR; -- Kursor wynikowy
    BEGIN
        -- Otwórz kursor, który zwraca nazwę najlepiej zarabiającego gatunku oraz jego całkowite zarobki
        OPEN v_BestEarningGenre FOR
            SELECT 
                g.Nazwa AS GenreName,
                SUM((gr.CENA * gr.ILOSC_SPRZEDANYCH_KOPI) * (1 - (w.MARZA_PROCENT / 100))) AS TotalEarnings
            FROM gatunki g
            JOIN Gry_Gatunki gg ON g.ID = gg.ID_GATUNEK
            JOIN Gry gr ON gg.ID_GRY = gr.ID
            JOIN Wydawcy w ON gr.ID_WYDawcy = w.ID
            GROUP BY g.Nazwa
            ORDER BY TotalEarnings DESC
            FETCH FIRST 1 ROWS ONLY; -- Pobierz tylko najlepiej zarabiający gatunek

        -- Zwróć kursor
        RETURN v_BestEarningGenre;
    END GetBestEarningGenre;


    FUNCTION GetGamesByGenre(GenreID INT) RETURN SYS_REFCURSOR IS
        v_GamesByGenre SYS_REFCURSOR;   -- Kursor wyników
    BEGIN
        -- Wybierz wszystkie gry powiązane z danym gatunkiem
        OPEN v_GamesByGenre FOR
            SELECT g.Tytul AS GameTitle
            FROM gry g
            JOIN Gry_Gatunki gg ON g.ID = gg.ID_GRY
            WHERE gg.ID_GATUNEK = GenreID;

        -- Zwróć kursor z wynikami
        RETURN v_GamesByGenre;
    END GetGamesByGenre;


    FUNCTION GetAverageRatingByGenre(GenreID INT) 
        RETURN SYS_REFCURSOR IS
            v_AvgRatingCursor SYS_REFCURSOR;  -- Kursor wynikowy
        BEGIN
            -- Otwórz kursor, który oblicza średnią ocenę dla gier w danym gatunku
            OPEN v_AvgRatingCursor FOR
                SELECT AVG(r.OCENA) AS AverageRating
                FROM RECENZJE r
                JOIN GRY g ON r.ID_GRY = g.ID
                JOIN Gry_Gatunki gg ON g.ID = gg.ID_GRY
                WHERE gg.ID_GATUNEK = GenreID;

            -- Zwróć kursor
            RETURN v_AvgRatingCursor;
        END GetAverageRatingByGenre;

        FUNCTION GetTotalEarningsByGenre(GenreID INT) 
            RETURN SYS_REFCURSOR IS
                v_TotalEarningsCursor SYS_REFCURSOR;  -- Kursor wynikowy
            BEGIN
                -- Otwórz kursor, który oblicza sumę zarobków dla gier w danym gatunku
                OPEN v_TotalEarningsCursor FOR
                    SELECT SUM(g.CENA * g.ILOSC_SPRZEDANYCH_KOPI * (1 - (w.MARZA_PROCENT / 100))) AS TotalEarnings
                    FROM GRY g
                    JOIN Gry_Gatunki gg ON g.ID = gg.ID_GRY
                    JOIN Wydawcy w ON g.ID_WYDawcy = w.ID
                    WHERE gg.ID_GATUNEK = GenreID;

                -- Zwróć kursor
                RETURN v_TotalEarningsCursor;
            END GetTotalEarningsByGenre;
END gatunki_package;

/
--------------------------------------------------------
--  DDL for Package Body GRY_GATUNKI_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "C##student"."GRY_GATUNKI_PACKAGE" AS
    PROCEDURE ADDGAMEGENRE
    (
        GameID INT,
        GenreID INT
    ) AS
    BEGIN
        INSERT INTO GRY_GATUNKI(ID_GRY,ID_GATUNEK)
        VALUES(GameID,GenreID);
    END;


PROCEDURE UPDATEGAMEGENREBYGAMEID (
    GameID INT,
    OldGenreID INT,
    NewGenreID INT
) AS
BEGIN
    -- Aktualizujemy GenreID w tabeli GameGenre na podstawie GameID i OldGenreID
    UPDATE GRY_GATUNKI
    SET ID_GATUNEK = NewGenreID
    WHERE ID_GRY = GameID AND ID_GATUNEK = OldGenreID;

    -- Sprawdzamy, czy operacja się powiodła
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nie znaleziono powiązania dla gry o podanym GameID i gatunku OldGenreID.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Gatunek gry o ID ' || GameID || ' został zmieniony z ' || OldGenreID || ' na ' || NewGenreID);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;

PROCEDURE REMOVEGAMEGENRE (
    GameID INT,
    GenreID INT
) AS
BEGIN
    -- Usuwamy powiązanie gry z gatunkiem na podstawie GameID i GenreID
    DELETE FROM gry_gatunki
    WHERE ID_GRY = GameID AND ID_GATUNEK = GenreID;

    -- Sprawdzamy, czy operacja się powiodła
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nie znaleziono powiązania gry z gatunkiem.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Powiązanie gry o ID ' || GameID || ' z gatunkiem o ID ' || GenreID || ' zostało usunięte.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;

FUNCTION GetALLGameGenresNames RETURN SYS_REFCURSOR IS
    v_GameGenres SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz wszystkie powiązania gier i gatunków z tabeli gry_gatunki
    OPEN v_GameGenres FOR
        SELECT g.id, gt.id
        FROM gry_gatunki gg
        JOIN gry g ON gg.ID_GRY = g.ID
        JOIN gatunki gt ON gg.ID_GATUNEK = gt.ID;

    -- Zwróć kursor z wynikami
    RETURN v_GameGenres;
END GetAllGameGenresNames;


FUNCTION GetGameNameByID(GameID INT) 
RETURN SYS_REFCURSOR IS
    v_GameNameCursor SYS_REFCURSOR;  -- Kursor wynikowy
BEGIN
    -- Otwórz kursor, który zwraca nazwę gry na podstawie ID
    OPEN v_GameNameCursor FOR
        SELECT g.Tytul AS GameName
        FROM GRY g
        WHERE g.ID = GameID;

    -- Zwróć kursor
    RETURN v_GameNameCursor;
END GetGameNameByID;

FUNCTION GetGenreNameByID(GenreID INT) 
RETURN SYS_REFCURSOR IS
    v_GenreNameCursor SYS_REFCURSOR;  -- Kursor wynikowy
BEGIN
    -- Otwórz kursor, który zwraca nazwę gatunku na podstawie ID
    OPEN v_GenreNameCursor FOR
        SELECT g.Nazwa AS GenreName
        FROM GATUNKI g
        WHERE g.ID = GenreID;

    -- Zwróć kursor
    RETURN v_GenreNameCursor;
END GetGenreNameByID;


END gry_gatunki_package;

/
--------------------------------------------------------
--  DDL for Package Body GRY_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "C##student"."GRY_PACKAGE" AS
    PROCEDURE ADDGAME (
        GameTitle VARCHAR,           -- Tytuł gry
        ReleaseDate DATE,            -- Data wydania
        GamePrice NUMBER,            -- Cena gry
        GameAuthorId INT,            -- ID autora gry
        GamePublisherId INT,         -- ID wydawcy gry
        ILOSC_SPRZEDANYCH_KOPI NUMBER -- Liczba sprzedanych kopii
    ) AS
        NewGameID INT;              -- Zmienna do przechowania nowego ID gry
    BEGIN

        -- Pobranie nowego ID gry z sekwencji
        SELECT seq_gry_id.NEXTVAL
        INTO NewGameID
        FROM dual;

        -- Dodanie nowego rekordu z wygenerowanym ID oraz liczbą sprzedanych kopii
        INSERT INTO gry(ID, Tytul, Data_Wydania, CENA, ID_Tworcy, ID_Wydawcy, ILOSC_SPRZEDANYCH_KOPI)
        VALUES(NewGameID, GameTitle, ReleaseDate, GamePrice, GameAuthorId, GamePublisherId, ILOSC_SPRZEDANYCH_KOPI);

        -- Opcjonalne wyświetlenie informacji
        DBMS_OUTPUT.PUT_LINE('Dodano nową grę o ID: ' || NewGameID || ', Tytuł: ' || GameTitle);
    EXCEPTION
        -- Obsługa błędów
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
    END;


    PROCEDURE REMOVEGAME (
    GameID INT
) AS
BEGIN
    -- Usuwamy grę na podstawie ID
    DELETE FROM gry WHERE ID = GameID;

    -- Sprawdzamy, czy usunięcie się powiodło
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Gra o podanym ID nie istnieje.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Gra usunięta i ID gier zostały znormalizowane.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;

PROCEDURE UPDATEGAME (
    GameID INT,
    NewGameTitle VARCHAR,
    NewReleaseDate DATE,
    NewGamePrice NUMBER,
    NewGameAuthorId INT,
    NewGamePublisherId INT,
    NewIloscSprzedanychKopii NUMBER
) AS
BEGIN
    UPDATE gry
    SET Tytul = NewGameTitle,
        Data_Wydania = NewReleaseDate,
        CENA = NewGamePrice,
        ID_TWORCY = NewGameAuthorId,
        ID_WYDAWCY = NewGamePublisherId,
        ILOSC_SPRZEDANYCH_KOPI = NewIloscSprzedanychKopii
    WHERE ID = GameID;

    -- Sprawdzamy, czy operacja się powiodła
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nie znaleziono gry o podanym GameID.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Gra o ID ' || GameID || ' została zaktualizowana.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;


PROCEDURE UpdateGamePriceBasedOnMonthlySales (
    p_GameID INT,              -- ID gry
    p_MonthlySales INT         -- Liczba sprzedanych kopii w danym miesiącu
) AS
    v_NewPrice NUMBER;
BEGIN
    -- Jeśli sprzedaż przekroczy 5000, podnieś cenę o 15%
    IF p_MonthlySales > 5000 THEN
        SELECT CENA * 1.15
        INTO v_NewPrice
        FROM gry
        WHERE ID = p_GameID;

        UPDATE gry
        SET CENA = v_NewPrice
        WHERE ID = p_GameID;
        DBMS_OUTPUT.PUT_LINE('Cena gry ' || p_GameID || ' została podniesiona o 15%.');

    -- Jeśli sprzedaż wynosi między 1000 a 5000, cena pozostaje bez zmian
    ELSIF p_MonthlySales BETWEEN 1000 AND 5000 THEN
        DBMS_OUTPUT.PUT_LINE('Brak zmian w cenie gry ' || p_GameID || '.');

    -- Jeśli sprzedaż jest mniejsza niż 1000, obniż cenę o 10%
    ELSE
        SELECT CENA * 0.90
        INTO v_NewPrice
        FROM gry
        WHERE ID = p_GameID;

        UPDATE gry
        SET CENA = v_NewPrice
        WHERE ID = p_GameID;
        DBMS_OUTPUT.PUT_LINE('Cena gry ' || p_GameID || ' została obniżona o 10%.');
    END IF;

    COMMIT;
END;


FUNCTION GetGamesAndEarningsByAuthor(GameID INT) 
RETURN SYS_REFCURSOR IS
    v_GameAndEarnings SYS_REFCURSOR;  -- Kursor wynikowy
BEGIN
    -- Wybierz szczegóły jednej gry i oblicz zarobki
    OPEN v_GameAndEarnings FOR
        SELECT
            (g.Cena * g.ILOSC_SPRZEDANYCH_KOPI) * (1 - (w.MARZA_PROCENT / 100)) AS Zarobek
        FROM gry g
        JOIN wydawcy w ON g.ID_WYDawcy = w.ID
        WHERE g.ID = GameID;

    -- Zwróć kursor z wynikami
    RETURN v_GameAndEarnings;
END GetGamesAndEarningsByAuthor;

FUNCTION GetGamePublisherName(GameID INT)
RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;  -- Variable to hold the cursor
BEGIN
    -- Open a cursor to fetch the publisher's name based on GameID
    OPEN result_cursor FOR
    SELECT w.Nazwa
    FROM gry g
    JOIN wydawcy w ON g.ID_Wydawcy = w.ID
    WHERE g.ID = GameID;

    -- Return the cursor
    RETURN result_cursor;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If no data is found, return an empty cursor with NULL as the value
        OPEN result_cursor FOR
        SELECT NULL AS Nazwa FROM DUAL;
        RETURN result_cursor;
    WHEN OTHERS THEN
        -- Handle any other errors by returning an empty cursor
        OPEN result_cursor FOR
        SELECT NULL AS Nazwa FROM DUAL;
        RETURN result_cursor;
END GetGamePublisherName;


FUNCTION GetAllGames
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;  -- Kursor wyników
BEGIN
    -- Otwórz kursor z wynikami, dołączając nazwy twórcy i wydawcy
    OPEN v_cursor FOR
        SELECT g.ID, 
               g.Tytul, 
               g.Data_Wydania, 
               g.Cena,
               g.id_tworcy,
               g.id_wydawcy, 
               g.Ilosc_Sprzedanych_Kopi
        FROM gry g;

    -- Zwróć kursor z wynikami
    RETURN v_cursor;
END GetAllGames;

FUNCTION GetBestRatedGame RETURN SYS_REFCURSOR IS
    v_BestRatedGame SYS_REFCURSOR;   -- Kursor wyników
    v_MaxRating NUMBER;              -- Najlepsza średnia ocena
    v_BestGameID INT;                -- ID najlepszej gry
    v_BestGameTitle VARCHAR(255);     -- Tytuł najlepszej gry
BEGIN
    -- Find the maximum average rating across all games
    SELECT MAX(AVG(r.OCENA))
    INTO v_MaxRating
    FROM RECENZJE r
    GROUP BY r.ID_GRY;

    -- Now find the game that has this maximum average rating
    SELECT g.ID, g.Tytul
    INTO v_BestGameID, v_BestGameTitle
    FROM gry g
    WHERE g.ID = (
        SELECT r.ID_GRY
        FROM RECENZJE r
        WHERE r.ID_GRY = g.ID
        GROUP BY r.ID_GRY
        HAVING AVG(r.OCENA) = v_MaxRating
    )
    FETCH FIRST 1 ROWS ONLY;

    -- Open a cursor to return the result
    OPEN v_BestRatedGame FOR
        SELECT v_BestGameID AS GameID, v_BestGameTitle AS GameTitle, v_MaxRating AS MaxAverageRating
        FROM dual;

    -- Return the cursor
    RETURN v_BestRatedGame;
END GetBestRatedGame;


FUNCTION GetHighestEarningGame 
RETURN SYS_REFCURSOR IS
    v_HighestEarningGame SYS_REFCURSOR;   -- Kursor wyników
    v_MaxEarnings NUMBER;                 -- Najwyższe zarobki
    v_BestGameID INT;                     -- ID najlepiej zarabiającej gry
    v_BestGameTitle VARCHAR(255);          -- Tytuł najlepiej zarabiającej gry
BEGIN
    -- Wyszukiwanie gry z najwyższymi zarobkami
    SELECT g.ID, g.Tytul, (g.CENA * g.ILOSC_SPRZEDANYCH_KOPI) AS Earnings
    INTO v_BestGameID, v_BestGameTitle, v_MaxEarnings
    FROM gry g
    WHERE (g.CENA * g.ILOSC_SPRZEDANYCH_KOPI) = 
        (SELECT MAX(g.CENA * g.ILOSC_SPRZEDANYCH_KOPI) FROM gry g);

    -- Zwróć wynik w postaci kursora z informacjami o grze
    OPEN v_HighestEarningGame FOR
        SELECT v_BestGameID AS GameID, v_BestGameTitle AS GameTitle, v_MaxEarnings AS MaxEarnings
        FROM dual;

    -- Zwróć kursor z wynikami
    RETURN v_HighestEarningGame;
END GetHighestEarningGame;

FUNCTION GetGameReviews(GameID INT) RETURN SYS_REFCURSOR IS
    v_Reviews SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz wszystkie recenzje powiązane z daną grą
    OPEN v_Reviews FOR
        SELECT r.id,r.OCENA, r.TRESC,r.id_gry
        FROM recenzje r
        WHERE r.ID_GRY = GameID;

    -- Zwróć kursor z wynikami
    RETURN v_Reviews;
END GetGameReviews;

FUNCTION GetGameGenres(GameID INT) RETURN SYS_REFCURSOR IS
    v_Genres SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz wszystkie gatunki powiązane z daną grą z tabeli gry_gatunki
    OPEN v_Genres FOR
        SELECT g.id,g.Nazwa
        FROM gatunki g
        JOIN gry_gatunki gg ON g.ID = gg.ID_GATUNEK
        WHERE gg.ID_GRY = GameID;

    -- Zwróć kursor z wynikami
    RETURN v_Genres;
END GetGameGenres;

FUNCTION GetAverageGameRating (
    p_GameID INT
) RETURN SYS_REFCURSOR AS
    result_cursor SYS_REFCURSOR;  -- Cursor variable to hold the result
BEGIN
    -- Open a cursor to calculate and return the average rating
    OPEN result_cursor FOR
    SELECT AVG(OCENA) AS AvgRating
    FROM RECENZJE
    WHERE ID_GRY = p_GameID;

    -- Return the cursor
    RETURN result_cursor;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- In case no data is found, return an empty cursor with NULL
        OPEN result_cursor FOR
        SELECT NULL AS AvgRating FROM DUAL;
        RETURN result_cursor;
    WHEN OTHERS THEN
        -- Handle other exceptions by returning an empty cursor
        OPEN result_cursor FOR
        SELECT NULL AS AvgRating FROM DUAL;
        RETURN result_cursor;
END;

FUNCTION GetTotalRevenue(GameID INT) 
RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;  -- Cursor variable to hold the result
    v_Price NUMBER;               -- Price of the game
    v_Sales NUMBER;               -- Number of copies sold
    v_TotalRevenue NUMBER;        -- Total revenue
BEGIN
    -- Fetch the price of the game
    SELECT CENA
    INTO v_Price
    FROM gry
    WHERE ID = GameID;

    -- Fetch the number of sold copies
    SELECT ILOSC_SPRZEDANYCH_KOPI
    INTO v_Sales
    FROM gry
    WHERE ID = GameID;

    -- Calculate the total revenue (Price * Number of sold copies)
    v_TotalRevenue := v_Price * v_Sales;

    -- Open a cursor to return the total revenue
    OPEN result_cursor FOR
    SELECT v_TotalRevenue AS TotalRevenue FROM DUAL;

    -- Return the cursor
    RETURN result_cursor;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If no data found for the game ID, return a cursor with NULL
        OPEN result_cursor FOR
        SELECT NULL AS TotalRevenue FROM DUAL;
        RETURN result_cursor;
    WHEN OTHERS THEN
        -- Handle other errors by returning a cursor with NULL
        OPEN result_cursor FOR
        SELECT NULL AS TotalRevenue FROM DUAL;
        RETURN result_cursor;
END GetTotalRevenue;

FUNCTION GetGameCreatorName(GameID INT)
RETURN SYS_REFCURSOR IS
    v_creator_name VARCHAR2(255);  -- Zmienna przechowująca nazwę twórcy
    result_cursor SYS_REFCURSOR;   -- Zmienna typu cursor do zwrócenia
BEGIN
    -- Pobierz nazwę twórcy na podstawie ID gry
    OPEN result_cursor FOR
    SELECT t.Nazwa
    FROM gry g
    JOIN tworcy t ON g.ID_Tworcy = t.ID
    WHERE g.ID = GameID;

    -- Zwróć kursor z nazwą twórcy
    RETURN result_cursor;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Jeśli brak danych, zwróć pusty kursor
        OPEN result_cursor FOR
        SELECT NULL AS Nazwa FROM DUAL;
        RETURN result_cursor;
    WHEN OTHERS THEN
        -- Obsługa innych błędów
        OPEN result_cursor FOR
        SELECT NULL AS Nazwa FROM DUAL;
        RETURN result_cursor;
END GetGameCreatorName;


END gry_package;

/
--------------------------------------------------------
--  DDL for Package Body RECENZJE_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "C##student"."RECENZJE_PACKAGE" AS
PROCEDURE ADDREVIEW (
    ReviewRate NUMBER,        -- Ocena recenzji
    ReviewContent VARCHAR,    -- Treść recenzji
    ReviewGameId INT          -- ID gry, do której przypisana jest recenzja
) AS
    NewReviewID INT;          -- Zmienna do przechowywania nowego ID recenzji
BEGIN
    -- Pobranie nowego ID recenzji z sekwencji
    SELECT seq_recenzje_id.NEXTVAL
    INTO NewReviewID
    FROM dual;

    -- Dodanie nowego rekordu z wygenerowanym ID
    INSERT INTO RECENZJE(ID, OCENA, TRESC, ID_GRY)
    VALUES(NewReviewID, ReviewRate, ReviewContent, ReviewGameId);

    -- Opcjonalne wyświetlenie informacji
    DBMS_OUTPUT.PUT_LINE('Dodano nową recenzję o ID: ' || NewReviewID || ', Ocena: ' || ReviewRate || ', Gra ID: ' || ReviewGameId);
EXCEPTION
    -- Obsługa błędów
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;


PROCEDURE UPDATEREVIEW (
    ReviewID INT,              -- ID recenzji, którą chcemy zaktualizować
    NewReviewRate NUMBER,      -- Nowa ocena recenzji
    NewReviewContent VARCHAR,  -- Nowa treść recenzji
    NewReviewGameId INT        -- Nowe ID gry, do której przypisana jest recenzja
) AS
BEGIN
    -- Zaktualizowanie rekordu w tabeli RECENZJE na podstawie ReviewID
    UPDATE RECENZJE
    SET OCENA = NewReviewRate,
        TRESC = NewReviewContent,
        ID_GRY = NewReviewGameId
    WHERE ID = ReviewID;

    -- Sprawdzanie, czy zmiana się udała
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nie znaleziono recenzji o ID: ' || ReviewID);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Zmieniono dane recenzji o ID: ' || ReviewID || ' na ocenę: ' || NewReviewRate || ' i treść: ' || NewReviewContent);
    END IF;
EXCEPTION
    -- Obsługa błędów
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;


PROCEDURE REMOVEREVIEW (
    ReviewID INT
) AS
BEGIN
    -- Usuwamy recenzję na podstawie ReviewID
    DELETE FROM RECENZJE WHERE ID = ReviewID;

    -- Sprawdzamy, czy usunięcie się powiodło
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Recenzja o podanym ReviewID nie istnieje.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Recenzja o ID ' || ReviewID || ' została usunięta, a ID recenzji zostały znormalizowane.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;


FUNCTION GetAllReviews RETURN SYS_REFCURSOR IS
    v_Reviews SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz wszystkie recenzje z tabeli "recenzje"
    OPEN v_Reviews FOR
        SELECT r.id,r.OCENA AS ReviewRate, r.TRESC AS ReviewContent, r.ID_GRY AS GameID
        FROM recenzje r;

    -- Zwróć kursor z wynikami
    RETURN v_Reviews;
END GetAllReviews;



END recenzje_package;

/
--------------------------------------------------------
--  DDL for Package Body TWORCY_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "C##student"."TWORCY_PACKAGE" AS
PROCEDURE ADDAUTHOR (
    AuthorName VARCHAR -- Nazwa autora
) AS
    NewID INT; -- Zmienna do przechowania nowego ID
BEGIN
    -- Pobranie nowego ID autora z sekwencji
    SELECT seq_tworcow_id.NEXTVAL
    INTO NewID
    FROM dual;

    -- Dodanie nowego rekordu z wygenerowanym ID
    INSERT INTO TWORCY(ID, NAZWA)
    VALUES(NewID, AuthorName);

    -- Opcjonalne wyświetlenie informacji
    DBMS_OUTPUT.PUT_LINE('Dodano nowego autora o ID: ' || NewID || ', Nazwa: ' || AuthorName);
EXCEPTION
    -- Obsługa błędów
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;

PROCEDURE UPDATEAUTHOR (
    AuthorID INT,          -- ID autora, którego chcemy zmienić
    NewAuthorName VARCHAR  -- Nowa nazwa autora
) AS
BEGIN
    -- Zaktualizowanie rekordu w tabeli TWORCY na podstawie AuthorID
    UPDATE TWORCY
    SET NAZWA = NewAuthorName
    WHERE ID = AuthorID;

    -- Sprawdzanie, czy zmiana się udała
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nie znaleziono autora o ID: ' || AuthorID);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Zmieniono nazwisko autora o ID: ' || AuthorID || ' na: ' || NewAuthorName);
    END IF;
EXCEPTION
    -- Obsługa błędów
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;

PROCEDURE REMOVEAUTHOR (
    AuthorID INT
) AS
BEGIN
    -- Usuwamy autora na podstawie ID
    DELETE FROM TWORCY WHERE ID = AuthorID;

    -- Sprawdzamy, czy usunięcie się powiodło
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Autor o podanym ID nie istnieje.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Autor usunięty i ID zostały znormalizowane.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;


FUNCTION GetAllAuthors RETURN SYS_REFCURSOR IS
    v_Authors SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz wszystkich twórców z tabeli "tworcy"
    OPEN v_Authors FOR
        SELECT t.ID AS AuthorID, t.NAZWA AS AuthorName
        FROM tworcy t;

    -- Zwróć kursor z wynikami
    RETURN v_Authors;
END GetAllAuthors;

FUNCTION GetBestEarningAuthor RETURN SYS_REFCURSOR IS
    -- Kursor wynikowy
    v_Result SYS_REFCURSOR;

    -- Zmienna do przechowywania najlepiej zarabiającego autora
    v_BestEarningAuthorID INT;
    v_BestEarningAuthorName VARCHAR2(255);
    v_MaxTotalRevenue NUMBER := 0;
    v_TotalRevenue NUMBER;

BEGIN
    -- Najlepiej zarabiający autor, uwzględniając marżę
    FOR rec IN (
        SELECT t.ID AS AuthorID, t.Nazwa AS AuthorName, 
               SUM(g.CENA * g.ILOSC_SPRZEDANYCH_KOPI * (1 - p.MARZA_PROCENT / 100)) AS TotalRevenue
        FROM tworcy t
        JOIN gry g ON t.ID = g.ID_Tworcy
        JOIN wydawcy p ON g.id_wydawcy = p.ID
        GROUP BY t.ID, t.Nazwa
        ORDER BY TotalRevenue DESC
        FETCH FIRST 1 ROWS ONLY
    ) LOOP
        v_BestEarningAuthorID := rec.AuthorID;
        v_BestEarningAuthorName := rec.AuthorName;
        v_MaxTotalRevenue := rec.TotalRevenue;
    END LOOP;

    -- Otwórz kursor z wynikiem
    OPEN v_Result FOR
        SELECT v_BestEarningAuthorName AS BestEarningAuthor,
               v_MaxTotalRevenue AS BestTotalRevenue
        FROM dual;

    -- Zwróć kursor
    RETURN v_Result;
END GetBestEarningAuthor;

FUNCTION GetBestRatedAuthor RETURN SYS_REFCURSOR IS
    -- Kursor wynikowy
    v_Result SYS_REFCURSOR;

    -- Zmienna do przechowywania najlepiej ocenianego autora
    v_BestRatedAuthorID INT;
    v_BestRatedAuthorName VARCHAR2(255);
    v_BestAverageRating NUMBER := 0;

BEGIN
    -- Najlepiej oceniany autor
    FOR rec IN (
        SELECT t.ID AS AuthorID, t.Nazwa AS AuthorName, AVG(r.OCENA) AS AvgRating
        FROM tworcy t
        JOIN gry g ON t.ID = g.ID_Tworcy
        JOIN recenzje r ON g.ID = r.ID_GRY
        GROUP BY t.ID, t.Nazwa
        ORDER BY AvgRating DESC
        FETCH FIRST 1 ROWS ONLY
    ) LOOP
        v_BestRatedAuthorID := rec.AuthorID;
        v_BestRatedAuthorName := rec.AuthorName;
        v_BestAverageRating := rec.AvgRating;
    END LOOP;

    -- Otwórz kursor z wynikiem
    OPEN v_Result FOR
        SELECT v_BestRatedAuthorName AS BestRatedAuthor,
               v_BestAverageRating AS BestAverageRating
        FROM dual;

    -- Zwróć kursor
    RETURN v_Result;
END GetBestRatedAuthor;


FUNCTION GetAverageRatingByAuthor(AuthorID INT) 
RETURN SYS_REFCURSOR IS
    v_Result SYS_REFCURSOR;  -- Kursor wynikowy
    v_AvgRating NUMBER;  -- Zmienna do przechowania średniej oceny autora
BEGIN
    -- Oblicz średnią ocenę dla wszystkich gier twórcy
    OPEN v_Result FOR
        SELECT AVG(r.OCENA) AS AverageRating
        FROM RECENZJE r
        JOIN GRY g ON r.ID_GRY = g.ID
        WHERE g.ID_TWORCY = AuthorID;

    -- Zwróć kursor z wynikami
    RETURN v_Result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Zwróć pusty kursor, jeśli brak danych
        OPEN v_Result FOR SELECT 'No Data Found' AS AverageRating FROM dual;
        RETURN v_Result;
    WHEN OTHERS THEN
        -- Obsłuż inne błędy
        OPEN v_Result FOR SELECT 'Error' AS AverageRating FROM dual;
        RETURN v_Result;
END GetAverageRatingByAuthor;

FUNCTION GetGenresWithEarningsAndAvgRatingsByAuthor(AuthorID INT) 
RETURN SYS_REFCURSOR IS
    v_GenresWithData SYS_REFCURSOR;  -- Kursor wynikowy
BEGIN
    -- Otwórz kursor, który zwróci wszystkie gatunki oraz odpowiednie dane (łączne zarobki i średnie oceny)
    OPEN v_GenresWithData FOR
        SELECT
            g.Nazwa AS Gatunek,  -- Nazwa gatunku
            SUM((gr.Cena * gr.ILOSC_SPRZEDANYCH_KOPI) * (1 - (w.MARZA_PROCENT / 100))) AS Laczny_Zarobek,  -- Łączne zarobki
            AVG(r.OCENA) AS Srednia_Ocena  -- Średnia ocena gier w gatunku
        FROM gatunki g
        JOIN gry_gatunki gg ON g.ID = gg.ID_GATUNEK
        JOIN gry gr ON gg.ID_GRY = gr.ID
        JOIN recenzje r ON gr.ID = r.ID_GRY
        JOIN wydawcy w ON gr.ID_WYDawcy = w.ID
        WHERE gr.ID_TWORCY = AuthorID  -- Tylko gry autora
        GROUP BY g.Nazwa  -- Dodajemy g.Nazwa do GROUP BY
        ORDER BY Laczny_Zarobek DESC;  -- Posortowane według zarobków (opcjonalnie)

    -- Zwróć kursor z wynikami
    RETURN v_GenresWithData;
END GetGenresWithEarningsAndAvgRatingsByAuthor;

FUNCTION GetGamesByAuthor(AuthorID INT) RETURN SYS_REFCURSOR IS
    v_GamesByAuthor SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz wszystkie gry powiązane z danym twórcą
    OPEN v_GamesByAuthor FOR
        SELECT g.id,g.Tytul,g.data_wydania,g.cena,g.id_wydawcy,g.ilosc_sprzedanych_kopi
        FROM gry g
        WHERE g.ID_Tworcy = AuthorID;

    -- Zwróć kursor z wynikami
    RETURN v_GamesByAuthor;
END GetGamesByAuthor;

FUNCTION GetBestEarningGameByAuthor(AuthorID INT) RETURN SYS_REFCURSOR IS
    v_BestEarningGame SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz grę z najwyższymi zarobkami dla twórcy
    OPEN v_BestEarningGame FOR
        SELECT 
            gr.Tytul AS Gra,  
            (gr.Cena * gr.ILOSC_SPRZEDANYCH_KOPI) * (1 - (w.MARZA_PROCENT / 100)) AS Laczny_Zarobek
        FROM gry gr
        JOIN wydawcy w ON gr.ID_WYDawcy = w.ID
        WHERE gr.ID_TWORCY = AuthorID
        ORDER BY Laczny_Zarobek DESC
        FETCH FIRST 1 ROWS ONLY;  -- Pobierz tylko najlepszą grę

    -- Zwróć kursor z wynikami
    RETURN v_BestEarningGame;
END GetBestEarningGameByAuthor;

FUNCTION GetBestRatedGameForAuthor(AuthorID INT) 
RETURN SYS_REFCURSOR IS
    v_BestRatedGame SYS_REFCURSOR;    -- Kursor do przechowywania najlepiej ocenianej gry
    v_HighestRating NUMBER(3,1);      -- Zmienna do przechowywania najwyższej oceny
BEGIN
    -- Wyszukaj najlepiej ocenianą grę danego autora
    OPEN v_BestRatedGame FOR
    SELECT g.Tytul AS GameTitle, 
           (SELECT AVG(r.OCENA) FROM RECENZJE r WHERE r.ID_GRY = g.ID) AS AverageRating
    FROM gry g
    WHERE g.ID_Tworcy = AuthorID
    ORDER BY AverageRating DESC
    FETCH FIRST 1 ROWS ONLY;  -- Zwróć tylko najlepszą ocenę

    -- Zwróć kursor z wynikiem
    RETURN v_BestRatedGame;
END;

FUNCTION GetBestEarningGenreByAuthor(AuthorID INT) RETURN SYS_REFCURSOR IS
    v_BestEarningGenre SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz gatunek z najwyższymi zarobkami dla twórcy
    OPEN v_BestEarningGenre FOR
        SELECT 
            g.Nazwa AS Gatunek,  
            SUM((gr.Cena * gr.ILOSC_SPRZEDANYCH_KOPI) * (1 - (w.MARZA_PROCENT / 100))) AS Laczny_Zarobek
        FROM gatunki g
        JOIN gry_gatunki gg ON g.ID = gg.ID_GATUNEK
        JOIN gry gr ON gg.ID_GRY = gr.ID
        JOIN wydawcy w ON gr.ID_WYDawcy = w.ID
        WHERE gr.ID_TWORCY = AuthorID
        GROUP BY g.Nazwa
        ORDER BY Laczny_Zarobek DESC
        FETCH FIRST 1 ROWS ONLY;  -- Pobierz tylko najlepszy gatunek

    -- Zwróć kursor z wynikami
    RETURN v_BestEarningGenre;
END GetBestEarningGenreByAuthor;


END tworcy_package;

/
--------------------------------------------------------
--  DDL for Package Body WYDAWCY_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "C##student"."WYDAWCY_PACKAGE" AS
PROCEDURE ADDPUBLISHER (
    publisherName VARCHAR,  -- Nazwa wydawcy
    publisherMargin INT    -- Marża procentowa wydawcy
) AS
    NewPublisherID INT;  -- Zmienna do przechowywania nowego ID wydawcy
BEGIN
    -- Pobranie nowego ID wydawcy z sekwencji
    SELECT seq_wydawcy_id.NEXTVAL
    INTO NewPublisherID
    FROM dual;

    -- Dodanie nowego rekordu z wygenerowanym ID
    INSERT INTO wydawcy(ID, nazwa, marza_procent)
    VALUES(NewPublisherID, publisherName, publisherMargin);

    -- Opcjonalne wyświetlenie informacji
    DBMS_OUTPUT.PUT_LINE('Dodano nowego wydawcę o ID: ' || NewPublisherID || ', Nazwa: ' || publisherName);
EXCEPTION
    -- Obsługa błędów
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;

PROCEDURE REMOVEPUBLISHER (
    PublisherID INT
) AS
BEGIN
    -- Usuwamy wydawcę na podstawie PublisherID
    DELETE FROM wydawcy WHERE ID = PublisherID;

    -- Sprawdzamy, czy usunięcie się powiodło
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Wydawca o podanym PublisherID nie istnieje.');
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Wydawca o ID ' || PublisherID || ' został usunięty, a ID wydawców zostały znormalizowane.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;

PROCEDURE UPDATEPUBLISHER (
    PublisherID INT,               -- ID wydawcy, którego chcemy zaktualizować
    NewPublisherName VARCHAR,      -- Nowa nazwa wydawcy
    NewPublisherMargin INT         -- Nowa marża procentowa wydawcy
) AS
BEGIN
    -- Zaktualizowanie rekordu w tabeli wydawcy na podstawie PublisherID
    UPDATE wydawcy
    SET Nazwa = NewPublisherName,
        Marza_Procent = NewPublisherMargin
    WHERE ID = PublisherID;

    -- Sprawdzanie, czy zmiana się udała
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nie znaleziono wydawcy o ID: ' || PublisherID);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Zmieniono dane wydawcy o ID: ' || PublisherID || ' na: ' || NewPublisherName);
    END IF;
EXCEPTION
    -- Obsługa błędów
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' || SQLERRM);
END;


FUNCTION GetAllGamesByPublisher(PublisherID INT) 
RETURN SYS_REFCURSOR IS
    v_Games SYS_REFCURSOR;  -- Kursor wynikowy
BEGIN
    -- Otwórz kursor, który zwraca wszystkie gry wydane przez danego wydawcę
    OPEN v_Games FOR
        SELECT 
            g.ID AS GameID,
            g.Tytul AS GameTitle,
            g.Data_Wydania AS ReleaseDate,
            g.Cena AS Price,
            g.ID_Tworcy AS CreatorID,
            g.ID_WYDawcy AS PublisherID,
            g.ILOSC_SPRZEDANYCH_KOPI AS SoldCopies
        FROM Gry g
        WHERE g.ID_WYDawcy = PublisherID;

    -- Zwróć kursor
    RETURN v_Games;
END GetAllGamesByPublisher;


FUNCTION GetAllPublishers RETURN SYS_REFCURSOR IS
    v_Publishers SYS_REFCURSOR;   -- Kursor wyników
BEGIN
    -- Wybierz wszystkich wydawców z tabeli "wydawcy"
    OPEN v_Publishers FOR
        SELECT w.ID AS PublisherID, w.NAZWA AS PublisherName,w.marza_procent
        FROM wydawcy w;

    -- Zwróć kursor z wynikami
    RETURN v_Publishers;
END GetAllPublishers;

FUNCTION GetAverageRatingByPublisher(PublisherID INT) 
RETURN SYS_REFCURSOR IS
    v_Result SYS_REFCURSOR;  -- Kursor wynikowy
BEGIN
    -- Otwórz kursor, który oblicza średnią ocenę gier wydawcy
    OPEN v_Result FOR
        SELECT AVG(r.OCENA) AS AvgRating
        FROM RECENZJE r
        JOIN GRY g ON r.ID_GRY = g.ID
        WHERE g.ID_WYDawcy = PublisherID;

    -- Zwróć kursor
    RETURN v_Result;
END GetAverageRatingByPublisher;


FUNCTION GetBestEarningPublisher RETURN SYS_REFCURSOR IS
    v_Result SYS_REFCURSOR;  -- Kursor wynikowy
    v_BestPublisherName VARCHAR2(255);  -- Zmienna na nazwę najlepiej zarabiającego wydawcy
    v_MaxRevenue NUMBER := 0;  -- Zmienna do przechowywania maksymalnych zarobków
BEGIN
    -- Wybór najlepiej zarabiającego wydawcy
    FOR rec IN (
        SELECT 
            w.Nazwa AS PublisherName,  -- Nazwa wydawcy
            SUM((g.CENA * g.ILOSC_SPRZEDANYCH_KOPI) * (100 / w.MARZA_PROCENT)) AS TotalRevenue  -- Obliczanie zarobku
        FROM gry g
        JOIN wydawcy w ON g.ID_WYDawcy = w.ID
        GROUP BY w.Nazwa
        ORDER BY TotalRevenue DESC  -- Posortowane według zarobków
        FETCH FIRST 1 ROWS ONLY  -- Pobieramy tylko najlepszego wydawcę
    ) LOOP
        v_BestPublisherName := rec.PublisherName;
        v_MaxRevenue := rec.TotalRevenue;
    END LOOP;

    -- Otwórz kursor z wynikiem
    OPEN v_Result FOR
        SELECT v_BestPublisherName AS BestPublisher,
               v_MaxRevenue AS BestPublisherRevenue
        FROM dual;

    -- Zwróć kursor
    RETURN v_Result;
END GetBestEarningPublisher;


FUNCTION GetBestRatedGameForPublisher(PublisherID INT) RETURN SYS_REFCURSOR IS
    v_BestRatedGame SYS_REFCURSOR;  -- Kursor wyników
BEGIN
    -- Otwórz kursor, aby zwrócić grę wydawcy z najwyższą średnią oceną
    OPEN v_BestRatedGame FOR
        SELECT gr.Tytul AS GameTitle,
               AVG(r.OCENA) AS AverageRating
        FROM gry gr
        LEFT JOIN recenzje r ON gr.ID = r.ID_GRY
        WHERE gr.ID_Wydawcy = PublisherID
        GROUP BY gr.Tytul
        ORDER BY AverageRating DESC
        FETCH FIRST 1 ROWS ONLY;  -- Zwróci tylko jedną najlepiej ocenianą grę

    -- Zwróć kursor z wynikami
    RETURN v_BestRatedGame;
END;

FUNCTION GetBestRatedGenreForPublisher(PublisherID INT) RETURN SYS_REFCURSOR IS
    v_BestRatedGenre SYS_REFCURSOR;  -- Kursor wyników
BEGIN
    -- Otwórz kursor, aby zwrócić gatunek wydawcy z najwyższą średnią oceną
    OPEN v_BestRatedGenre FOR
        SELECT g.Nazwa AS GenreName,
               AVG(r.OCENA) AS AverageRating
        FROM gatunki g
        JOIN gry_gatunki gg ON g.ID = gg.id_gatunek
        JOIN gry gr ON gg.id_gry = gr.ID
        LEFT JOIN recenzje r ON gr.ID = r.ID_GRY
        WHERE gr.ID_Wydawcy = PublisherID
        GROUP BY g.Nazwa
        ORDER BY AverageRating DESC
        FETCH FIRST 1 ROWS ONLY;  -- Zwróci tylko jeden najlepiej oceniany gatunek

    -- Zwróć kursor z wynikami
    RETURN v_BestRatedGenre;
END;

FUNCTION GetBestRatedPublisher RETURN SYS_REFCURSOR IS
    v_Result SYS_REFCURSOR;  -- Kursor wynikowy
    v_BestPublisherName VARCHAR2(255);  -- Zmienna na nazwę najlepiej ocenianego wydawcy
    v_MaxAvgRating NUMBER := 0;  -- Zmienna do przechowywania maksymalnej średniej oceny
BEGIN
    -- Wybór najlepiej ocenianego wydawcy
    FOR rec IN (
        SELECT 
            w.Nazwa AS PublisherName,  -- Nazwa wydawcy
            AVG(r.OCENA) AS AvgRating  -- Średnia ocena gier wydawcy
        FROM gry g
        JOIN wydawcy w ON g.ID_WYDawcy = w.ID
        JOIN recenzje r ON g.ID = r.ID_GRY
        GROUP BY w.Nazwa
        HAVING AVG(r.OCENA) IS NOT NULL
        ORDER BY AvgRating DESC  -- Posortowane według średniej oceny
        FETCH FIRST 1 ROWS ONLY  -- Pobieramy tylko najlepszego wydawcę
    ) LOOP
        v_BestPublisherName := rec.PublisherName;
        v_MaxAvgRating := rec.AvgRating;
    END LOOP;

    -- Otwórz kursor z wynikiem
    OPEN v_Result FOR
        SELECT v_BestPublisherName AS BestPublisher,
               v_MaxAvgRating AS BestPublisherAvgRating
        FROM dual;

    -- Zwróć kursor
    RETURN v_Result;
END GetBestRatedPublisher;


FUNCTION GetBestSellingGameForPublisher(PublisherID INT) RETURN SYS_REFCURSOR IS
    v_BestSellingGame SYS_REFCURSOR;  -- Kursor wyników
BEGIN
    -- Otwórz kursor i zwróć grę o najwyższym zysku
    OPEN v_BestSellingGame FOR
        SELECT gr.Tytul AS GameTitle,
               (gr.Cena * gr.ILOSC_SPRZEDANYCH_KOPI * (w.marza_procent / 100)) AS Revenue
        FROM gry gr
        JOIN wydawcy w ON gr.ID_Wydawcy = w.ID
        WHERE gr.ID_Wydawcy = PublisherID
        ORDER BY Revenue DESC
        FETCH FIRST 1 ROWS ONLY;

    -- Zwróć kursor z wynikami
    RETURN v_BestSellingGame;
END;

FUNCTION GetBestSellingGenreForPublisher(PublisherID INT) RETURN SYS_REFCURSOR IS
    v_BestSellingGenre SYS_REFCURSOR;  -- Kursor wyników
BEGIN
    -- Otwórz kursor i zwróć gatunek o najwyższym zysku
    OPEN v_BestSellingGenre FOR
        SELECT g.Nazwa AS GenreName,
               SUM(gr.Cena * gr.ILOSC_SPRZEDANYCH_KOPI * (w.marza_procent / 100)) AS Revenue
        FROM gatunki g
        JOIN gry_gatunki gg ON g.ID = gg.id_gatunek
        JOIN gry gr ON gg.id_gry = gr.ID
        JOIN wydawcy w ON gr.ID_Wydawcy = w.ID
        WHERE gr.ID_Wydawcy = PublisherID
        GROUP BY g.Nazwa
        ORDER BY Revenue DESC
        FETCH FIRST 1 ROWS ONLY;

    -- Zwróć kursor z wynikami
    RETURN v_BestSellingGenre;
END;

FUNCTION GetGameCreatorName(GameID INT)
RETURN SYS_REFCURSOR IS
    v_creator_name VARCHAR2(255);  -- Zmienna przechowująca nazwę twórcy
    result_cursor SYS_REFCURSOR;   -- Zmienna typu cursor do zwrócenia
BEGIN
    -- Pobierz nazwę twórcy na podstawie ID gry
    OPEN result_cursor FOR
    SELECT t.Nazwa
    FROM gry g
    JOIN tworcy t ON g.ID_Tworcy = t.ID
    WHERE g.ID = GameID;

    -- Zwróć kursor z nazwą twórcy
    RETURN result_cursor;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Jeśli brak danych, zwróć pusty kursor
        OPEN result_cursor FOR
        SELECT NULL AS Nazwa FROM DUAL;
        RETURN result_cursor;
    WHEN OTHERS THEN
        -- Obsługa innych błędów
        OPEN result_cursor FOR
        SELECT NULL AS Nazwa FROM DUAL;
        RETURN result_cursor;
END GetGameCreatorName;

FUNCTION GetGenresWithRatingsAndEarningsByPublisher(PublisherID INT) 
RETURN SYS_REFCURSOR IS
    v_GenresAndEarnings SYS_REFCURSOR; -- Kursor wynikowy
BEGIN
    -- Otwórz kursor, który oblicza sumę średnich ocen i sumę zarobków dla gatunków gier wydanych przez danego wydawcę
    OPEN v_GenresAndEarnings FOR
        SELECT 
            g.ID AS GenreID,
            g.Nazwa AS GenreName,
            AVG(r.OCENA) AS AvgRating,  -- Średnia ocena gier w danym gatunku
            SUM((gr.CENA * gr.ILOSC_SPRZEDANYCH_KOPI) * (1 - (w.MARZA_PROCENT / 100))) AS TotalEarnings  -- Suma zarobków
        FROM gatunki g
        JOIN Gry_Gatunki gg ON g.ID = gg.ID_GATUNEK
        JOIN Gry gr ON gg.ID_GRY = gr.ID
        JOIN Wydawcy w ON gr.ID_WYDawcy = w.ID
        LEFT JOIN RECENZJE r ON gr.ID = r.ID_GRY
        WHERE gr.ID_WYDawcy = PublisherID
        GROUP BY g.ID, g.Nazwa
        ORDER BY g.ID; -- Możesz zmienić porządek, jeśli potrzeba

    -- Zwróć kursor
    RETURN v_GenresAndEarnings;
END GetGenresWithRatingsAndEarningsByPublisher;
END wydawcy_package;

/
--------------------------------------------------------
--  Constraints for Table WYDAWCY
--------------------------------------------------------

  ALTER TABLE "C##student"."WYDAWCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##student"."WYDAWCY" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "C##student"."WYDAWCY" MODIFY ("MARZA_PROCENT" NOT NULL ENABLE);
  ALTER TABLE "C##student"."WYDAWCY" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TWORCY
--------------------------------------------------------

  ALTER TABLE "C##student"."TWORCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##student"."TWORCY" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "C##student"."TWORCY" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECENZJE
--------------------------------------------------------

  ALTER TABLE "C##student"."RECENZJE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##student"."RECENZJE" MODIFY ("OCENA" NOT NULL ENABLE);
  ALTER TABLE "C##student"."RECENZJE" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##student"."RECENZJE" MODIFY ("ID_GRY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GRY_GATUNKI
--------------------------------------------------------

  ALTER TABLE "C##student"."GRY_GATUNKI" MODIFY ("ID_GRY" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GRY_GATUNKI" MODIFY ("ID_GATUNEK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GATUNKI
--------------------------------------------------------

  ALTER TABLE "C##student"."GATUNKI" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GATUNKI" MODIFY ("NAZWA" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GATUNKI" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table GRY
--------------------------------------------------------

  ALTER TABLE "C##student"."GRY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GRY" MODIFY ("TYTUL" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GRY" MODIFY ("DATA_WYDANIA" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GRY" MODIFY ("CENA" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GRY" MODIFY ("ID_TWORCY" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GRY" MODIFY ("ID_WYDAWCY" NOT NULL ENABLE);
  ALTER TABLE "C##student"."GRY" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GRY
--------------------------------------------------------

  ALTER TABLE "C##student"."GRY" ADD FOREIGN KEY ("ID_TWORCY")
	  REFERENCES "C##student"."TWORCY" ("ID") ENABLE;
  ALTER TABLE "C##student"."GRY" ADD FOREIGN KEY ("ID_WYDAWCY")
	  REFERENCES "C##student"."WYDAWCY" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GRY_GATUNKI
--------------------------------------------------------

  ALTER TABLE "C##student"."GRY_GATUNKI" ADD FOREIGN KEY ("ID_GRY")
	  REFERENCES "C##student"."GRY" ("ID") ENABLE;
  ALTER TABLE "C##student"."GRY_GATUNKI" ADD FOREIGN KEY ("ID_GATUNEK")
	  REFERENCES "C##student"."GATUNKI" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECENZJE
--------------------------------------------------------

  ALTER TABLE "C##student"."RECENZJE" ADD FOREIGN KEY ("ID_GRY")
	  REFERENCES "C##student"."GRY" ("ID") ENABLE;
