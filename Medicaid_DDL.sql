Use Medicaid
Go
Drop Table If Exists Labeler
Go
Create Table Labeler ([Code] Char(5) Not Null Constraint PK_Labeler Primary Key,
Firm NVarChar(200) Not Null)
Go
Drop Table If Exists [Raw Drug Utilization]
Go
Create Table [Raw Drug Utilization] (
    [Utilization Type] Char(4) Not Null Constraint [Raw Utilization Type] Check ([Utilization Type] In ('FFSU','MCOU')),
    [State] Char(2) Not Null Constraint [Raw State] Check ([State] In ('AK','AL','AR','AZ','CA','CO','CT','DC','DE','FL','GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN','MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY','XX')),
    [Labeler Code] Char(5) Not Null Constraint [Raw Labeler Code] Check (IsNumeric([Labeler Code])=1) Constraint [FK_Drug Utilization_Labeler] Foreign Key References Labeler On Delete No Action On Update Cascade,
    [Product Code] Char(4) Not Null Constraint [Raw Product Code] Check (IsNumeric([Product Code])=1),
    [Package Size] Char(2) Not Null Constraint [Raw Package Size] Check (IsNumeric([Package Size])=1),
    [Year] SmallInt Not Null Constraint [Raw Year] Check ([Year]>=1991),
    [Quarter] TinyInt Not Null Constraint [Raw Quarter] Check ([Quarter] Between 1 And 4),
    [Product Name] NVarChar(12) Not Null,
    [Suppression Used] VarChar(5) Not Null Constraint [Raw Suppression Used] Check ([Suppression Used] In ('true','false')),
    [Units Reimbursed] Numeric(12,3) Null,
    [Number of Prescriptions] Int Null,
    [Total Amount Reimbursed] Decimal(11,2) Null,
    [Medicaid Amount Reimbursed] Decimal(11,2) Null,
    [Non Medicaid Amount Reimbursed] Decimal(11,2) Null,
    [Quarter Begin] VarChar(4) Not Null Constraint [Raw Quarter Begin] Check ([Quarter Begin] In ('1/1','4/1','7/1','10/1')),
    [Quarter Begin Date] Date Not Null Constraint [Raw Quarter Date Begin] Check ([Quarter Begin Date]>='01/01/1991'),
    Latitude Numeric(6,4) Null Constraint [Raw Latitude] Check (Latitude Between -90 And 90),
    Longitude Numeric(7,4) Null Constraint [Raw Longitude] Check (Longitude Between -180 and 180),
    [Location] VarChar(25) Null,
    NDC Char(11) Not Null Constraint [Raw NDC] Check (IsNumeric(NDC)=1),
    Constraint [PK_Raw Drug Utilization] Primary Key ([Utilization Type],[State],[Year],[Quarter],NDC)
)
Go
Drop Table If Exists [Drug Utilization]
Go
Create Table [Drug Utilization] (
    [Utilization Type] Char(4) Not Null Constraint [Utilization Type] Check ([Utilization Type] In ('FFSU','MCOU')),
    [State] Char(2) Not Null Constraint [State] Check ([State] In ('AK','AL','AR','AZ','CA','CO','CT','DC','DE','FL','GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN','MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY','XX')),
    [Labeler Code] As Left(NDC,5),
    [Product Code] As Substring(NDC,6,4),
    [Package Size] As Right(NDC,2),
    [Year] SmallInt Not Null Constraint [Year] Check ([Year]>=1991),
    Quarter TinyInt Not Null Constraint Quarter Check (Quarter Between 1 And 4),
    [Product Name] VarChar(10) Not Null,
    [Units Reimbursed] Numeric(12,3) Not Null,
    [Number of Prescriptions] Int Not Null,
    [Total Amount Reimbursed] Decimal(11,2) Not Null,
    [Medicaid Amount Reimbursed] Decimal(11,2) Not Null,
    [Non Medicaid Amount Reimbursed] As [Total Amount Reimbursed]-[Medicaid Amount Reimbursed],
    NDC Char(11) Not Null Constraint NDC Check (IsNumeric(NDC)=1),
    Constraint [PK_Drug Utilization] Primary Key ([State],NDC,[Year],[Quarter],[Utilization Type])
)
Go
Create Table [State Population] ([State] Char(2) Not Null Constraint [PK_State Population] Primary Key,
								[Population 2016] Int Not Null,
								[Population 2018] Int Not Null,
								[Population 2020] Int Not Null
								)
Go