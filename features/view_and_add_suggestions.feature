Feature: As either of us, when coming up upto a weekend,
  to enable me to see which activity we should do,
  I want the app to suggest a set of appropriate activities
  based on weather etc

  Background:
    Given the following weather conditions exist
      | Weather |
      | Sunny   |
      | Raining |
      | Cold    |
    And the following set of activites exist
      | Activity                        | Weather |
      | Got to the Weston Super Mare    | Sunny   |
      | Visit Sea Life Center           | Raining |
      | Visit West Midlands Safari Park | Sunny   |
      | Visit Madame Tussauds           | Raining | 
      | Ride around Ladybower           | Sunny   |
      | Go hot air balooning            | Sunny   |
      | Watch The Worlds End            | Raining |
      | Try jet skiing                  | Sunny   |
      | Visit Tamworth castle           | Sunny   |
      | Visit Warwick castle            | Sunny   |
      | Attempt Edale skyline           | Sunny   |
    And I visit the homepage

  Scenario: Viewing suggestions without specifying criteria 
    Then I will be presented with 10 random suggestions 

  Scenario: Viewing suggestions based on weather criteria
    When I choose "Raining"
    Then I should see the following suggestions
      | Activity                        |
      | Visit Madame Tussauds           | 
      | Watch The Worlds End            |
      | Visit Sea Life Center           |
    And "Raining" should still be selected

  Scenario: Adding a suggestion for different weather as current criteria 
    Given I choose "Raining"
    When I add the "Sunny" suggestion "Try Go Ape"
    Then the "Try Go Ape" suggestion should be saved
    And I should see the following suggestions
      | Activity                        |
      | Visit Madame Tussauds           | 
      | Watch The Worlds End            |
      | Visit Sea Life Center           |
    And "Raining" should still be selected

  Scenario: Adding a suggestion for same weather as current criteria 
    Given I choose "Raining"
    When I add the "Raining" suggestion "Try Go Ape"
    Then the "Try Go Ape" suggestion should be saved
    And I should see the following suggestions
      | Activity                        |
      | Visit Madame Tussauds           | 
      | Watch The Worlds End            |
      | Visit Sea Life Center           |
      | Try Go Ape                      |
    And "Raining" should still be selected


  Scenario: Marking a suggestion as done
    Given I choose "Raining"
    When I mark "Visit Sea Life Center" as done
    Then "Visit Sea Life Center" should be marked as done
    And I should see the following suggestions
      | Activity                        |
      | Visit Madame Tussauds           | 
      | Watch The Worlds End            |
