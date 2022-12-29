*** Settings ***
Library    Selenium2Library
Library    ScreenCapLibrary
Library    xmlReader.py

*** Keywords ***

Leer username
    ${txtUser}=    Leer Xml User
    [return]    ${txtUser}

Leer password
    ${txtPass}=    Leer Xml Pass
    [return]    ${txtPass}

Log my username
    ${txtUser}=    Leer username 
    Input Text    name=txtUserName    ${txtUser}    
    Sleep    1s

Log my password    
    ${txtPass}=    Leer password
    Input Text    name=txtUserPassword    ${txtPass}
    Sleep    1s

Login              Click Button    name=linLogin
    Sleep    1s

Login Succesful      Page Should Contain    Identificador:   
    Sleep    1s

Abrir Navegador
     Open Browser    https://almacc.tustributos.com    chrome
     Maximize Browser Window

lOGEARSE
    Log my username  
    Log my password
    Login
    Login Succesful

Crear Sujeto Pasivo
    Page Should Contain    Identificador:
    Input Text       id=textSearchId    textoPrueba


*** Variables ***

${txtUser1}    gamayatx
${txtPas11s}    Agas1234

*** Test Cases ***


Creacion de sujeto pasivo
    [Documentation]    Creación de sujeto pasivo natural
    Abrir Navegador
    Start Video Recording    alias=None    name=Iniciar Sesión   fps=none    size_percentage=1    embed=True    embed_width=100px    monitor=1   
    [Tags]    Sujeto pasivo, trámite
    lOGEARSE
    Crear Sujeto Pasivo
    Stop Video Recording    alias=None
    Close All Browsers



