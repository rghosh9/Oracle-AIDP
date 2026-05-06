--
-- Setting up External tables in OCI Object Storage for PDB files and index.csv
--
BEGIN
  -- Create a OCI toke for the userid in tenancy and create a credential using the token
  DBMS_CLOUD.CREATE_CREDENTIAL(
    credential_name => 'OBJ_STORE_CRED',
    username        => 'oracleidentitycloudservice/rajib.g.ghosh@oracle.com',
    password        => '<OCI Token>' --Auth token
  );
END;
/
--
-- Test for an external table in ADW with PDB columns
--
DROP TABLE IF EXISTS TEST;
/
BEGIN
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(
    table_name      => 'TEST',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list   => 'https://objectstorage.us-chicago-1.oraclecloud.com/n/orasenatdpltintegration03/b/Ellison/o/wrkg/DryRun_202508220900_RFDiffusion_Denovo_PSMAr2_4v1_02dcf44d-2510-484e-8163-c6987dbfec15.pdb',
    format          => json_object(
                         'type' value 'csv',
                         'skipheaders' value '1',
                         'delimiter' value ' ',
                         'quote' value '"',
                         'rejectlimit' value 'unlimited'
                       ),
    column_list     => q'[
      col1 VARCHAR2(100),
      col2 NUMBER,
      col3 VARCHAR2(100),
      col4 VARCHAR2(100),
      col5 VARCHAR2(100),
      col6 NUMBER,
      col7 NUMBER,
      col8 NUMBER,
      col9 NUMBER,
      col10 NUMBER,
      col11 NUMBER,
      col12 VARCHAR2(100)
    ]'
  );
END;
/
select * from test;
--
-- Create the index.csv external table with the scientific columns 
--
DROP TABLE IF EXISTS INDEX_DOT_CSV;
/
BEGIN
  DBMS_CLOUD.CREATE_EXTERNAL_TABLE(
    table_name      => 'INDEX_DOT_CSV',
    credential_name => 'OBJ_STORE_CRED',
    file_uri_list   => 'https://objectstorage.us-chicago-1.oraclecloud.com/n/orasenatdpltintegration03/b/Ellison/o/data/index.csv',
    format          => json_object(
                         'type' value 'csv',
                         'skipheaders' value '1',
                         'quote' value '"',
                         'rejectlimit' value 'unlimited'
                       ),
column_list => q'[
  design                              VARCHAR2(500),
  seqlen                              NUMBER,
  scTM                              NUMBER,
  scRMSD                            NUMBER,
  pLDDT                             NUMBER,
  pAE                               VARCHAR2(100),
  designed_pct_helix                  NUMBER,
  designed_pct_strand                 NUMBER,
  designed_pct_ss                     NUMBER,
  designed_pct_left_helix             NUMBER,
  generated_pct_helix                 NUMBER,
  generated_pct_strand                NUMBER,
  generated_pct_ss                    NUMBER,
  generated_pct_left_helix            NUMBER,
  count_amino_acids_A                 NUMBER,
  count_amino_acids_C                 NUMBER,
  count_amino_acids_D                 NUMBER,
  count_amino_acids_E                 NUMBER,
  count_amino_acids_F                 NUMBER,
  count_amino_acids_G                 NUMBER,
  count_amino_acids_H                 NUMBER,
  count_amino_acids_I                 NUMBER,
  count_amino_acids_K                 NUMBER,
  count_amino_acids_L                 NUMBER,
  count_amino_acids_M                 NUMBER,
  count_amino_acids_N                 NUMBER,
  count_amino_acids_P                 NUMBER,
  count_amino_acids_Q                 NUMBER,
  count_amino_acids_R                 NUMBER,
  count_amino_acids_S                 NUMBER,
  count_amino_acids_T                 NUMBER,
  count_amino_acids_V                 NUMBER,
  count_amino_acids_W                 NUMBER,
  count_amino_acids_Y                 NUMBER,
  amino_acids_percent_A               NUMBER,
  amino_acids_percent_C               NUMBER,
  amino_acids_percent_D               NUMBER,
  amino_acids_percent_E               NUMBER,
  amino_acids_percent_F               NUMBER,
  amino_acids_percent_G               NUMBER,
  amino_acids_percent_H               NUMBER,
  amino_acids_percent_I               NUMBER,
  amino_acids_percent_K               NUMBER,
  amino_acids_percent_L               NUMBER,
  amino_acids_percent_M               NUMBER,
  amino_acids_percent_N               NUMBER,
  amino_acids_percent_P               NUMBER,
  amino_acids_percent_Q               NUMBER,
  amino_acids_percent_R               NUMBER,
  amino_acids_percent_S               NUMBER,
  amino_acids_percent_T               NUMBER,
  amino_acids_percent_V               NUMBER,
  amino_acids_percent_W               NUMBER,
  amino_acids_percent_Y               NUMBER,
  molecular_weight                    NUMBER,
  aromaticity                         NUMBER,
  instability_index                   NUMBER,
  flexibility                         VARCHAR2(4000),
  gravy                               NUMBER,
  isoelectric_point                   NUMBER,
  extinction_coeff                    NUMBER,
  extinction_reduced                  NUMBER,
  charge_at_pH_7                    NUMBER,
  binding_affinity                    NUMBER,
  kd                                  NUMBER,
  contacts                            NUMBER,
  nis_a                               NUMBER,
  nis_c                               NUMBER,
  temperature                         NUMBER,
  Number_of_apolar_apolar_contacts    NUMBER,
  Number_of_polar_polar_contacts      NUMBER,
  Number_of_charged_charged_contacts  NUMBER,
  Number_of_apolar_polar_contacts     NUMBER,
  Number_of_charged_polar_contacts    NUMBER,
  Number_of_apolar_charged_contacts   NUMBER,
  rog_A                                NUMBER,
  seq                                 VARCHAR2(4000),
  model                               VARCHAR2(500),
  md5                                 VARCHAR2(128),
  caprieval_rank                      NUMBER,
  score                               NUMBER,
  irmsd                               NUMBER,
  fnat                                NUMBER,
  lrmsd                               NUMBER,
  ilrmsd                              NUMBER,
  dockq                               NUMBER,
  rmsd                                NUMBER,
  cluster_id                          NUMBER,
  cluster_ranking                     NUMBER,
  model_cluster_ranking             NUMBER,
  air                                 NUMBER,
  angles                              NUMBER,
  bonds                               NUMBER,
  bsa                                 NUMBER,
  cdih                                NUMBER,
  coup                                NUMBER,
  dani                                NUMBER,
  desolv                              NUMBER,
  dihe                                NUMBER,
  elec                                NUMBER,
  improper                            NUMBER,
  rdcs                                NUMBER,
  rg                                  NUMBER,
  sym                                 NUMBER,
  total                               NUMBER,
  vdw                                 NUMBER,
  vean                                NUMBER,
  xpcs                                NUMBER,
  num_clashes                         NUMBER,
  target_delta_sap                    NUMBER,
  binder_delta_sap                    NUMBER,
  gravy_low                           NUMBER,
  ROG_cutoff                        NUMBER,
  gravy_high                          NUMBER,
  dsap_cutoff                         NUMBER,
  scTM_cutoff                       NUMBER,
  clash_cutoff                        NUMBER,
  pLDDT_cutoff                      NUMBER,
  scTM_pass                         VARCHAR2(5),
  gravy_pass                          VARCHAR2(5),
  pLDDT_pass                        VARCHAR2(5),
  rog_pass                      VARCHAR2(5),
  clash_count_pass                    VARCHAR2(5),
  binder_delta_sap_pass               VARCHAR2(5)
]'  );
END;
/
-- Database views for the external tables
select * from USER_EXTERNAL_TABLES;
select * from USER_TABLES;
desc USER_EXTERNAL_TABLES
select * from INDEX_DOT_CSV ;

-- Generate distinct counts of the scientific attributes 
select 'select '''||column_name||''' as ColumnName, count(distinct '||column_name||') as discnt from '||table_name||' union' 
from USER_TAB_COLUMNS where TABLE_NAME = 'INDEX_DOT_CSV'  order by column_id;
/
DROP TABLE IF EXISTS INDEX_DOT_CSV_COL_DISCNT ;
/
CREATE TABLE INDEX_DOT_CSV_COL_DISCNT AS
select 'DESIGN' as ColumnName, count(distinct DESIGN) as discnt from INDEX_DOT_CSV union
select 'SEQLEN' as ColumnName, count(distinct SEQLEN) as discnt from INDEX_DOT_CSV union
select 'SCTM' as ColumnName, count(distinct SCTM) as discnt from INDEX_DOT_CSV union
select 'SCRMSD' as ColumnName, count(distinct SCRMSD) as discnt from INDEX_DOT_CSV union
select 'PLDDT' as ColumnName, count(distinct PLDDT) as discnt from INDEX_DOT_CSV union
select 'PAE' as ColumnName, count(distinct PAE) as discnt from INDEX_DOT_CSV union
select 'DESIGNED_PCT_HELIX' as ColumnName, count(distinct DESIGNED_PCT_HELIX) as discnt from INDEX_DOT_CSV union
select 'DESIGNED_PCT_STRAND' as ColumnName, count(distinct DESIGNED_PCT_STRAND) as discnt from INDEX_DOT_CSV union
select 'DESIGNED_PCT_SS' as ColumnName, count(distinct DESIGNED_PCT_SS) as discnt from INDEX_DOT_CSV union
select 'DESIGNED_PCT_LEFT_HELIX' as ColumnName, count(distinct DESIGNED_PCT_LEFT_HELIX) as discnt from INDEX_DOT_CSV union
select 'GENERATED_PCT_HELIX' as ColumnName, count(distinct GENERATED_PCT_HELIX) as discnt from INDEX_DOT_CSV union
select 'GENERATED_PCT_STRAND' as ColumnName, count(distinct GENERATED_PCT_STRAND) as discnt from INDEX_DOT_CSV union
select 'GENERATED_PCT_SS' as ColumnName, count(distinct GENERATED_PCT_SS) as discnt from INDEX_DOT_CSV union
select 'GENERATED_PCT_LEFT_HELIX' as ColumnName, count(distinct GENERATED_PCT_LEFT_HELIX) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_A' as ColumnName, count(distinct COUNT_AMINO_ACIDS_A) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_C' as ColumnName, count(distinct COUNT_AMINO_ACIDS_C) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_D' as ColumnName, count(distinct COUNT_AMINO_ACIDS_D) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_E' as ColumnName, count(distinct COUNT_AMINO_ACIDS_E) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_F' as ColumnName, count(distinct COUNT_AMINO_ACIDS_F) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_G' as ColumnName, count(distinct COUNT_AMINO_ACIDS_G) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_H' as ColumnName, count(distinct COUNT_AMINO_ACIDS_H) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_I' as ColumnName, count(distinct COUNT_AMINO_ACIDS_I) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_K' as ColumnName, count(distinct COUNT_AMINO_ACIDS_K) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_L' as ColumnName, count(distinct COUNT_AMINO_ACIDS_L) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_M' as ColumnName, count(distinct COUNT_AMINO_ACIDS_M) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_N' as ColumnName, count(distinct COUNT_AMINO_ACIDS_N) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_P' as ColumnName, count(distinct COUNT_AMINO_ACIDS_P) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_Q' as ColumnName, count(distinct COUNT_AMINO_ACIDS_Q) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_R' as ColumnName, count(distinct COUNT_AMINO_ACIDS_R) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_S' as ColumnName, count(distinct COUNT_AMINO_ACIDS_S) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_T' as ColumnName, count(distinct COUNT_AMINO_ACIDS_T) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_V' as ColumnName, count(distinct COUNT_AMINO_ACIDS_V) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_W' as ColumnName, count(distinct COUNT_AMINO_ACIDS_W) as discnt from INDEX_DOT_CSV union
select 'COUNT_AMINO_ACIDS_Y' as ColumnName, count(distinct COUNT_AMINO_ACIDS_Y) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_A' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_A) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_C' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_C) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_D' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_D) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_E' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_E) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_F' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_F) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_G' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_G) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_H' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_H) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_I' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_I) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_K' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_K) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_L' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_L) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_M' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_M) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_N' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_N) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_P' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_P) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_Q' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_Q) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_R' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_R) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_S' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_S) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_T' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_T) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_V' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_V) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_W' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_W) as discnt from INDEX_DOT_CSV union
select 'AMINO_ACIDS_PERCENT_Y' as ColumnName, count(distinct AMINO_ACIDS_PERCENT_Y) as discnt from INDEX_DOT_CSV union
select 'MOLECULAR_WEIGHT' as ColumnName, count(distinct MOLECULAR_WEIGHT) as discnt from INDEX_DOT_CSV union
select 'AROMATICITY' as ColumnName, count(distinct AROMATICITY) as discnt from INDEX_DOT_CSV union
select 'INSTABILITY_INDEX' as ColumnName, count(distinct INSTABILITY_INDEX) as discnt from INDEX_DOT_CSV union
select 'FLEXIBILITY' as ColumnName, count(distinct FLEXIBILITY) as discnt from INDEX_DOT_CSV union
select 'GRAVY' as ColumnName, count(distinct GRAVY) as discnt from INDEX_DOT_CSV union
select 'ISOELECTRIC_POINT' as ColumnName, count(distinct ISOELECTRIC_POINT) as discnt from INDEX_DOT_CSV union
select 'EXTINCTION_COEFF' as ColumnName, count(distinct EXTINCTION_COEFF) as discnt from INDEX_DOT_CSV union
select 'EXTINCTION_REDUCED' as ColumnName, count(distinct EXTINCTION_REDUCED) as discnt from INDEX_DOT_CSV union
select 'CHARGE_AT_PH_7' as ColumnName, count(distinct CHARGE_AT_PH_7) as discnt from INDEX_DOT_CSV union
select 'BINDING_AFFINITY' as ColumnName, count(distinct BINDING_AFFINITY) as discnt from INDEX_DOT_CSV union
select 'KD' as ColumnName, count(distinct KD) as discnt from INDEX_DOT_CSV union
select 'CONTACTS' as ColumnName, count(distinct CONTACTS) as discnt from INDEX_DOT_CSV union
select 'NIS_A' as ColumnName, count(distinct NIS_A) as discnt from INDEX_DOT_CSV union
select 'NIS_C' as ColumnName, count(distinct NIS_C) as discnt from INDEX_DOT_CSV union
select 'TEMPERATURE' as ColumnName, count(distinct TEMPERATURE) as discnt from INDEX_DOT_CSV union
select 'NUMBER_OF_APOLAR_APOLAR_CONTACTS' as ColumnName, count(distinct NUMBER_OF_APOLAR_APOLAR_CONTACTS) as discnt from INDEX_DOT_CSV union
select 'NUMBER_OF_POLAR_POLAR_CONTACTS' as ColumnName, count(distinct NUMBER_OF_POLAR_POLAR_CONTACTS) as discnt from INDEX_DOT_CSV union
select 'NUMBER_OF_CHARGED_CHARGED_CONTACTS' as ColumnName, count(distinct NUMBER_OF_CHARGED_CHARGED_CONTACTS) as discnt from INDEX_DOT_CSV union
select 'NUMBER_OF_APOLAR_POLAR_CONTACTS' as ColumnName, count(distinct NUMBER_OF_APOLAR_POLAR_CONTACTS) as discnt from INDEX_DOT_CSV union
select 'NUMBER_OF_CHARGED_POLAR_CONTACTS' as ColumnName, count(distinct NUMBER_OF_CHARGED_POLAR_CONTACTS) as discnt from INDEX_DOT_CSV union
select 'NUMBER_OF_APOLAR_CHARGED_CONTACTS' as ColumnName, count(distinct NUMBER_OF_APOLAR_CHARGED_CONTACTS) as discnt from INDEX_DOT_CSV union
select 'ROG_A' as ColumnName, count(distinct ROG_A) as discnt from INDEX_DOT_CSV union
select 'SEQ' as ColumnName, count(distinct SEQ) as discnt from INDEX_DOT_CSV union
select 'MODEL' as ColumnName, count(distinct MODEL) as discnt from INDEX_DOT_CSV union
select 'MD5' as ColumnName, count(distinct MD5) as discnt from INDEX_DOT_CSV union
select 'CAPRIEVAL_RANK' as ColumnName, count(distinct CAPRIEVAL_RANK) as discnt from INDEX_DOT_CSV union
select 'SCORE' as ColumnName, count(distinct SCORE) as discnt from INDEX_DOT_CSV union
select 'IRMSD' as ColumnName, count(distinct IRMSD) as discnt from INDEX_DOT_CSV union
select 'FNAT' as ColumnName, count(distinct FNAT) as discnt from INDEX_DOT_CSV union
select 'LRMSD' as ColumnName, count(distinct LRMSD) as discnt from INDEX_DOT_CSV union
select 'ILRMSD' as ColumnName, count(distinct ILRMSD) as discnt from INDEX_DOT_CSV union
select 'DOCKQ' as ColumnName, count(distinct DOCKQ) as discnt from INDEX_DOT_CSV union
select 'RMSD' as ColumnName, count(distinct RMSD) as discnt from INDEX_DOT_CSV union
select 'CLUSTER_ID' as ColumnName, count(distinct CLUSTER_ID) as discnt from INDEX_DOT_CSV union
select 'CLUSTER_RANKING' as ColumnName, count(distinct CLUSTER_RANKING) as discnt from INDEX_DOT_CSV union
select 'MODEL_CLUSTER_RANKING' as ColumnName, count(distinct MODEL_CLUSTER_RANKING) as discnt from INDEX_DOT_CSV union
select 'AIR' as ColumnName, count(distinct AIR) as discnt from INDEX_DOT_CSV union
select 'ANGLES' as ColumnName, count(distinct ANGLES) as discnt from INDEX_DOT_CSV union
select 'BONDS' as ColumnName, count(distinct BONDS) as discnt from INDEX_DOT_CSV union
select 'BSA' as ColumnName, count(distinct BSA) as discnt from INDEX_DOT_CSV union
select 'CDIH' as ColumnName, count(distinct CDIH) as discnt from INDEX_DOT_CSV union
select 'COUP' as ColumnName, count(distinct COUP) as discnt from INDEX_DOT_CSV union
select 'DANI' as ColumnName, count(distinct DANI) as discnt from INDEX_DOT_CSV union
select 'DESOLV' as ColumnName, count(distinct DESOLV) as discnt from INDEX_DOT_CSV union
select 'DIHE' as ColumnName, count(distinct DIHE) as discnt from INDEX_DOT_CSV union
select 'ELEC' as ColumnName, count(distinct ELEC) as discnt from INDEX_DOT_CSV 
order by 1;
select * from INDEX_DOT_CSV_COL_DISCNT order by 2 desc

--Generate distinct values of the scientific attributes in a list
--These distinct values will be filtered top build the custom properties in OCI Data catalog
select 'select distinct '''||column_name||''' as ColumnName, to_char('||column_name||') as disval from '||table_name||' union' 
from USER_TAB_COLUMNS where TABLE_NAME = 'INDEX_DOT_CSV'  order by column_id;
/
DROP TABLE IF EXISTS INDEX_DOT_CSV_COL_DISVAL ;
/
CREATE TABLE INDEX_DOT_CSV_COL_DISVAL  as
select distinct 'DESIGN' as ColumnName, to_char(DESIGN) as disval from INDEX_DOT_CSV union
select distinct 'SEQLEN' as ColumnName, to_char(SEQLEN) as disval from INDEX_DOT_CSV union
select distinct 'SCTM' as ColumnName, to_char(SCTM) as disval from INDEX_DOT_CSV union
select distinct 'SCRMSD' as ColumnName, to_char(SCRMSD) as disval from INDEX_DOT_CSV union
select distinct 'PLDDT' as ColumnName, to_char(PLDDT) as disval from INDEX_DOT_CSV union
select distinct 'PAE' as ColumnName, to_char(PAE) as disval from INDEX_DOT_CSV union
select distinct 'DESIGNED_PCT_HELIX' as ColumnName, to_char(DESIGNED_PCT_HELIX) as disval from INDEX_DOT_CSV union
select distinct 'DESIGNED_PCT_STRAND' as ColumnName, to_char(DESIGNED_PCT_STRAND) as disval from INDEX_DOT_CSV union
select distinct 'DESIGNED_PCT_SS' as ColumnName, to_char(DESIGNED_PCT_SS) as disval from INDEX_DOT_CSV union
select distinct 'DESIGNED_PCT_LEFT_HELIX' as ColumnName, to_char(DESIGNED_PCT_LEFT_HELIX) as disval from INDEX_DOT_CSV union
select distinct 'GENERATED_PCT_HELIX' as ColumnName, to_char(GENERATED_PCT_HELIX) as disval from INDEX_DOT_CSV union
select distinct 'GENERATED_PCT_STRAND' as ColumnName, to_char(GENERATED_PCT_STRAND) as disval from INDEX_DOT_CSV union
select distinct 'GENERATED_PCT_SS' as ColumnName, to_char(GENERATED_PCT_SS) as disval from INDEX_DOT_CSV union
select distinct 'GENERATED_PCT_LEFT_HELIX' as ColumnName, to_char(GENERATED_PCT_LEFT_HELIX) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_A' as ColumnName, to_char(COUNT_AMINO_ACIDS_A) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_C' as ColumnName, to_char(COUNT_AMINO_ACIDS_C) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_D' as ColumnName, to_char(COUNT_AMINO_ACIDS_D) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_E' as ColumnName, to_char(COUNT_AMINO_ACIDS_E) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_F' as ColumnName, to_char(COUNT_AMINO_ACIDS_F) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_G' as ColumnName, to_char(COUNT_AMINO_ACIDS_G) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_H' as ColumnName, to_char(COUNT_AMINO_ACIDS_H) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_I' as ColumnName, to_char(COUNT_AMINO_ACIDS_I) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_K' as ColumnName, to_char(COUNT_AMINO_ACIDS_K) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_L' as ColumnName, to_char(COUNT_AMINO_ACIDS_L) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_M' as ColumnName, to_char(COUNT_AMINO_ACIDS_M) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_N' as ColumnName, to_char(COUNT_AMINO_ACIDS_N) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_P' as ColumnName, to_char(COUNT_AMINO_ACIDS_P) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_Q' as ColumnName, to_char(COUNT_AMINO_ACIDS_Q) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_R' as ColumnName, to_char(COUNT_AMINO_ACIDS_R) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_S' as ColumnName, to_char(COUNT_AMINO_ACIDS_S) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_T' as ColumnName, to_char(COUNT_AMINO_ACIDS_T) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_V' as ColumnName, to_char(COUNT_AMINO_ACIDS_V) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_W' as ColumnName, to_char(COUNT_AMINO_ACIDS_W) as disval from INDEX_DOT_CSV union
select distinct 'COUNT_AMINO_ACIDS_Y' as ColumnName, to_char(COUNT_AMINO_ACIDS_Y) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_A' as ColumnName, to_char(AMINO_ACIDS_PERCENT_A) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_C' as ColumnName, to_char(AMINO_ACIDS_PERCENT_C) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_D' as ColumnName, to_char(AMINO_ACIDS_PERCENT_D) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_E' as ColumnName, to_char(AMINO_ACIDS_PERCENT_E) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_F' as ColumnName, to_char(AMINO_ACIDS_PERCENT_F) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_G' as ColumnName, to_char(AMINO_ACIDS_PERCENT_G) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_H' as ColumnName, to_char(AMINO_ACIDS_PERCENT_H) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_I' as ColumnName, to_char(AMINO_ACIDS_PERCENT_I) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_K' as ColumnName, to_char(AMINO_ACIDS_PERCENT_K) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_L' as ColumnName, to_char(AMINO_ACIDS_PERCENT_L) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_M' as ColumnName, to_char(AMINO_ACIDS_PERCENT_M) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_N' as ColumnName, to_char(AMINO_ACIDS_PERCENT_N) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_P' as ColumnName, to_char(AMINO_ACIDS_PERCENT_P) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_Q' as ColumnName, to_char(AMINO_ACIDS_PERCENT_Q) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_R' as ColumnName, to_char(AMINO_ACIDS_PERCENT_R) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_S' as ColumnName, to_char(AMINO_ACIDS_PERCENT_S) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_T' as ColumnName, to_char(AMINO_ACIDS_PERCENT_T) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_V' as ColumnName, to_char(AMINO_ACIDS_PERCENT_V) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_W' as ColumnName, to_char(AMINO_ACIDS_PERCENT_W) as disval from INDEX_DOT_CSV union
select distinct 'AMINO_ACIDS_PERCENT_Y' as ColumnName, to_char(AMINO_ACIDS_PERCENT_Y) as disval from INDEX_DOT_CSV union
select distinct 'MOLECULAR_WEIGHT' as ColumnName, to_char(MOLECULAR_WEIGHT) as disval from INDEX_DOT_CSV union
select distinct 'AROMATICITY' as ColumnName, to_char(AROMATICITY) as disval from INDEX_DOT_CSV union
select distinct 'INSTABILITY_INDEX' as ColumnName, to_char(INSTABILITY_INDEX) as disval from INDEX_DOT_CSV union
select distinct 'FLEXIBILITY' as ColumnName, to_char(FLEXIBILITY) as disval from INDEX_DOT_CSV union
select distinct 'GRAVY' as ColumnName, to_char(GRAVY) as disval from INDEX_DOT_CSV union
select distinct 'ISOELECTRIC_POINT' as ColumnName, to_char(ISOELECTRIC_POINT) as disval from INDEX_DOT_CSV union
select distinct 'EXTINCTION_COEFF' as ColumnName, to_char(EXTINCTION_COEFF) as disval from INDEX_DOT_CSV union
select distinct 'EXTINCTION_REDUCED' as ColumnName, to_char(EXTINCTION_REDUCED) as disval from INDEX_DOT_CSV union
select distinct 'CHARGE_AT_PH_7' as ColumnName, to_char(CHARGE_AT_PH_7) as disval from INDEX_DOT_CSV union
select distinct 'BINDING_AFFINITY' as ColumnName, to_char(BINDING_AFFINITY) as disval from INDEX_DOT_CSV union
select distinct 'KD' as ColumnName, to_char(KD) as disval from INDEX_DOT_CSV union
select distinct 'CONTACTS' as ColumnName, to_char(CONTACTS) as disval from INDEX_DOT_CSV union
select distinct 'NIS_A' as ColumnName, to_char(NIS_A) as disval from INDEX_DOT_CSV union
select distinct 'NIS_C' as ColumnName, to_char(NIS_C) as disval from INDEX_DOT_CSV union
select distinct 'TEMPERATURE' as ColumnName, to_char(TEMPERATURE) as disval from INDEX_DOT_CSV union
select distinct 'NUMBER_OF_APOLAR_APOLAR_CONTACTS' as ColumnName, to_char(NUMBER_OF_APOLAR_APOLAR_CONTACTS) as disval from INDEX_DOT_CSV union
select distinct 'NUMBER_OF_POLAR_POLAR_CONTACTS' as ColumnName, to_char(NUMBER_OF_POLAR_POLAR_CONTACTS) as disval from INDEX_DOT_CSV union
select distinct 'NUMBER_OF_CHARGED_CHARGED_CONTACTS' as ColumnName, to_char(NUMBER_OF_CHARGED_CHARGED_CONTACTS) as disval from INDEX_DOT_CSV union
select distinct 'NUMBER_OF_APOLAR_POLAR_CONTACTS' as ColumnName, to_char(NUMBER_OF_APOLAR_POLAR_CONTACTS) as disval from INDEX_DOT_CSV union
select distinct 'NUMBER_OF_CHARGED_POLAR_CONTACTS' as ColumnName, to_char(NUMBER_OF_CHARGED_POLAR_CONTACTS) as disval from INDEX_DOT_CSV union
select distinct 'NUMBER_OF_APOLAR_CHARGED_CONTACTS' as ColumnName, to_char(NUMBER_OF_APOLAR_CHARGED_CONTACTS) as disval from INDEX_DOT_CSV union
select distinct 'ROG_A' as ColumnName, to_char(ROG_A) as disval from INDEX_DOT_CSV union
select distinct 'SEQ' as ColumnName, to_char(SEQ) as disval from INDEX_DOT_CSV union
select distinct 'MODEL' as ColumnName, to_char(MODEL) as disval from INDEX_DOT_CSV union
select distinct 'MD5' as ColumnName, to_char(MD5) as disval from INDEX_DOT_CSV union
select distinct 'CAPRIEVAL_RANK' as ColumnName, to_char(CAPRIEVAL_RANK) as disval from INDEX_DOT_CSV union
select distinct 'SCORE' as ColumnName, to_char(SCORE) as disval from INDEX_DOT_CSV union
select distinct 'IRMSD' as ColumnName, to_char(IRMSD) as disval from INDEX_DOT_CSV union
select distinct 'FNAT' as ColumnName, to_char(FNAT) as disval from INDEX_DOT_CSV union
select distinct 'LRMSD' as ColumnName, to_char(LRMSD) as disval from INDEX_DOT_CSV union
select distinct 'ILRMSD' as ColumnName, to_char(ILRMSD) as disval from INDEX_DOT_CSV union
select distinct 'DOCKQ' as ColumnName, to_char(DOCKQ) as disval from INDEX_DOT_CSV union
select distinct 'RMSD' as ColumnName, to_char(RMSD) as disval from INDEX_DOT_CSV union
select distinct 'CLUSTER_ID' as ColumnName, to_char(CLUSTER_ID) as disval from INDEX_DOT_CSV union
select distinct 'CLUSTER_RANKING' as ColumnName, to_char(CLUSTER_RANKING) as disval from INDEX_DOT_CSV union
select distinct 'MODEL_CLUSTER_RANKING' as ColumnName, to_char(MODEL_CLUSTER_RANKING) as disval from INDEX_DOT_CSV union
select distinct 'AIR' as ColumnName, to_char(AIR) as disval from INDEX_DOT_CSV union
select distinct 'ANGLES' as ColumnName, to_char(ANGLES) as disval from INDEX_DOT_CSV union
select distinct 'BONDS' as ColumnName, to_char(BONDS) as disval from INDEX_DOT_CSV union
select distinct 'BSA' as ColumnName, to_char(BSA) as disval from INDEX_DOT_CSV union
select distinct 'CDIH' as ColumnName, to_char(CDIH) as disval from INDEX_DOT_CSV union
select distinct 'COUP' as ColumnName, to_char(COUP) as disval from INDEX_DOT_CSV union
select distinct 'DANI' as ColumnName, to_char(DANI) as disval from INDEX_DOT_CSV union
select distinct 'DESOLV' as ColumnName, to_char(DESOLV) as disval from INDEX_DOT_CSV union
select distinct 'DIHE' as ColumnName, to_char(DIHE) as disval from INDEX_DOT_CSV union
select distinct 'ELEC' as ColumnName, to_char(ELEC) as disval from INDEX_DOT_CSV ;
/
-- View filtering the most important scientific custom properties from index.csv
CREATE OR REPLACE VIEW V_INDEX_DOT_CSV_COL_DISVAL AS
SELECT b.ColumnName, b.disval 
FROM INDEX_DOT_CSV_COL_DISCNT a 
INNER JOIN INDEX_DOT_CSV_COL_DISVAL b 
    on a.ColumnName = b.ColumnName
WHERE a.discnt < 15
order by 2;

select * from V_INDEX_DOT_CSV_COL_DISVAL where columnname = 'AMINO_ACIDS_PERCENT_A' and disval is not null order by 1;