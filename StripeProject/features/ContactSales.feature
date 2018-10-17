@ContactSales
Feature: Contact Sales
  As a user, I want to contact the stripe sales team
	
	Background:
  Given I access the stripe website
  Then the website stripe is loaded
	
  @SendContact
  Scenario: Send contact email
    When I click the "contact sales" button
    Then the page with the contact form is displayed
    When I fill out the form information
		And I click on the submit button
		Then should see the "message" of success
		
  @InvalidInformation
  Scenario Outline: Invalid information
    When I click the "contact sales" button
    Then the page with the contact form is displayed
    When I fill in the <firstname> field
    And I fill in the <lastname> field
    And I fill in the <email> field
    And I fill in the <website> field
    And I select the <country>
		And I select the <payments>
		And I fill in the <Note> field
		Then the the invalid info "icon" is displayed

    Examples: 
      | 	     firstname  	 | 			 lastname  	 | 		     email       | 			website 	  | 			country 	   | 			  payments 	     | 			note 	  |
      |  			  "!%$" 	 	   |       "Teste"     |   "Stone@gmail.com" |   "stone.com.br" | 			"Brazil" 	   |  "Less than R$50,000" | 			"te" 	  |
      |  			  "Teste" 	 	 |       "!%$"       |   "Stone@gmail.com" |   "stone.com.br" | 			"Brazil" 	   |  "Less than R$50,000" | 			"te" 	  |
      |  			  "Teste" 	 	 |       "Stone"     |        "Stone"      |   "stone.com.br" | 			"Brazil" 	   |  "Less than R$50,000" | 			"te" 	  |
      |  			  "Teste" 	 	 |       "Stone"     |   "Stone@gmail.com" |      "stone"     | 			"Brazil" 	   |  "Less than R$50,000" | 			"te" 	  |
      |  			  "Teste" 	 	 |       "Stone"     |   "Stone@gmail.com" |         ""       | 			"Brazil" 	   |  "Less than R$50,000" | 			"te" 	  |      