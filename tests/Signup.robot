*Settings*
Documentation           Signup Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Register a new user
     [Tags]      ok
    
    ${user}                     Factory User

    Set Suite Variable          ${user}

    Go To Signup Form
    Fill Signup Form            ${user}
    Submit Signup Form
    User Should Be Registered     

Duplicate user
    [Tags]      nok

    ${user}                     Factory User
    Add User From Database      ${user}

    Go To Signup Form
    Fill Signup Form            ${user}
    Submit Signup Form
    Modal Content Should Be     Já temos um usuário com o e-mail informado. 

Wrong email
    [Tags]      attempt_signup

    ${user}     Factory Wrong Email

    Go To Signup Form
    Fill Signup Form            ${user}
    Submit Signup Form
    Alert Span Should Be        O email está estranho

Required Fields
    [Tags]              reqf
    @{expected_alerts}          Create List
    ...                         Cadê o seu nome?
    ...                         E o sobrenome?
    ...                         O email é importante também!
    ...                         Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be       ${expected_alerts}

Short Password
    [Tags]              short
    [Template]          Signup With Short Pass

    1
    12
    123
    1234
    12345
    a
    a2
    ab3
    a23bc
    -1
    acb#1


*Keywords*
Signup With Short Pass
    [Arguments]     ${short_pass}


    ${user}        Create Dictionary
    ...            name=Eve                     lastname=Santos
    ...            email=evesantos@gmail.com    password=123

    Go To Signup Form
    Fill Signup Form            ${user}
    Submit Signup Form
    Alert Span Should Be        Informe uma senha com pelo menos 6 caracteres


