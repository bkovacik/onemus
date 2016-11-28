Feature: Log in
  In order to access parts of the site
  As a user
  I want to log in

  Scenario: Logged Out
    Given I have a user called User with a password Password
    When I log in as User with a password Password
    Then I should be welcomed as User
    
  Scenario: Logged In
    Given I have a user called User with a password Password
    When I log in as User with a password Password
    Then I should be welcomed as User

  Scenario: Logged In On Different User
    Given I have a user called User with a password Password
    And I have a user called User2 with a password Password
    And I am logged in as User2 
    When I log in as User with a password Password
    Then I should be welcomed as User

  Scenario: Logged In With Wrong Password
    Given I have a user called User with a password Password
    When I log in as User with a password WrongPassword
    Then I should be redirected to login
