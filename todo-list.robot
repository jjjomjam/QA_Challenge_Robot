*** Settings ***
Library     Selenium2Library
Library     BuiltIn

*** Variables ***
${URL}              https://abhigyank.github.io/To-Do-List/
${Browser}          Firefox
${​​​​​​​​Delay}            1
${Title_Page}       TO DO LIST
${Head_Titel}       //h1[text()='To Do List']
${Add_Tab}          //a[@href="#add-item"]
${Input_NameTask}   id=new-task
${Button_Add}       //button/i[text()='add']
${Todo_Task1}       myjobs1
${Todo_Task2}       myjobs2
${Todo_Task3}       myjobs3
${Todo_Tab}         //a[@href="#todo"]
${Todo}    //label[1]/span[1]
${Complete_Tab}     //a[@href="#completed"]
${complete1}    //li[1]/span
${complete2}    //li[2]/span
${Del_TodoTab}     //li[1]/button
${Del_CompTab}    //li[2]/button


*** Keywords ***
action task1
    Input Text          ${Input_NameTask}       myjobs1
    Click Element       ${Button_Add}
    Click Element       ${Todo_Tab}
    Set Selenium Speed      ${​​​​​​​​Delay}
    ${TodoList}     Get Text        ${Todo}
    Should Be Equal     ${TodoList}     ${Todo_Task1}
    Log To Console      ${TodoList}
    Click Element       ${Todo}
    Click Element       ${Complete_Tab}
    Set Selenium Speed      ${​​​​​​​​Delay}
    ${CompList}     Get Text        ${complete1}
    Should Be Equal     ${CompList}     ${Todo_Task1}
    Log To Console      ${CompList}
    
action task2
    Click Element       ${Add_Tab}
    Input Text          ${Input_NameTask}       myjobs2
    Click Element       ${Button_Add}
    Click Element       ${Todo_Tab}
    Set Selenium Speed      ${​​​​​​​​Delay}
    ${TodoList}     Get Text        ${Todo}
    Should Be Equal     ${TodoList}     ${Todo_Task2}
    Log To Console      ${TodoList}
    Click Element       ${Del_TodoTab}

action task3
    Click Element       ${Add_Tab}
    Input Text          ${Input_NameTask}       myjobs3
    Click Element       ${Button_Add}
    Click Element       ${Todo_Tab}
    Set Selenium Speed      ${​​​​​​​​Delay}
    ${TodoList}     Get Text        ${Todo}
    Should Be Equal     ${TodoList}     ${Todo_Task3}
    Log To Console      ${TodoList}
    Click Element       ${Todo}
    Click Element       ${Complete_Tab}
    Set Selenium Speed      ${​​​​​​​​Delay}
    Click Element       ${Del_CompTab}
    #close broser

*** Test Cases ***
Open Web
    Open Browser        ${URL}      ${Browser}
    Maximize Browser Window
    ${ToDoList}     Get Text        ${Head_Titel}
    Should Be Equal     ${ToDoList}     ${Title_Page}
    Log To Console      ${ToDoList}

add tasks to completed
    action task1

delete task on to-do tab
    action task2

delete task on completed tab
    action task3