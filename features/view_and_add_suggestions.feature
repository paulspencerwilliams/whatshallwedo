Feature: As either of us, when coming up upto a weekend,
  to enable me to see which activity we should do,
  I want the app to suggest a set of appropriate activities
  based on weather etc

  Background:
    Given the following set of activites exist
      | Activity                        | Weather |
      | Got to the Weston Super Mare    | Sunny   |
      | Visit Sea Life Center           | Raining |
      | Visit West Midlands Safari Park | Sunny   |
      | Visit Madame Tussauds           | Raining | 
      | Ride around Ladybower           | Sunny   |
      | Go hot air balooning            | Sunny   |
      | Watch The Worlds End            | Rainy   |
      | Try jet skiing                  | Sunny   |
      | Visit Tamworth castle           | Sunny   |
      | Visit Warwick castle            | Sunny   |
      | Attempt Edale skyline           | Sunny   |
    And I visit the homepage

  Scenario: Viewing suggestions without specifying criteria 
    Then I will be presented with 10 random suggestions 
