*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}      Firefox
${url}  http://test.evoltrader.com/

*** Test Cases ***
LoginTest
    open browser    ${url}  ${browser}
    sleep   2
    maximize browser window
    title should be  Evol Trader | Fully Automated Trading Robot
    sleep   3

    ${LOGIN}    set_variable    xpath:/html/body/div[1]/header[2]/nav/div/div[2]/ul/li[10]/a
    element should be visible   ${LOGIN}
    element should be enabled   ${LOGIN}
    click element  ${LOGIN}
    sleep   5

EnterLoginDetails
    title should be     Evol Trader | Sign in for Fully Automated Trading Robot
    ${username}     set_variable     id:id_username
    element should be visible   ${username}
    element should be enabled   ${username}
    input text  ${username}   Wrongusername212
    sleep   2
    ${PASSWORD_ENABLE}  set_variable    class:show_password
    element should be visible   ${PASSWORD_ENABLE}
    element should be enabled   ${PASSWORD_ENABLE}
    click element   ${PASSWORD_ENABLE}
    sleep   2
    ${password}   set_variable      id:id_password
    element should be visible   ${password}
    element should be enabled   ${password}
    input text  ${password}   WrongPassword213
    sleep   3
    ${submit}     set_variable    xpath:/html/body/div[2]/div/div/div/div/div/div[2]/form/div[3]/div/button
    element should be visible   ${submit}
    element should be enabled   ${submit}
    Click Element   ${submit}
    sleep   2
    input text  ${username}     Smit212
    sleep   1
    input text  ${password}     Password123
    sleep   1
    Click Element   ${submit}
    sleep   1
#    element text should be  ${username}     Shrikant212
#    element text should be  ${password}     SmitSuthar213
    input text  ${username}     Shrikant212
    sleep   1
    input text  ${password}     SmitSuthar213
    sleep   1
    click element    ${submit}
    sleep   8
#    close browser

LogoutAfterSignin
    sleep   2
    click element   css:body > div > header > div > nav > div.navbar-custom-menu.r-side > ul > li:nth-child(6) > a
    sleep   3
    ${LOGOUT}   set_variable    xpath:/html/body/div[1]/header/div/nav/div[2]/ul/li[6]/ul/li/a[2]
    element should be visible   ${LOGOUT}
    element should be enabled   ${LOGOUT}
    click element   ${LOGOUT}
    sleep   8
    close browser

