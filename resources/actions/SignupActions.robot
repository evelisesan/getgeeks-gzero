*Settings*
Documentation		Signup actions

*Keywords*
Go To Signup Form
	Go To		${BASE_URL}/signup
	Wait For Elements State  css=.signup-form 	visible		5

Fill Signup Form
	[Arguments]		${user}
	
	Fill Text		id=name			${user}[name]
	Fill Text		id=lastname		${user}[lastname]
	Fill Text		id=email		${user}[email]
	Fill Text		id=password		${user}[password]
		
Submit Signup Form	
	Click			css=.submit-button >> text=Cadastrar
	
User Should Be Registered

	${expected_text}		Set Variable	css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
	
	# Wait For Elements State		css=h1 >> text=Parabéns!	visible		5
	Wait For Elements State		${expected_text}	visible		5



	FOR		${span}		IN		@{spans}
		${text}				Get Text		${span}
		Append To List		${got_alerts}	${text}
	END

	Lists Should Be Equal		${expected_alerts}		${got_alerts}