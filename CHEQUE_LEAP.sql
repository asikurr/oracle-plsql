INSERT INTO FLORABANK_ONLINE.GL_SUB_HEAD_MSTR (SUB_HEAD_CODE,
                                                   USER_CODE,
                                                   TDATE,
                                                   SUB_HEAD_NAME,
                                                   SUB_HEAD_ADDR,
                                                   CUSTOMER,
                                                   PER_ADD,
                                                   busi_city,
                                                   busi_dist,
                                                   BUSI_PH,
                                                   
                                                   PER_CITY,
                                                   PER_DIST,
                                                   PER_PH,
                                                   
                                                   BRANCH_CODE,
                                                    FAC_ADD,
                                                    FAC_CITY,
                                                    FAC_DIST,

                                                   MOTHER_NAME,
                                                   SECTOR,
                                                   NATIONALITY,
                                                   
                                                   DATE_OF_BIRTH,
                                                   GROUPCODE,
                                                   BORROWER_NO,
                                                   FATHER_HUS,
                                                   OWN,
                                                   STYPE,
                                                   TYPE_BORR,
                                                   FAHA_SALUTATION,
                                                   
                                                   MARITAL_CODE,
                                                   SPOUSE,
                                                   NATIONAL_ID,
                                                   APPROVEYN,
                                                   APPROVE_USER_CODE,
                                                   EDIT_USER_CODE,
                                                   OCCP_ID,
                                                   CLASSCODE,
                                                   RM_ID,
                                                   OPEN_SYS_DATE,
                                                   SEX,
                                                   COUNTRY_CODE,
                                                   WALKINGYN,
                                                   NET_WORTH,
                                                   CUS_NATURE,
                                                   YSCORE,
                                                   ZSCORE,
                                                   PRIVILEGEYN,
                                                   PLACE_OF_PASSPORT_ISSUE,
                                                   FATCA_STATUS,
                                                   ENT_GLOB_USERYN,
                                                   BBCIBREPYN,
                                                   MINORACYN,
                                                   COMMUNICATION_ADD,
                                                   FIRST_NAME,
                                                   CIBSECTOR,
                                                   RETURNSUBMITYN,
                                                   RETURNSUBMITDATE,
                                                   PLACE_OF_BIRTH_DIST,
                                                   PER_POSTAL_CODE,
                                                   PRE_MOBILNO,
                                                   AUTHO_SYS_DATE,
                                                   OCCUPATION,
                                                   GIR_NO,
                                                   BUSI_EMAIL,
                                                   PER_EMAIL,
                                                   PASSPORTNO,
                                                   PASSPORT_EXPIRY_DT,
                                                   TRADE_LICE_NO,
                                                   TRADE_LICE_DT,
                                                   BI_NO


                                                   )
       
       
       
SELECT 1||a.recid,
           101 User1,
           TO_DATE ( SUBSTR (EXTRACTVALUE (a.XMLRECORD, '/row/c184[position()=1]'),1,6),'YY-MM-DD') tdate,
           
             (case
                when trim(NVL(EXTRACTVALUE (a.XMLRECORD,'/row/c3[position()=1]'),' ')) = trim(NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c4[position()=1]'),' ')) then
                trim(NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c4[position()=1]'),' '))
                else trim(NVL(EXTRACTVALUE (a.XMLRECORD,'/row/c3[position()=1]'),' ')) ||' '|| trim(NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c4[position()=1]'),' '))
           end) FullName,
                                         
            NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c5[position()=1]'), ' ') ||' '||NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c6[position()=1]'), ' ') SUB_HEAD_ADDR,                     
               1||a.recid CUSTOMERCODE,                                    
               NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c5[position()=1]'), ' ') ||' '||NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c6[position()=1]'), ' ') PER_ADD,
               (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]')) > 25 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]'), 1, 25)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]'), ' ')
                END) busi_city,
             
                (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]')) > 25 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]'), 1, 25)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]'), ' ')
                END) busi_dist,
                (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]')) > 15 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]'), 1, 15)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]'), ' ')
                END) BUSI_PH,
                 (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]')) > 25 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]'), 1, 25)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]'), ' ')
                END) PER_CITY,
             
                (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]')) > 25 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]'), 1, 25)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]'), ' ')
                END) PER_DIST,
                (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]')) > 15 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]'), 1, 15)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]'), ' ')
                END) PER_PH,

                SUBSTR (EXTRACTVALUE (a.XMLRECORD, '/row/c48[position()=1]'),
                       6,
                       4) BranchCode,  
              
              
              NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c5[position()=1]'), ' ') ||' '||NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c6[position()=1]'), ' ') FAC_ADD,
              
                               (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]')) > 25 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]'), 1, 25)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c7[position()=1]'), ' ')
                END) FAC_CITY,
             
                (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]')) > 25 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]'), 1, 25)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c179[@m="12"][1]'), ' ')
                END) FAC_DIST,
              
              
              
               NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="15"][1]'), ' '), -- "MOTHER Name"
               NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c23[position()=1]'), ' '), -- "SECTOR CODE"
                NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c28[position()=1]'), ' '), -- "Nationality"
                (CASE
                    WHEN NVL (
                             EXTRACTVALUE (a.XMLRECORD,
                                           '/row/c179[@m="4"][1]'),
                             ' ') =
                         'INDIVIDUAL'
                    THEN
                        TO_DATE (
                            EXTRACTVALUE (a.XMLRECORD,
                                          '/row/c64[position()=1]'),
                            'YYYY-MM-DD')
                    ELSE
                        TO_DATE (
                            EXTRACTVALUE (a.XMLRECORD,
                                          '/row/c42[position()=1]'),
                            'YYYY-MM-DD')
               
                END) DateOfBirth,
               0,
               ' ',
               NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="14"][1]'), ' ') father_HUS, 
               0 OWN,
               0,
               0,
               ' ',
               (CASE
                    WHEN NVL (
                             EXTRACTVALUE (a.XMLRECORD, '/row/c65[position()=1]'), ' ') =
                         'MARRIED'
                    THEN
                        '1'
                    ELSE
                        '2'
                END) MARITAL_STATUS, 
               
               NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="16"][1]'), ' ') SPOUSE_NAME,
               (case 
                    WHEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c35[position()=1]'), ' ') = 'NATIONAL.ID' 
                    THEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c34[position()=1]'), ' ') 
                    ELSE ' ' 
                    END ), -- "NATIONAL ID"
                'Y',
                --NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c185[position()=1]'), ' '), -- "authorizer"
                101 "APP USER",
                --NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c183[position()=1]'), ' '), -- "inputer"
                101 "EDIT USER",
                042 "OCCU ID",
                (CASE
                    WHEN (NVL ( EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="4"][1]'), ' ') = 'INDIVIDUAL'  OR NVL ( EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="4"][1]'), ' ') = 'GENERAL')
                    THEN
                        '1'
                    ELSE
                        '2'
                END) individual_corporate, 
            NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="21"][1]'), ' ') RM_CODE, 
            TO_DATE ( SUBSTR (EXTRACTVALUE (a.XMLRECORD, '/row/c184[position()=1]'),1,6),'YY-MM-DD') authdate,
            (CASE
                    WHEN NVL (
                             EXTRACTVALUE (a.XMLRECORD,
                                           '/row/c63[position()=1]'),
                             ' ') =
                         'MALE'
                    THEN
                        'M'
                    ELSE
                        'F'
                END) gender,
                NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c30[position()=1]'), ' ') COUNTRY_CODE, 
                'N' "WALKING",
                0 "NET WORTH",
                (CASE
                    WHEN (NVL ( EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="4"][1]'), ' ') = 'INDIVIDUAL'  OR NVL ( EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="4"][1]'), ' ') = 'GENERAL')
                    THEN
                        '1'
                    ELSE
                        '2'
                END) CLASSCODE, 
                0 "yscore",
                0 "zscore",
                'N' "PRIVILEGEYN",
                ' ' "PLACE_OF_PASSPORT_ISSUE",
                'N' "FATCA_STATUS",
                'N' "ENT_GLOB_USERYN",
                'N' "BBCIBREPYN",
                'N' "MINORACYN",
                1 "COMMUNICATION_ADD",
                NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c2[position()=1]'),' '),
                                          --"first Name"
                
                NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="5"][1]'), ' ') CB_SECTOR_CODE,
                NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="20"][1]'), ' ') RETURNSUBMITYN,
                NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="19"][1]'), ' ') RETURNSUBMITDATE,
                 NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="13"][1]'), ' ') PlaceofBirth, 
                 SUBSTR(EXTRACTVALUE (a.XMLRECORD, '/row/c179[@m="9"][1]'),1,4) CUS_PER_PCODE,
                 (CASE
                    WHEN 
                             LENGTH(EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]')) > 15 
                        
                    THEN
                        SUBSTR(EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]'), 1, 15)
                    ELSE
                        NVL (EXTRACTVALUE (a.XMLRECORD,'/row/c68[position()=1]'), ' ')
                END),  -- "PER mOBILE"
                 TO_DATE ( SUBSTR (EXTRACTVALUE (a.XMLRECORD, '/row/c184[position()=1]'),1,6),'YY-MM-DD'),  --auth date
                 NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c72[position()=1]'), ' ') Occupation, 
                 (case 
                    WHEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c35[position()=1]'), ' ') = 'TIN' 
                    THEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c34[position()=1]'), ' ') 
                    ELSE ' ' 
                    END ), --GIR_NO,
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c69[position()=1]'), ' '), -- "business email"
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c69[position()=1]'), ' '), -- "permanant email "
                (case 
                    WHEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c35[position()=1]'), ' ') = 'PASSPORT' 
                    THEN  NVL (SUBSTR(EXTRACTVALUE (a.XMLRECORD,'/row/c34[position()=1]'), 1, 15),' ') 
                    ELSE ' ' 
                    END ) passport,
                 (case 
                    WHEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c35[position()=1]'), ' ') = 'PASSPORT'
                    THEN TO_CHAR(TO_DATE ( EXTRACTVALUE (a.XMLRECORD, '/row/c39[position()=1]'),'YY-MM-DD'))
                    ELSE ' ' 
                    END ) PASSPORT_EXPIRY_DT,
                    
                 (case 
                    WHEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c35[position()=1]'), ' ') = 'TRADE.LICENCE'
                    THEN SUBSTR(EXTRACTVALUE (a.XMLRECORD, '/row/c34[position()=1]'), 1, 30)
                    ELSE ' ' 
                    END ) TRADE_LICENCE,
                (case 
                    WHEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c35[position()=1]'), ' ') = 'TRADE.LICENCE'
                    THEN TO_CHAR(TO_DATE ( EXTRACTVALUE (a.XMLRECORD, '/row/c38[position()=1]'),'YY-MM-DD'))
                    ELSE ' ' 
                    END ) TRADE_LICENCE_ISSU_DATE,
                (case 
                    WHEN NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c35[position()=1]'), ' ') = 'BIN'
                    THEN EXTRACTVALUE (a.XMLRECORD, '/row/c34[position()=1]')
                    ELSE ' ' 
                    END ) BO_NO
                    
               -----------------------------
               /*
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c32[position()=1]'), ' '), -- "INTRODUCER"
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c45[position()=1]'), ' '), -- "LANGUAGE"
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c187[position()=1]'), ' '), -- "Department code"
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c101[position()=1]'), ' '), -- "customer type"
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c29[position()=1]'), ' '), -- "customer status"
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c100[position()=1]'), ' '), -- "customer since"
                    NVL (EXTRACTVALUE (a.XMLRECORD, '/row/c48[position()=1]'), ' '), -- "customer company"
                    */

     FROM FBNK_CUSTOMER@T24_2_FLORATEST a;
     --WHERE rownum<=100
     --order by RECID;
     
    / 
 SELECT * FROM FLORABANK_ONLINE.GL_SUB_HEAD_MSTR ;