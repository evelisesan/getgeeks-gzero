*Settings*
Documentation           Login test suite

Resource        ${EXECDIR}/resources/Base.robot


Test Setup      Start Session
Test Teardown   After Test

*Test Cases*
User Login
    [Tags]      smoke

    ${user}                     Factory User    login
    
    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}


    
Incorret Pass
     [Tags]      i_pass
    ${user}         Create Dictionary       email=eve@gmail.com     password=abc123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

Incorret Not Found
    [Tags]      user_404
    ${user}         Create Dictionary       email=eve@404.com     password=abc123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

Incorret Email
    [Tags]      i_email
    ${user}         Create Dictionary       email=eve.gmail.com     password=abc123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials 
    Should Be Type Email


#Desafio 1 do ódulo PRO

#Automatizar 3 novoc casos de testes: Email obrigatório, senha obrigatória, campos obrigatórios
# Entrega: no Github

Without Email
    [Tags]      email

     ${user}         Create Dictionary       email=${EMPTY}     password=abc123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials 
    Alert Span Should Be         E-mail obrigatório


Without Pass
    [Tags]  nopass

    ${user}         Create Dictionary       email=eve@gmail.com     password=${EMPTY}

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials 
    Alert Span Should Be         senha obrigatória

Required fields Login
    [Tags]              reqfl
    @{expected_alerts}          Create List
    ...                         E-mail obrigatório
    ...                         Senha obrigatória

    Go To Login Page
    Submit Credentials 
    Alert Spans Should Be       ${expected_alerts}