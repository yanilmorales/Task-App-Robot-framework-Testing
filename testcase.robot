*** Settings ***
Library    Selenium2Library
Library    ScreenCapLibrary


*** Variables ***

${textotitulo}    tituloEditado
${descripcion}    descEditada

*** Test Cases ***

Registrar tarea

    Open Browser    https://apptareas.herokuapp.com/create    chrome
    Start Video Recording    alias=None    name=DemoRecording    fps=none    size_percentage=1    embed=True    embed_width=100px    monitor=1   
    Maximize Browser Window
    Sleep    1s
    Input Text    name=title    ${textotitulo}
    Input Text    name=description    ${descripcion} 
    Sleep    1s
    Submit Form    class=mt-4
    Sleep    1s
    Stop Video Recording    alias=None
    Close All Browsers


