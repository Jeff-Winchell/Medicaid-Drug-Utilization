Bulk Insert Medicaid.dbo.Labeler From 'C:\Code\Medicaid\NDC_NHRIC_Labeler_Codes_07_19_2021.csv' With (Format='CSV',MaxErrors=3000,DataFileType='char',FirstRow=2,FieldTerminator=',')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='00386')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('00386','Gebauer')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='08881')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('08881','Cardinal')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='14550')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('14550','Actavis/Teva')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='24486')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('24486','Aristos Phamaceuticals, Inc.')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='42037')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('42037','Medtech USA')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='63807')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('63807','Excelsior Medical')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='64875')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('64875','Danco Laboratories')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='67767')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('67767','Actavis Inc')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='76325')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('76325','Hyperion Therapeutics, Inc.')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='00274')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('00274','Randob Labs, Ltd.')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='00766')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('00766','GlaxoSmithKline Healthcare')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='11845')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('11845','Mason')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='50962')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('50962','Actavis Mid Atlantic')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='52297')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('52297','Perrigo')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='52569')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('52569','Generamed, Inc.')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='60569')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('60569','Advanced Vision Research')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='67211')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('67211','Celegene Corporation')
If Not Exists(Select * From Medicaid.dbo.Labeler Where Code='00070')
	Insert Into Medicaid.dbo.Labeler (Code,Firm) Values ('00070','Unknown, 00070')

	

Set DateFormat MDY
Bulk Insert Medicaid.dbo.[Raw Drug Utilization] From 'C:\Code\Medicaid\Data_2020.csv' With (Format='CSV',MaxErrors=3,DataFileType='char',FirstRow=2,FieldTerminator = ',')
Bulk Insert Medicaid.dbo.[Raw Drug Utilization] From 'C:\Code\Medicaid\Data_2018.csv' With (Format='CSV',MaxErrors=3,DataFileType='char',FirstRow=2,FieldTerminator = ',')
Bulk Insert Medicaid.dbo.[Raw Drug Utilization] From 'C:\Code\Medicaid\Data_2016.csv' With (Format='CSV',MaxErrors=3,DataFileType='char',FirstRow=2,FieldTerminator = ',')
Insert Into [Drug Utilization] ([Utilization Type],[State],[Year],[Quarter],[Product Name],[Units Reimbursed],[Number of Prescriptions],[Total Amount Reimbursed],[Medicaid Amount Reimbursed],NDC)
	Select [Utilization Type],[State],[Year],[Quarter],Left([Product Name],10),[Units Reimbursed],[Number of Prescriptions],[Total Amount Reimbursed],[Medicaid Amount Reimbursed],NDC
		From [Raw Drug Utilization]
		Where [Suppression Used]='false'
Bulk Insert Medicaid.dbo.[State Population] From 'C:\Code\Medicaid\State_Population.csv' With (Format='CSV',MaxErrors=3,DataFileType='char',FirstRow=2,FieldTerminator = ',')
