*Settings*
Documentation           BeGeek test Suit

Resource        ${EXECDIR}/resources/Base.robot


Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*

Be a Geek

    ${user}     Factory User Be Geek

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}
