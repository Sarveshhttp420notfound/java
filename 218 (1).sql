CREATE TABLE "S_CLIENT" 

 (	"CLIENT_ID" NUMBER NOT NULL ENABLE, 

	"CLIENT_NAME" VARCHAR2(200), 

	"CLIENT_PHONE1" VARCHAR2(25), 

	"CLIENT_PHONE2" VARCHAR2(25), 

	"CLIENT_MAIL" VARCHAR2(150), 

	"CLIENT_ADDRESS" VARCHAR2(200), 

	"CLIENT_BALANCE" NUMBER, 

	"CLIENT_REMARKS" VARCHAR2(500), 

	 CONSTRAINT "S_CLIENT_PK" PRIMARY KEY ("CLIENT_ID") ENABLE

 )

/

CREATE OR REPLACE TRIGGER "BI_S_CLIENT" 

 before insert on "S_CLIENT"       

 for each row 

begin 

 if :NEW."CLIENT_ID" is null then 

  select "S_CLIENT_SEQ".nextval into :NEW."CLIENT_ID" from sys.dual; 

 end if; 

end; 

/

ALTER TRIGGER "BI_S_CLIENT" ENABLE

/

