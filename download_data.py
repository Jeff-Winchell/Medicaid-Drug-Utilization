import requests
with open('Data_2020.csv','wt',encoding='cp1252') as output:
    response=requests.get('https://data.medicaid.gov/api/views/va5y-jhsv/rows.csv?accessType=DOWNLOAD')
    response.encoding='cp1252'
    output.write(response.text)
with open('Data_2018.csv','wt',encoding='cp1252') as output:
    response=requests.get('https://data.medicaid.gov/api/views/e5ds-i36p/rows.csv?accessType=DOWNLOAD')
    response.encoding='cp1252'
    output.write(response.text)
with open('Data_2016.csv','wt',encoding='cp1252') as output:
    response=requests.get('https://data.medicaid.gov/api/views/tk4g-em8j/rows.csv?accessType=DOWNLOAD')
    response.encoding='cp1252'
    output.write(response.text)
