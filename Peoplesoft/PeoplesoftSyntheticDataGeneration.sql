begin
    dbms_cloud.drop_credential('SELECT_AI_CRED') ;
end ;
/

begin
dbms_cloud.create_credential (
                        credential_name => 'SELECT_AI_CRED',
                        user_ocid       => 'ocid1.user.oc1..aaaaaaaajz34bwifxsu6u455kya5gy2pzzaimtjy2wdmqzahcbk7prr67e3q',
                        tenancy_ocid    => 'ocid1.tenancy.oc1..aaaaaaaaiyavtwbz4kyu7g7b6wglllccbflmjx2lzk5nwpbme44mv54xu7dq',
                        private_key     => '-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDjVhfndvKaXyCx
npZJgGTbx+5IsdK996LqlIm2YsAZ+1ukzJCRsyjIesVjdax63rhoOpf5W9grDaVa
zAmuUGYLsNQIHSo9Wtr4cbLB6W5c3mbAXpXIbLX3q2/DxfC5NWl8BXRq+Tm3f8NX
FwX48r1wNmTVokH5xl0pwcRE+vwYQ7thbfcYcaAIdOMDofpo2YGYmpPy6wbxSzmS
g9xUDu0MTdiHBIytlqy6+lUv1D23YfrAMQL0j0tId7Krk3lvWseXiEE9nGSyS4nk
YlmXGpgV5MS5lp9n25oNEQYM9CRKYqs8QDjdUqmGQKTe7CRY6NQcBiu7iZKeLXZL
vRnlOu0hAgMBAAECggEAFc0y26rHl1BaJU6NIR1kDsO8sVIEYN13zUFTd58+xv8Z
CdPoZWCmH5vOhDxLvzjOvIgp/Or27yIO4odAwmvJbYOWwfRyEZI9/6d/uiL1x4g4
mGg5uw/Z35ecT00TSd+6bv9i68Nc6qEhDaASnY5B5poAz5AQ/bAtTQzdErRzKqxd
6sAGhQQPRyj73ZCSCbpL8hh1wBHK2+pJli9YT9EierX7++AWTHShCpACSudSkFTJ
kyyLD+YIpdbLrR3p7tf32yGZrDZ+MxqQPZrE57+aVqpaTx/VQPZxMTCNAUgyo1fH
2TkHtmETs4AHq97iv+uT1jZr6knURkPUIpYLbRdHBQKBgQD2kXpK3t9qoSV/USig
q48LK4vLqQXAZC76TusycMpnVjWQwkhz6d7UbIPBtHF9UbhO8vubP4W7WBGjxw2d
BGviS86d5ehOcH4p2EDSajammymb+uDvFiI+umL0Swp3iHCrsYwmt0xFtSwMZh1Q
aCJXXkJ8WNCOhjK/ca10KZ67QwKBgQDsCElSKjt6edUcebd7ncAw6+FfYefDXZxo
9EtLI4ZAZFO4erjUwsjE6QnoxzQYMD+7MyffXAjEHy56l2S0BYPIdBzUBlroczg9
3dGCgsX2B8xZXAKyhu6rIbsODsQARtYhOhmT0n4OlQMIfRpRz1yijIy7iRpCxrcK
0vdpUmllywKBgCBNiuIINOj5V7pIXbQ/BayG9femmzRLa8QrVrDzCfFj3/ypF2jo
OONHnDNieoPakvT07HW4asLSlO0KBQSPMbsiB120Yyzzm/PLeyKV+7b0GQ1wXsuz
8KSbMp+ivSpP28MCrcPcu8deJvkw36JLIkSj+r3jvN8PQdLHB9xyH3OVAoGAQLy5
F38b1yjJSckciRwoVYKsytN4lL39I1A1woMY1FpwF/4Y6coO9OsR27WfVS8Om9KZ
EgsVIG2I+vjBFxsYHQezzHd9wZmwiE9pokkp8KQM6UlyN/MITQmwW1ezbHwBSRW9
ZCzshCVcspxVdrDQMIkqJFmjSUNleuOIFmwTGmcCgYEAnf4TxjyRuZOBN/2JlJWt
XT1fnFggaAbqDDEOAcy75yL+6sWG45baJPF6p40IhGKtpgiZ68xSYNbEhkcw2xSe
w1YC/SUtV8FTV4qkPWbf1SNWHfoaRvYE04NJhARC1+97iDm7d7EgC6kQF/182XdA
4o7dKHNxbvpvigbamOOKv04=
-----END PRIVATE KEY-----',
    fingerprint     => 'd7:e3:95:7b:04:d0:21:48:a6:a5:47:56:83:7a:e9:62');
end;
/

select * from ALL_CREDENTIALS;

BEGIN
  DBMS_CLOUD_AI.DROP_PROFILE(profile_name => 'META_LLAMA_33_70B',force => TRUE);
  EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE NOT IN (-20000, -4043) THEN
      RAISE;
    END IF;

  DBMS_CLOUD_AI.CREATE_PROFILE(
      profile_name => 'META_LLAMA_33_70B' ,
      attributes   =>
      '{
        "provider": "oci",
        "region": "us-chicago-1",
        "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaalhanz53ftgls7v6oq53tf6gtliqyxf2abkvztukbx5junvszw6ja",
        "credential_name": "SELECT_AI_CRED",
        "comments":"true",
        "object_list": [
          {"owner": "PSFTCLN", "name": "PS_CLM_HDR"},
          {"owner": "PSFTCLN", "name": "PS_CLM_LINE"},
          {"owner": "PSFTCLN", "name": "PS_CLM_STATUS_HIST"},
          {"owner": "PSFTCLN", "name": "PS_MEMBER"},
          {"owner": "PSFTCLN", "name": "PS_PAYER"},
          {"owner": "PSFTCLN", "name": "PS_PROVIDER"}
        ],
        "model": "meta.llama-3.3-70b-instruct"
      }');
END;
/

BEGIN
  BEGIN
    DBMS_CLOUD_AI.DROP_PROFILE(
      profile_name => 'META_LLAMA_33_70B',
      force        => TRUE
    );
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE NOT IN (-20000, -4043) THEN
        RAISE;
      END IF;
  END;
  DBMS_CLOUD_AI.CREATE_PROFILE(
      profile_name => 'META_LLAMA_33_70B' ,
      attributes   =>
      '{
        "provider": "oci",
        "region": "us-chicago-1",
        "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaalhanz53ftgls7v6oq53tf6gtliqyxf2abkvztukbx5junvszw6ja",
        "credential_name": "SELECT_AI_CRED",
        "comments":"true",
        "object_list": [
          {"owner": "PSFTCLN", "name": "PS_CLM_HDR"},
          {"owner": "PSFTCLN", "name": "PS_CLM_LINE"},
          {"owner": "PSFTCLN", "name": "PS_CLM_STATUS_HIST"},
          {"owner": "PSFTCLN", "name": "PS_MEMBER"},
          {"owner": "PSFTCLN", "name": "PS_PAYER"},
          {"owner": "PSFTCLN", "name": "PS_PROVIDER"}
        ],
        "model": "meta.llama-3.3-70b-instruct"
      }');
END;
/

BEGIN
  BEGIN
    DBMS_CLOUD_AI.DROP_PROFILE(
      profile_name => 'XAI_GROK_3',
      force        => TRUE
    );
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE NOT IN (-20000, -4043) THEN
        RAISE;
      END IF;
  END;

  DBMS_CLOUD_AI.CREATE_PROFILE(
    profile_name => 'XAI_GROK_3',
    attributes   => '{
      "provider": "oci",
      "region": "us-chicago-1",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaalhanz53ftgls7v6oq53tf6gtliqyxf2abkvztukbx5junvszw6ja",
      "credential_name": "SELECT_AI_CRED",
      "comments": "true",
      "object_list": [
        {"owner": "PSFTCLN", "name": "PS_CLM_HDR"},
        {"owner": "PSFTCLN", "name": "PS_CLM_LINE"},
        {"owner": "PSFTCLN", "name": "PS_CLM_STATUS_HIST"},
        {"owner": "PSFTCLN", "name": "PS_MEMBER"},
        {"owner": "PSFTCLN", "name": "PS_PAYER"},
        {"owner": "PSFTCLN", "name": "PS_PROVIDER"}
      ],
      "model": "xai.grok-3"
    }'
  );
END;
/

BEGIN
  BEGIN
    DBMS_CLOUD_AI.DROP_PROFILE(
      profile_name => 'GOOG_GEMINI_25_PRO',
      force        => TRUE
    );
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE NOT IN (-20000, -4043) THEN
        RAISE;
      END IF;
  END;

  DBMS_CLOUD_AI.CREATE_PROFILE(
    profile_name => 'GOOG_GEMINI_25_PRO',
    attributes   => '{
      "provider": "oci",
      "region": "us-chicago-1",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaalhanz53ftgls7v6oq53tf6gtliqyxf2abkvztukbx5junvszw6ja",
      "credential_name": "SELECT_AI_CRED",
      "comments": "true",
      "object_list": [
        {"owner": "PSFTCLN", "name": "PS_CLM_HDR"},
        {"owner": "PSFTCLN", "name": "PS_CLM_LINE"},
        {"owner": "PSFTCLN", "name": "PS_CLM_STATUS_HIST"},
        {"owner": "PSFTCLN", "name": "PS_MEMBER"},
        {"owner": "PSFTCLN", "name": "PS_PAYER"},
        {"owner": "PSFTCLN", "name": "PS_PROVIDER"}
      ],
      "model": "google.gemini-2.5-pro"
    }'
  );
END;
/

BEGIN
  BEGIN
    DBMS_CLOUD_AI.DROP_PROFILE(
      profile_name => 'OPENAI_OSS_120B',
      force        => TRUE
    );
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE NOT IN (-20000, -4043) THEN
        RAISE;
      END IF;
  END;

  DBMS_CLOUD_AI.CREATE_PROFILE(
    profile_name => 'OPENAI_OSS_120B',
    attributes   => '{
      "provider": "oci",
      "region": "us-chicago-1",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaalhanz53ftgls7v6oq53tf6gtliqyxf2abkvztukbx5junvszw6ja",
      "credential_name": "SELECT_AI_CRED",
      "comments": "true",
      "object_list": [
        {"owner": "PSFTCLN", "name": "PS_CLM_HDR"},
        {"owner": "PSFTCLN", "name": "PS_CLM_LINE"},
        {"owner": "PSFTCLN", "name": "PS_CLM_STATUS_HIST"},
        {"owner": "PSFTCLN", "name": "PS_MEMBER"},
        {"owner": "PSFTCLN", "name": "PS_PAYER"},
        {"owner": "PSFTCLN", "name": "PS_PROVIDER"}
      ],
      "model": "openai.gpt-oss-120b"
    }'
  );
END;
/

select * from USER_CLOUD_AI_PROFILES;

BEGIN
    DBMS_CLOUD_AI.SET_PROFILE(profile_name => 'XAI_GROK_3');
    --DBMS_CLOUD_AI.SET_PROFILE(profile_name => 'GENAI');
    --DBMS_CLOUD_AI.SET_PROFILE(profile_name => 'META_LLAMA_33_70B');
    --DBMS_CLOUD_AI.SET_PROFILE(profile_name => 'GOOG_GEMINI_25_PRO');
    --DBMS_CLOUD_AI.SET_PROFILE(profile_name => 'OPENAI_OSS_120B');
END;
/

-- Create a profile
BEGIN                                                                      
  DBMS_CLOUD_AI.CREATE_PROFILE(                                            
      profile_name =>'GENAI',                                                           
      attributes  =>'{"provider": "oci",                                                                 
        "credential_name": "SELECT_AI_CRED",                                   
        "object_list": [{"owner": "PSFTCLN", 
		"oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaalhanz53ftgls7v6oq53tf6gtliqyxf2abkvztukbx5junvszw6ja"}]          
       }');                                                                
END;                                                                       
/

SELECT profile_name, status
FROM USER_CLOUD_AI_PROFILES
WHERE profile_name = 'XAI_GROK_3';
SELECT DBMS_CLOUD_AI.GET_PROFILE() FROM dual;

BEGIN
  DBMS_CLOUD_AI.SET_PROFILE('XAI_GROK_3');
END;
/

SELECT DBMS_CLOUD_AI.GENERATE(
         prompt  => 'show 5 rows from PSFTCLN.PS_CLM_HDR',
         profile_name => 'XAI_GROK_3',
         action => 'chat'
       )
FROM dual;

SELECT profile_name FROM USER_CLOUD_AI_PROFILES WHERE profile_name = 'XAI_GROK_3';
BEGIN
  DBMS_CLOUD_AI.SET_PROFILE('XAI_GROK_3');
END;
/
select ai showsql 'show all columns from PSFTCLN.PS_CLM_HDR fetch first 5 rows only';
--SELECT AI 'list tables';
--SELECT AI 'show all columns from PSFTCLN.PS_CLM_HDR fetch first 5 rows only';
select ai narrate How many records are there in PS_CLM_HDR table;


SELECT DBMS_CLOUD_AI.GET_PROFILE() AS active_profile
FROM dual;
SELECT AI 'list tables';

SELECT DBMS_CLOUD_AI.GENERATE(
         prompt => 'show all claims with claim status paid'
       )
FROM dual;

-- runsql (the default), showsql, narrate, chat, explainsql, feedback, and summarize
SELECT AI 'show all columns from PSFTCLN.PS_CLM_HDR fetch first 5 rows only';
SELECT AI 'How many claim records are there in PS_CLM_HDR';
select ai narrate How many records are there in PS_CLM_HDR table;
select ai showsql 
Display invoice number, amount due, and invoice date for each invoice;
SELECT AI Display invoice number, amount due, and invoice date for each invoice;

CREATE TABLE PSFTCLN.Director (
    director_id     INT PRIMARY KEY,
    name            VARCHAR(100)
);
/
EXEC DBMS_CLOUD_AI.set_profile('GENAI');
-- Run the API for single table
BEGIN
    DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
        profile_name => 'GENAI',
        object_name  => 'DIRECTOR',
        owner_name   => 'PSFTCLN',
        record_count => 30,
        user_prompt => q'[
            Generate 30 realistic rows for PSFTCLN.DIRECTOR
            DIRECTOR_ID should be unique 
            DIRECTOR_ID should start from the max value of the DIRECTOR_ID onwards in the table
        ]'
    );
END;
/
select * from DIRECTOR;
select * from ps_clm_hdr;
select count(*) from ps_clm_hdr;


EXEC DBMS_CLOUD_AI.set_profile('GENAI');
-- Run the API for single table
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name => 'GENAI',
    object_name  => 'PS_CLM_HDR',
    owner_name   => 'PSFTCLN',
    record_count    => 40,
    user_prompt => q'[
      Generate 30 realistic rows for PSFTCLN.PS_CLM_HDR.
      BUSINESS_UNIT should be US003.
      CLAIM_ID must be unique and increment from the current max CLAIM_ID.
      SOURCE_SYSTEM should be PSFT.
      MEMBER_ID format MEMnnnn.
      PROVIDER_ID format PROVnnnn.
      PAYER_ID format PAYERnnnn.
      CLAIM_STATUS_CD should be one of PAID, DENIED, PENDING.
      CLAIM_TYPE_CD should be one of PROF, INST.
      Currency should be USD.
      Amount columns should be realistic and nonnegative.
      UPDATED_DTTM should be >= CREATED_DTTM.
    ]'
  );
END;
/

Based on the table structure for below PSFTCLN.PS_CLM_LINE with some sample data in it - generate me code using the sample code for another table as an example
CREATE TABLE PSFTCLN.PS_CLM_LINE 
    ( 
     BUSINESS_UNIT    VARCHAR2 (5) , 
     CLAIM_ID         VARCHAR2 (20) , 
     LINE_NBR         NUMBER (5) , 
     SERVICE_FROM_DT  DATE  NOT NULL , 
     SERVICE_THRU_DT  DATE  NOT NULL , 
     PROC_CD          VARCHAR2 (10) , 
     REV_CD           VARCHAR2 (10) , 
     DIAG_CD_1        VARCHAR2 (10) , 
     DIAG_CD_2        VARCHAR2 (10) , 
     UNITS            NUMBER (10,2) DEFAULT 1  NOT NULL , 
     CHARGE_AMT       NUMBER (12,2) DEFAULT 0  NOT NULL , 
     ALLOWED_AMT      NUMBER (12,2) DEFAULT 0  NOT NULL , 
     PAID_AMT         NUMBER (12,2) DEFAULT 0  NOT NULL , 
     LINE_STATUS_CD   VARCHAR2 (10)  NOT NULL , 
     DENIAL_REASON_CD VARCHAR2 (10) , 
     CREATED_DTTM     TIMESTAMP DEFAULT SYSTIMESTAMP  NOT NULL 
    ) 
    TABLESPACE DATA 
    LOGGING 
;


CREATE UNIQUE INDEX PSFTCLN.PS_CLM_LINE_PK ON PSFTCLN.PS_CLM_LINE 
    ( 
     BUSINESS_UNIT ASC , 
     CLAIM_ID ASC , 
     LINE_NBR ASC 
    ) 
    TABLESPACE DATA 
    LOGGING 
;

ALTER TABLE PSFTCLN.PS_CLM_LINE 
    ADD CONSTRAINT PS_CLM_LINE_PK PRIMARY KEY ( BUSINESS_UNIT, CLAIM_ID, LINE_NBR ) 
    USING INDEX PSFTCLN.PS_CLM_LINE_PK ;

ALTER TABLE PSFTCLN.PS_CLM_LINE 
    ADD CONSTRAINT PS_CLM_LINE_FK1 FOREIGN KEY 
    ( 
     BUSINESS_UNIT,
     CLAIM_ID
    ) 
    REFERENCES PSFTCLN.PS_CLM_HDR ( BUSINESS_UNIT, CLAIM_ID ) 
    NOT DEFERRABLE 
;    
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name => 'GENAI',
    object_name  => 'PS_CLM_HDR',
    owner_name   => 'PSFTCLN',
    record_count    => 40,
    user_prompt => q'[
      Generate 30 realistic rows for PSFTCLN.PS_CLM_HDR.
      BUSINESS_UNIT should be US003.
      CLAIM_ID must be unique and increment from the current max CLAIM_ID.
      SOURCE_SYSTEM should be PSFT.
      MEMBER_ID format MEMnnnn.
      PROVIDER_ID format PROVnnnn.
      PAYER_ID format PAYERnnnn.
      CLAIM_STATUS_CD should be one of PAID, DENIED, PENDING.
      CLAIM_TYPE_CD should be one of PROF, INST.
      Currency should be USD.
      Amount columns should be realistic and nonnegative.
      UPDATED_DTTM should be >= CREATED_DTTM.
    ]'
  );
END;
/

select * from ps_clm_line ;
select count(*) from ps_clm_line ;
EXEC DBMS_CLOUD_AI.set_profile('GENAI');
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name => 'GENAI',
    object_name  => 'PS_CLM_LINE',
    owner_name   => 'PSFTCLN',
    record_count => 103,
    user_prompt  => q'[
      Generate 103 realistic rows for PSFTCLN.PS_CLM_LINE.

      Table semantics:
      - This is a healthcare claim line table.
      - Each row represents one service line for a claim.

      Key and relationship rules:
      - BUSINESS_UNIT should be a valid 5-character value such as US003.
      - CLAIM_ID must reference an existing claim in PSFTCLN.PS_CLM_HDR for the same BUSINESS_UNIT.
      - LINE_NBR must be unique within each (BUSINESS_UNIT, CLAIM_ID) combination.
      - Generate multiple line numbers per claim where realistic, such as 1, 2, 3.

      Column rules:
      - SERVICE_FROM_DT should be on or before SERVICE_THRU_DT.
      - PROC_CD should look like a realistic procedure code.
      - REV_CD should look like a realistic revenue code when present.
      - DIAG_CD_1 and DIAG_CD_2 should look like realistic diagnosis codes.
      - UNITS should be positive and realistic, usually between 1 and 10, sometimes fractional where appropriate.
      - CHARGE_AMT should be positive.
      - ALLOWED_AMT should be greater than or equal to 0 and less than or equal to CHARGE_AMT.
      - PAID_AMT should be greater than or equal to 0 and less than or equal to ALLOWED_AMT.
      - LINE_STATUS_CD should be one of PAID, DENIED, PENDING.
      - DENIAL_REASON_CD should be populated mainly when LINE_STATUS_CD is DENIED, otherwise usually null.
      - CREATED_DTTM should be populated with a realistic timestamp.

      Data quality rules:
      - Produce realistic healthcare claim line patterns.
      - Use a mix of professional and institutional style lines.
      - For DENIED lines, PAID_AMT should usually be 0.
      - For PAID lines, PAID_AMT should usually be greater than 0.
      - Keep values consistent across columns.
      - Ensure primary key uniqueness on (BUSINESS_UNIT, CLAIM_ID, LINE_NBR).
      - Ensure foreign key validity against PSFTCLN.PS_CLM_HDR.
    ]'
  );
END;
/

select * from PS_CLM_STATUS_HIST;
select count(*) from PS_CLM_STATUS_HIST;

Based on the table structure for below PSFTCLN.PS_CLM_STATUS_HIST with some sample data in it - generate me code using the sample code for another table as an example
CREATE TABLE PSFTCLN.PS_CLM_STATUS_HIST 
    ( 
     BUSINESS_UNIT VARCHAR2 (5) , 
     CLAIM_ID      VARCHAR2 (20) , 
     STATUS_SEQ    NUMBER (5) , 
     STATUS_CD     VARCHAR2 (10)  NOT NULL , 
     STATUS_DTTM   TIMESTAMP  NOT NULL , 
     STATUS_REASON VARCHAR2 (50) 
    ) 
    TABLESPACE DATA 
    LOGGING 
;

CREATE UNIQUE INDEX PSFTCLN.PS_CLM_STATUS_HIST_PK ON PSFTCLN.PS_CLM_STATUS_HIST 
    ( 
     BUSINESS_UNIT ASC , 
     CLAIM_ID ASC , 
     STATUS_SEQ ASC 
    ) 
    TABLESPACE DATA 
    LOGGING 
;

ALTER TABLE PSFTCLN.PS_CLM_STATUS_HIST 
    ADD CONSTRAINT PS_CLM_STATUS_HIST_PK PRIMARY KEY ( BUSINESS_UNIT, CLAIM_ID, STATUS_SEQ ) 
    USING INDEX PSFTCLN.PS_CLM_STATUS_HIST_PK ;

ALTER TABLE PSFTCLN.PS_CLM_STATUS_HIST 
    ADD CONSTRAINT PS_CLM_STATUS_HIST_FK1 FOREIGN KEY 
    ( 
     BUSINESS_UNIT,
     CLAIM_ID
    ) 
    REFERENCES PSFTCLN.PS_CLM_HDR ( BUSINESS_UNIT, CLAIM_ID ) 
    NOT DEFERRABLE 
;

BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name => 'GENAI',
    object_name  => 'PS_CLM_LINE',
    owner_name   => 'PSFTCLN',
    record_count => 103,
    user_prompt  => q'[
      Generate 103 realistic rows for PSFTCLN.PS_CLM_LINE.

      Table semantics:
      - This is a healthcare claim line table.
      - Each row represents one service line for a claim.

      Key and relationship rules:
      - BUSINESS_UNIT should be a valid 5-character value such as US003.
      - CLAIM_ID must reference an existing claim in PSFTCLN.PS_CLM_HDR for the same BUSINESS_UNIT.
      - LINE_NBR must be unique within each (BUSINESS_UNIT, CLAIM_ID) combination.
      - Generate multiple line numbers per claim where realistic, such as 1, 2, 3.

      Column rules:
      - SERVICE_FROM_DT should be on or before SERVICE_THRU_DT.
      - PROC_CD should look like a realistic procedure code.
      - REV_CD should look like a realistic revenue code when present.
      - DIAG_CD_1 and DIAG_CD_2 should look like realistic diagnosis codes.
      - UNITS should be positive and realistic, usually between 1 and 10, sometimes fractional where appropriate.
      - CHARGE_AMT should be positive.
      - ALLOWED_AMT should be greater than or equal to 0 and less than or equal to CHARGE_AMT.
      - PAID_AMT should be greater than or equal to 0 and less than or equal to ALLOWED_AMT.
      - LINE_STATUS_CD should be one of PAID, DENIED, PENDING.
      - DENIAL_REASON_CD should be populated mainly when LINE_STATUS_CD is DENIED, otherwise usually null.
      - CREATED_DTTM should be populated with a realistic timestamp.

      Data quality rules:
      - Produce realistic healthcare claim line patterns.
      - Use a mix of professional and institutional style lines.
      - For DENIED lines, PAID_AMT should usually be 0.
      - For PAID lines, PAID_AMT should usually be greater than 0.
      - Keep values consistent across columns.
      - Ensure primary key uniqueness on (BUSINESS_UNIT, CLAIM_ID, LINE_NBR).
      - Ensure foreign key validity against PSFTCLN.PS_CLM_HDR.
    ]'
  );
END;
/

select count(*) from ps_clm_line ;
select count(*) from PS_CLM_STATUS_HIST;
EXEC DBMS_CLOUD_AI.set_profile('GENAI');
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name => 'GENAI',
    object_name  => 'PS_CLM_STATUS_HIST',
    owner_name   => 'PSFTCLN',
    record_count => 103,
    user_prompt  => q'[
      Generate 103 realistic rows for PSFTCLN.PS_CLM_STATUS_HIST.

      Table semantics:
      - This is a healthcare claim status history table.
      - Each row represents one status event for a claim over time.

      Key and relationship rules:
      - BUSINESS_UNIT should be a valid 5-character value such as US003.
      - CLAIM_ID must reference an existing claim in PSFTCLN.PS_CLM_HDR for the same BUSINESS_UNIT.
      - STATUS_SEQ must be unique within each (BUSINESS_UNIT, CLAIM_ID) combination.
      - Generate multiple status history rows per claim where realistic, such as 1, 2, 3.
      - STATUS_SEQ should increase in the same order as STATUS_DTTM for a given claim.

      Column rules:
      - STATUS_CD should be realistic claim workflow statuses such as RECEIVED, PENDING, IN_REVIEW, APPROVED, PAID, DENIED, ADJUSTED.
      - STATUS_DTTM should be a realistic timestamp and should increase chronologically within each claim history.
      - STATUS_REASON should be a short realistic explanation and may be null for normal transitions.

      Data quality rules:
      - Produce realistic healthcare claim lifecycle progressions.
      - For a given claim, statuses should follow a believable sequence over time.
      - If STATUS_CD is DENIED, STATUS_REASON should usually be populated.
      - If STATUS_CD is PAID, STATUS_REASON may be null or indicate successful adjudication.
      - Keep values consistent across columns.
      - Ensure primary key uniqueness on (BUSINESS_UNIT, CLAIM_ID, STATUS_SEQ).
      - Ensure foreign key validity against PSFTCLN.PS_CLM_HDR.
    ]'
  );
END;
/

------------------------------------------------
RECORD DELETION
select count(*) from PSFTCLN.PS_CLM_HDR ;
select business_unit, count(*) from PSFTCLN.PS_CLM_HDR group by business_unit;
update ps_clm_hdr set BUSINESS_UNIT = 'US004' where business_unit='US002';
delete ps_clm_hdr where business_unit = 'US003';

select business_unit, count(*)  from PS_CLM_LINE group by business_unit;
update ps_clm_line set BUSINESS_UNIT = 'US005' where business_unit='US002';
delete ps_clm_line where business_unit = 'US003';

select count(*) from PSFTCLN.PS_PAYER ;
select count(*) from PSFTCLN.PS_PROVEIDER ;
select count(*) from PSFTCLN.PS_MEMBER;
select count(*) from PSFTCLN.PS_CLM_HDR ;
select count(*) from PSFTCLN.PS_CLM_LINE
---------------------------------------------------
CREATE OR REPLACE PROCEDURE test_proc (
    p_param_1 NUMBER DEFAULT 1
)
AS
BEGIN
    dbms_output.put_line(
        'Test description ' || TO_CHAR(p_param_1)
    );
END;
/
----------------------------------------------------
BEGIN
    test_proc(10);
END;
/
----------------------------------------------------
--incremental data load script 
select * from ps_member ;
select * from ps_payer;
select * from ps_provider;
select count(*) from ps_member ;
select count(*) from ps_payer;
select count(*) from ps_provider;
select distinct TO_CHAR(created_dttm,'dd/mm/yyyy') from ps_member ;
-------------------------------------------------------------------
EXEC DBMS_CLOUD_AI.set_profile('GENAI');
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name => 'GENAI',
    object_name  => 'PS_MEMBER',
    owner_name   => 'PSFTCLN',
    record_count => 100,
    user_prompt  => q'[
      Generate 100 realistic rows for PSFTCLN.PS_MEMBER.

      Table semantics:
      - This is a member dimension/master table.
      - Each row represents one member.

      Key rules:
      - MEMBER_ID must be unique.
      - MEMBER_ID should follow the pattern MEMnnnn, continuing from the current maximum existing MEMBER_ID.
      - Do not generate duplicate MEMBER_ID values.

      Column rules:
      - MEMBER_SK is an identity column generated by the database, so do not provide a value for it.
      - BIRTH_YR should be a realistic 4-digit year, typically between 1940 and 2010.
      - GENDER_CD should be a realistic single-character code such as M or F.
      - ZIP3 should be a 3-character ZIP prefix and should preserve leading zeros where appropriate.
      - CREATED_DTTM must be generated using the current datetime value at insert time, equivalent to SYSTIMESTAMP.

      Data quality rules:
      - Produce realistic demographic-style records.
      - Use a reasonable mix of male and female values.
      - Keep ZIP3 values realistic US-style prefixes.
      - Ensure rows satisfy the primary key constraint on MEMBER_ID.
      - Since the table currently has only about 30 rows, generate new rows beyond the existing MEMBER_ID range.
    ]'
  );
END;
/

select count(*) from ps_payer;
EXEC DBMS_CLOUD_AI.set_profile('GENAI');
BEGIN
  DBMS_CLOUD_AI.GENERATE_SYNTHETIC_DATA(
    profile_name => 'GENAI',
    object_name  => 'PS_PAYER',
    owner_name   => 'PSFTCLN',
    record_count => 30,
    user_prompt  => q'[
      Generate 30 realistic rows for PSFTCLN.PS_PAYER.

      Table semantics:
      - This is a payer master table.
      - Each row represents one payer or payer product.

      Key rules:
      - PAYER_ID must be unique.
      - PAYER_ID should follow the pattern PAYERnnnn, continuing from the current maximum existing PAYER_ID.
      - Do not generate duplicate PAYER_ID values.

      Column rules:
      - PAYER_NAME should be a realistic health plan or payer name.
      - PLAN_TYPE_CD should be a realistic plan type code such as COMM, MCR, or MCD.
      - CREATED_DTTM must be generated using the current datetime value at insert time, equivalent to SYSTIMESTAMP.

      Data quality rules:
      - Produce realistic payer names similar to commercial, Medicare, and Medicaid plan names.
      - Use a sensible mix of PLAN_TYPE_CD values across COMM, MCR, and MCD.
      - Ensure rows satisfy the primary key constraint on PAYER_ID.
      - Since the table already has existing rows like PAYER0001 through PAYER0005, generate new rows beyond the existing PAYER_ID range.
    ]'
  );
END;
/