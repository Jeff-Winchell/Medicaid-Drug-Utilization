@Rem requires SQL Server installed and Medicaid database existing given full access to logged in windows user
osql -E -n -i Medicaid_DDL.sql

@Rem requires python installed with path and requests library installed
python download_data.py

osql -E -n -i Import_Data_Into_SQL_Server.sql