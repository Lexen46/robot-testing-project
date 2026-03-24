*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}      file:///C:/Users/AuerbachL/OneDrive%20-%20Markant%20Services%20International%20GmbH/Dokumente/robot_package/swag_labs.html
${BROWSER}  Chrome


*** Test Cases ***
Purchase Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Input Text      id=username    standard_user
    Input Text      id=password    secret_sauce
    Wait Until Element Is Enabled    id=login-button    2s
    Click Button    id=login-button
    Wait Until Element Is Visible    id=products-grid    10s

    Wait Until Element Is Visible    xpath=(//button[text()='Add to Cart'])[1]    3s
    Click Button    xpath=(//button[text()='Add to Cart'])[1]
    Wait Until Element Is Visible    xpath=(//button[text()='Add to Cart'])[2]    3s
    Click Button    xpath=(//button[text()='Add to Cart'])[2]
    Wait Until Element Is Visible    xpath=(//button[text()='Add to Cart'])[3]    3s
    Click Button    xpath=(//button[text()='Add to Cart'])[3]

    Click Element    xpath=//div[@class='cart-icon']
    Wait Until Element Is Visible    id=checkout-page    5s

    Click Button    xpath=(//button[text()='Remove'])[1]
    Input Text        id=first-name    Max
    Input Text        id=last-name     Mustermann
    Input Text        id=postal-code   12345
    Click Button      xpath=//button[text()='Complete Purchase']

    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Thank You For Your Order')]    10s

    [Teardown]    Close Browser