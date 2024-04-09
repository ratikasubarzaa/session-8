Feature: Test Misc Plan

  Background:
    * url 'https://api.spoonacular.com/food/'
    * def apiKey = '6686dd16d9484d769565cf2c81657d92'
    * def username = 'brendamelly'
    * def hash = '4ecff4eaeaa41935467f4a6bd7ddb456ff1eb061'

  Scenario: Random Food Joke
    Given path 'jokes/random'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'response: ', response

  Scenario: Detect food in text
    Given path 'detect'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param apiKey = apiKey
    And param text = 'Irvan like to eat meatballs everyday'
    When method post
    Then status 200
    And print 'response: ', response

  Scenario: Image analysis by url
    Given path 'images/analyze'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://pngtree.com/freepng/healthy-green-broccoli_6310446.html'
    When method get
    Then status 200
    And print 'response: ', response