*** Settings ***
Library    Selenium2Library
Library    ScreenCapLibrary
Library    ../xmlReader.py

*** Keywords ***

Abrir Navegador
     Open Browser    https://almacc.tustributos.com    chrome
     Maximize Browser Window

Iniciar Grabacion
        Start Video Recording    alias=None    name=Iniciar Sesión   fps=none    size_percentage=1    embed=True    embed_width=100px    monitor=1   

Detener Grabacion
    Stop Video Recording    alias=none

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

Iniciar sesion
    Log my username  
    Log my password
    Login
    Login Succesful


Crear Sujeto Pasivo
    ${tempb}=    Get Title
    Log To Console    New windows is: \ ${tempb}
    Select Frame    name=fastway
    Wait Until Element Is Visible    name=textSearchId
    Input Text       name=textSearchId    0842207680000K
    Sleep     1s
    Click Element    name=buttonSearch
    Sleep     1s


*** Variables ***

${txtUser1}    gamayatx
${txtPas11s}    Agas1234

*** Test Cases ***

Creacion de sujeto pasivo
    [Documentation]    Creación de sujeto pasivo natural
    Abrir Navegador
    Iniciar Grabacion
    [Tags]    Sujeto pasivo, trámite
    Iniciar sesion
    Crear Sujeto Pasivo
    Detener Grabacion
    Close All Browsers


