Feature: Test Recipes

  Background:
    * url 'https://api.spoonacular.com/recipes'
    * def apiKey = '25c4549b7dc54116be3f415e4228c134'
    * def username = "ratikasubarza0"
    * def ingredient_id = '65842'
    * def taste_id = '69095'
    * def equipment_id = '1003464'
    * def price_breakdown = '1003464'
    * def nutrition_id = '1003464'
    * def hash = '2fdcbb4877d272745ceecc1a8d233451debd6690'
    * def starDate = '2024-03-31'


  Scenario: Verify search recipes by query
    Given path complexSearch, 'query'
    And param apiKey = apiKey
    And param  searchParam = searchParam
    When method get
    Then status 200
    And match response == read ('classpath:TestSuite/Recipes/search-recipes-schema.json')


  Scenario:   Get ingredients by ID
    Given path ingredient_id, 'ingredientWidget.json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print 'Response:', response

  Scenario:   Get taste by ID
    Given path taste_id, 'tasteWidget.json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print 'Response:', response

  Scenario:   Get equipment by ID
    Given path equipment_id, 'equipmentWidget.json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print 'Response:', response

  Scenario:   Get nutrition by ID
    Given path nutrition_id, 'nutritionWidget.json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print 'Response:', response

  Scenario:   Get price breakdown by ID
    Given path price_breakdown, 'ingredientWidget.json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print 'Response:', response