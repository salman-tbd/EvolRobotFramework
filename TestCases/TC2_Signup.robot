*** Settings ***
Documentation    Test case for Signup
Library  SeleniumLibrary

*** Variables ***
${browser}      Firefox
${url}  http://test.evoltrader.com/

*** Test Cases ***
GotoSignupPage
    open browser    ${url}  ${browser}
    sleep   2
    maximize browser window
    sleep   3
    ${SIGNUP}   set_variable    xpath:/html/body/div[1]/header[2]/nav/div/div[2]/ul/li[9]/a/div
    element should be visible   ${SIGNUP}
    element should be enabled   ${SIGNUP}
    click element   ${SIGNUP}
    sleep   8

SignupAccount
    #now we are performing validations
    ${Username}     set_variable    name:username
    @{WrongUserInputs}      Create List    salman--    salman/;122e    salman[]42   salman`#    Shrik(324e3  S@LM#N    K*njal$$
    FOR     ${Input}    IN      @{WrongUserInputs}
        input text      ${Username}     ${Input}
        sleep   2
        Clear Element Text      ${Username}
        Log     ${Input}
    END
    element should be visible   ${Username}
    element should be enabled   ${Username}
    input text      ${Username}     SPahadiNewUpdate
    sleep   2
    ${EMAIL}    set_variable    name:email
    @{WrongChars}       Create List     $$      $%      %^      ^*
    FOR     ${CHAR}     IN      @{WrongChars}
        input text      ${EMAIL}    salman.migratezone${CHAR}gmail.com
        sleep   2
        Clear Element Text  ${EMAIL}
        Log     ${CHAR}
    END
    element should be visible   ${EMAIL}
    element should be enabled   ${EMAIL}
    input text      ${EMAIL}     salman.migratezone@gmail.com
    sleep   4
    ${Psd_Enabled}  set_variable    class:show_password
    element should be visible   ${Psd_Enabled}
    element should be enabled   ${Psd_Enabled}
    Click Element   ${Psd_Enabled}
    sleep   2
    ${PSD}     set_variable    name:password1
    @{WrongPasswords}   Create List     salman      SALMANPAHADINEW     salman1234      3183290
    FOR     ${WrongPsd}     IN      @{WrongPasswords}
        input text      ${PSD}      ${WrongPsd}
        sleep       2
        Clear Element Text      ${PSD}
        Log     ${WrongPsd}
    END
    element should be visible   ${PSD}
    element should be enabled   ${PSD}
    input text      ${PSD}     SalmanPahadiNew@123
    ${PSD_ENABLED2}     set_variable    xpath:/html/body/div[2]/div/div/div/div/div/div[2]/form/div[4]/div[1]/i
    element should be visible       ${PSD_ENABLED2}
    element should be enabled       ${PSD_ENABLED2}
    Click Element       ${PSD_ENABLED2}
    sleep   1
    ${PSDRETYPE}   set_variable    name:password2
    @{WrongMatches}   Create List     salmannew      newPasswordSalman     SALMAN213      PahadiSalman@213
    FOR     ${WrongPsd}     IN      @{WrongMatches}
        input text      ${PSDRETYPE}      ${WrongPsd}
        sleep       2
        Clear Element Text      ${PSDRETYPE}
        Log     ${WrongPsd}
    END
    element should be visible   ${PSDRETYPE}
    element should be enabled   ${PSDRETYPE}
    input text      ${PSDRETYPE}    SalmanPahadiNew@123
    ${REFCODE}      set_variable    name:refered_by_code
    @{WrongCodes}   Create List     TestCode123     Kinjal123       Salman05
    FOR     ${Code}     IN      @{WrongCodes}
        input text      ${REFCODE}      ${Code}
        sleep       2
        Clear Element Text      ${REFCODE}
        Log     ${Code}
    END
    element should be visible   ${REFCODE}
    element should be enabled   ${REFCODE}
    input text  ${REFCODE}      somecode123
    ${SIGNUP}   set_variable    xpath:/html/body/div[2]/div/div/div/div/div/div[2]/form/div[6]/div[2]/button
    element should be visible   ${SIGNUP}
    element should be enabled   ${SIGNUP}
    Click Element     ${SIGNUP}
    sleep   5
    Clear Element Text      ${REFCODE}
    input text      ${REFCODE}      sagar07
    ${TERM}     set_variable    xpath:/html/body/div[2]/div/div/div/div/div/div[2]/form/div[6]/div[1]/div/div/fieldset/label
    Click Element   ${TERM}
    sleep   2
    Click Element     ${SIGNUP}
    sleep   12
    close browser
