*** Settings ***
Library    Selenium2Library
Library    ScreenCapLibrary


*** Variables ***

${textotitulo}    gamayatx
${descripcion}    Agas1234

*** Test Cases ***

Registrar tarea

    Open Browser    https://almacc.tustributos.com/    chrome
    Start Video Recording    alias=None    name=Iniciar Sesión   fps=none    size_percentage=1    embed=True    embed_width=100px    monitor=1   
    Maximize Browser Window
    Sleep    1s
    Input Text    name=txtUserName    ${textotitulo}
    Input Text    name=txtUserPassword   ${descripcion} 
    Sleep    1s
    Click Button   name=linLogin
    
    Stop Video Recording    alias=None
    Close All Browsers

