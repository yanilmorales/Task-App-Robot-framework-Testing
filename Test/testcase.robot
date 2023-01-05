*** Settings ***
Library    Selenium2Library
Library    ScreenCapLibrary
Library    JIRALibrary
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


Ir a trámites predeterminados
    ${tempb}=    Get Title
    Log To Console    New windows is: \ ${tempb}
    Select Frame    name=fastway
    Wait Until Element Is Visible    name=textSearchId
    Click Element    name=buttonProceeding
    Sleep     1s


Ingresar al trámite de sujeto pasivo
    ${tempb}=    Get Title
    Unselect Frame
    Log To Console    New windows is: \ ${tempb}
    Select Frame        name=rise_content
    Wait Until Element Is Visible    id=dgTypeProceeding_dvClick_85
    Click Element   id=dgTypeProceeding_dvClick_85
    Sleep     1s

Validación de creación de Trámite con campos requeridos vacíos
    Unselect Frame
    Select Frame    name=rise_content
    Sleep     1s
    Click Element        name=ibtnCreateProceeding
    Sleep     2s
    Handle Alert    ACCEPT    timeout=3s   

    


*** Variables ***
${URL}      https://jira.com
${USER}     ARI CC Testing
${PASS}     ACT

*** Test Cases ***

Creacion de sujeto pasivo
    [Documentation]    Creación de sujeto pasivo natural
    Abrir Navegador
    Iniciar Grabacion
    [Tags]    Sujeto pasivo, trámite
    Iniciar sesion
    Ir a trámites predeterminados
    Sleep    1s
    Ingresar al trámite de sujeto pasivo
    Sleep     1s
    Validación de creación de Trámite con campos requeridos vacíos
    Detener Grabacion
    Close All Browsers



