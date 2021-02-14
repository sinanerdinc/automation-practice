*** Settings ***
Resource  ../Resources/app/httpApp.robot

*** Test Cases ***
verify http statuses
    httpApp.get "http://generator.swagger.io/api/swagger.json" verify http status is "200"
    #httpApp.get "http://generator.swagger.io/api/swagger.json" verify http status is "404"
    httpApp.get "https://www.sinanerdinc.com/hepsiburada" verify http status is "404"


