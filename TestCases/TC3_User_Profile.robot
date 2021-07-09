*** Settings ***
Documentation    Test Case for User Profile
Library  SeleniumLibrary

*** Variables ***
${browser}      Firefox
${url}  http://test.evoltrader.com/


*** Test Cases ***
NavigateToLogin
    open browser    ${url}  ${browser}
    sleep   2
    maximize browser window
    sleep   3
    ${LOGIN}    set_variable    xpath:/html/body/div[1]/header[2]/nav/div/div[2]/ul/li[10]/a
    element should be visible   ${LOGIN}
    element should be enabled   ${LOGIN}
    click element  ${LOGIN}
    sleep   2
    # Now enter details
    ${username}     set_variable     id:id_username
    element should be visible   ${username}
    element should be enabled   ${username}
    input text  ${username}   Shrikant212
    sleep   2
    ${password}   set_variable      id:id_password
    element should be visible   ${password}
    element should be enabled   ${password}
    input text  ${password}   SmitSuthar213
    sleep   2
    ${submit}     set_variable    xpath:/html/body/div[2]/div/div/div/div/div/div[2]/form/div[3]/div/button
    element should be visible   ${submit}
    element should be enabled   ${submit}
    Click Element   ${submit}
    sleep   3

GoToUserProfile
    sleep   2
    Click Element   css:body > div > header > div > nav > div.navbar-custom-menu.r-side > ul > li:nth-child(6) > a
    sleep   1
    ${Profile}      set_variable    xpath:/html/body/div[1]/header/div/nav/div[2]/ul/li[6]/ul/li/a[1]
    element should be visible   ${Profile}
    element should be enabled   ${Profile}
    Click Element   ${Profile}
    sleep   3
    execute javascript      window.scrollTo(0, document.body.scrollHeight)
    sleep   2
    execute javascript      window.scrollTo(0, -document.body.scrollHeight)
    sleep   2

ChangeUserSettings
    execute javascript      window.scrollTo(0, document.body.scrollHeight)
    sleep   2
    ${PSD-UPDATE}   set_variable    class:change_user_password
    element should be visible   ${PSD-UPDATE}
    element should be enabled   ${PSD-UPDATE}
    Click Element   ${PSD-UPDATE}
    sleep   2
    execute javascript      window.scrollTo(0, -document.body.scrollHeight)
    sleep   2
    ${FNAME}    set_variable    name:first_name
    element should be visible   ${FNAME}
    element should be enabled   ${FNAME}
    Clear Element Text  ${FNAME}
    input text  ${FNAME}    Smit12
    sleep   1
    ${MDNAME}    set_variable    name:middle_name
    element should be visible   ${MDNAME}
    element should be enabled   ${MDNAME}
    Clear Element Text  ${MDNAME}
    input text  ${MDNAME}    Anilbhai
    sleep   1
    ${LNAME}    set_variable    name:last_name
    element should be visible   ${LNAME}
    element should be enabled   ${LNAME}
    Clear Element Text  ${LNAME}
    input text  ${LNAME}    Suthar
    sleep   1
    ${Gender}    set_variable    name:gender
    element should be visible   ${Gender}
    element should be enabled   ${Gender}
    Click Element   ${Gender}
    sleep   1
    Click Element   xpath://*[@id="user-profile-update-form"]/div[1]/div[5]/div/select/option[1]
#    Select From List By Value   ${Gender}   Male
    sleep   1
    ${EMAIL}    set_variable    name:email
    @{WrongChars}       Create List     $$      $%      %^      ^*
    FOR     ${CHAR}     IN      @{WrongChars}
        input text      ${EMAIL}    smit.suthar${CHAR}gmail.com
        sleep   2
        Clear Element Text  ${EMAIL}
        Log     ${CHAR}
    END
    element should be visible   ${EMAIL}
    element should be enabled   ${EMAIL}
    input text      ${EMAIL}     smit.technobits@gmail.com
    sleep   1
    ${COUNTRY}      set_variable    id:id_select_country
    element should be visible   ${COUNTRY}
    element should be enabled   ${COUNTRY}
    Click Element   ${COUNTRY}
    Click Element   xpath://*[@id="id_select_country"]/option[1]
#    Select From List By Value   ${COUNTRY}   India
    sleep   1
    ${TIMEZONE}     set_variable    name:timezone_id
    element should be visible   ${TIMEZONE}
    element should be enabled   ${TIMEZONE}
    Click Element   ${TIMEZONE}
    Click Element   xpath://*[@id="id_time_zone_machine"]/option[2]
#    Select From List By Value   ${TIMEZONE}   Asia/Kolkata
    sleep   1
    ${Mobile}       set_variable    class:id_phone_number
    element should be visible   ${Mobile}
    element should be enabled   ${Mobile}
    Clear Element Text      ${Mobile}
    sleep   1
    ${Submit}       set_variable    css:#user-profile-update-form > div.form-group.row > div > button
    element should be visible   ${Mobile}
    element should be enabled   ${Mobile}
    Click Element   ${Submit}
    sleep   2
    Click Element   ${Mobile}
    sleep   1
    input text      ${Mobile}    8320506797
    sleep   1
    Click Element   ${Submit}
    sleep   10
    ${Confirm}      set_variable    class:confirm
    element should be visible   ${Confirm}
    element should be enabled   ${Confirm}
    Click Element   ${Confirm}
    sleep   2

ManagePasswordSettings
    execute javascript      window.scrollTo(0, document.body.scrollHeight)
    sleep   2
    ${CurPSD}       set_variable    name:old_password
    element should be visible   ${CurPSD}
    element should be enabled   ${CurPSD}
    input text      ${CurPSD}       IncorrectPassword
    sleep   1
    ${NewPSD}       set_variable    name:new_password1
    @{WRGPSD1}      Create List     smit    smi     sm
    FOR     ${PSD1}     IN      @{WRGPSD1}
        input text      ${NewPSD}   ${PSD1}
        sleep   2
        Clear Element Text  ${NewPSD}
    END
    sleep   1
    element should be visible   ${NewPSD}
    element should be enabled   ${NewPSD}
    input text      ${NewPSD}   SmitSuthar213
    sleep   1
    ${RetypePSD}       set_variable    name:new_password2
    @{WRGPSD2}      Create List     Smit123    SutharSmit123     SMit13!#$@     Suthar2312
    FOR     ${PSD2}     IN      @{WRGPSD2}
        input text      ${RetypePSD}   ${PSD2}
        sleep   2
        Clear Element Text  ${RetypePSD}
    END
    sleep   1
    element should be visible   ${RetypePSD}
    element should be enabled   ${RetypePSD}
    input text      ${RetypePSD}   SmitSuthar213
    sleep   2
    ${PSD-UPDATE}   set_variable    class:change_user_password
    element should be visible   ${PSD-UPDATE}
    element should be enabled   ${PSD-UPDATE}
    Click Element   ${PSD-UPDATE}
    sleep   3
    #change current password due to incorrect match
    Click Element   ${CurPSD}
    Clear Element Text      ${CurPSD}
    input text      ${CurPSD}       SmitSuthar213
    sleep   2
    Click Element   ${PSD-UPDATE}
    sleep   3
    ${Confirm}      set_variable    class:confirm
    element should be visible   ${Confirm}
    element should be enabled   ${Confirm}
    Click Element   ${Confirm}
    sleep   10
    close browser





