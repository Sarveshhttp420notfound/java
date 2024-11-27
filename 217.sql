CREATE TABLE "S_VENDOR"  (	

"VENDOR_ID" NUMBER NOT NULL ENABLE,

 	"VENDOR_NAME" VARCHAR2(200), 

	"VENDOR_PHONE1" VARCHAR2(25), 

	"VENDOR_PHONE2" VARCHAR2(25), 	

"VENDOR_MAIL" VARCHAR2(150), 

	"VENDOR_ADDRESS" VARCHAR2(200), 

	"VENDOR_BALANCE" NUMBER, 	

VENDOR_REMARKS" VARCHAR2(500), 	

 CONSTRAINT "S_VENDOR_PK" PRIMARY KEY ("VENDOR_ID") ENABLE  ) 

/ 

CREATE OR REPLACE TRIGGER "BI_S_VENDOR" 

 before insert on "S_VENDOR"      

   for each row 

 begin  

 if :NEW."VENDOR_ID" is null then   

select "S_VENDOR_SEQ".nextval into :NEW."VENDOR_ID" from sys.dual; 

 end if;

 end; 

 / 

ALTER TRIGGER "BI_S_VENDOR" ENABLE

 / 