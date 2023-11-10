
*** Settings ***
Library    SeleniumLibrary
Library    String

#Testaa hakutoimintoa tuotteen pääsivulta (hakusana ps5)
*** Variables ***
${keyword}    PS5

*** Test Cases ***
Search PS5
## Avataan selain.
    Open Browser    https://www.jimms.fi/
    Sleep    1
    Maximize Browser Window
    Sleep    2
## Testataan hakutoimintoa tuotteen pääsivulta (hakusana ps5).
    Click Element    id:searchinput
    Input Text    id:searchinput    ${keyword}
    Set Global Variable    ${keyword}

    Sleep    2

    Sleep    1

# Wobotti menee tuotteen tuotesivulle.
    Click Element    xpath:/html/body/header/div/div[4]/jim-quickproductsearch/div/div/div/div/div[2]/a[1]

# Wobotti tarkastaa, että on oikealla tuotesivulla ja haku täsmää joltain osin annettuun hakusanaan.
    Page Should Contain    PS5
    Should Be Equal    PS5    ${keyword}

    Sleep    2

    ## Sulje selain
    Close Browser


*** Test Cases ***
Creating a new user account.
## Avataan selain.
    Open Browser    https://www.jimms.fi/
    Sleep    1
    Maximize Browser Window
    Sleep    2
# Klikkaa kirjaudu / luo tili - namiskaa.
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a

## Tarkistetaan, että ollaan oikealla sivulla.
    Page Should Contain    Kirjaudu / Uusi asiakas

## Luodaan uusi käyttäjätili.
    Click Element    xpath:/html/body/main/div/div[1]/div/div/div/div[2]/input

    Sleep    2

## Täytetään tiedot.
    Click Element    name:EmailAddress
    Input Text    name:EmailAddress    lukeskywalker123@rebels.com

    Sleep    1

    Click Element    id:pf-Password
    Input Password    id:pf-Password    darthvadersucks667

    Click Element    id:pf-ConfirmPassword
    Input Password    id:pf-ConfirmPassword    darthvadersucks667

    Sleep    2

    Click Element    name:FirstName
    Input Text    name:FirstName    Luke

    Click Element    name:LastName
    Input Text    name:LastName    Skywalker

    Sleep    2

    Click Element    name:Address
    Input Text    name:Address    Milky Way 666

    Click Element    name:PostalCode
    Input Text    name:PostalCode    66666

    Click Element    name:City 
    Input Text    name:City    FarFarAway

    Execute Javascript    window.scroll(0,700)

    Sleep    2

    Click Element    id:pf-Phone
    Input Text    id:pf-Phone    +358500666666

    Sleep    2

    Execute Javascript    window.scrollTo(700,1017)

## Hyväksytään tietosuojaseloste.
    Select Checkbox    id:pf-GDPR

    Sleep    2

    Click Element    xpath:/html/body/main/div/div[2]/div[2]/div/div/div/form/div[9]/input

    Sleep    2

    ## Sulje selain
    Close Browser

#Kirjautuminen
*** Test Cases ***
Logging in.
## Avataan selain.
    Open Browser    https://www.jimms.fi/
    Sleep    1
    Maximize Browser Window
    Sleep    2
# Klikkaa kirjaudu / luo tili - namiskaa.
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a

## Tarkistetaan, että ollaan oikealla sivulla.
    Page Should Contain    Kirjaudu / Uusi asiakas

## Täytetään kirjautumistiedot.
    Click Element    name:UserName
    Input Text    name:UserName    lukeskywalker123@rebels.com

    Sleep    2

    Click Element    name:Password
    Input Password    name:Password    darthvadersucks667

    Sleep    2

## Kirjaudutaan sisään.
    Click Element    xpath:/html/body/main/div/div[2]/div[1]/div/div/div/form/div[4]/input

## Kirjaudutaan ulos.
    Click Element    id=navcustomerbutton

    Sleep    2

    Page Should Contain    Kirjaudu ulos

    Click Element    xpath:/html/body/main/div[1]/nav/div/a[4]

    Sleep    1

    ## Sulje selain
    Close Browser


