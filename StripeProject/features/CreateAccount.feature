@CreateAccount
Feature: Create account
 	As a user, I want to create a new account on Stripe's website

	Background:
    Given I access the stripe website
    Then the website stripe is loaded

  @NewAccount
  Scenario: New account
    When I click the "create account" button
    Then the registration page is displayed
    When I fill the user information
		And I click on the submit account
		Then I should see the "dashboard"
		
  @InvalidInformation
  Scenario Outline: Invalid information
    When I click the create account button
    Then the registration page is displayed
    When I fill in the <email> field
    And I fill in the <fullname> field
    And I fill in the <password> field
    And I fill in the <confirmpassword> field
		And I click on the submit account
		Then the invalid info "message" is displayed

    Examples: 
      | 				email  			 | 			fullname  	 | 		 password   |  confirmpassword  |
      |  			 "ekoaro" 	 	 |     "Teste Novo"  |   "Stone@Pag1" |    "Stone@Pag1"   |
			| "teste100@gmail.com" |   				""  		 |   "Stone@Pag2" |    "Stone@Pag2"   |
			| "teste100@gmail.com" |   	"$%¨#@ @$%@"   |   "Stone@Pag2" |    "Stone@Pag2"   |
			| "teste200@gmail.com" |   		 "Teste"  	 |   "Stone@Pag2" |    "Stone@Pag2"   |
	    | "teste300@gmail.com" |   	 "Stone Novo"	 |   	    "" 			|    "Stone@Pag2"   |
	    | "teste400@gmail.com" |   	 "Stone Teste" |   "Stone@Pag3" |    "Stone@P12"    |	    
	    | "teste500@gmail.com" |   	 "Stone Novo"	 |   "Stone@Pag3" |    			""   			|