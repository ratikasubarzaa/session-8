Feature: Test meal plan

  Background:
    * url 'https://api.spoonacular.com/mealplanner'
    * def apiKey = '25c4549b7dc54116be3f415e4228c134'
    * def username = "ratikasubarza0"
    * def hash = '2fdcbb4877d272745ceecc1a8d233451debd6690'
    * def starDate = '2024-03-31'

  Scenario: test generate meal plan
    Given path 'generate'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response :', response

  Scenario: test add to meal plan
    Given path username, 'items'
    And param apiKey = apiKey
    And header Content-Type = 'application/json'
    And param hash = hash
    And request
    """
    {
    "date": 1589500800,
    "slot": 1,
    "position": 0,
    "type": "INGREDIENTS",
    "value": {
        "ingredients": [
            {
                "name": "1 banana"
            }
        ]
      }
    }
    """
    When method post
    Then status 200
    And match response.status == 'success'

    Scenario: Test Meal Plan by Week
      Given path username,'week',starDate
      And param apiKey = apiKey
      And param hash = hash
      When method get
      Then status 200
      And print 'Response:', response

  Scenario: Delete from Meal Plan
    Given path username,'items','25627584'
    And param apiKey = apiKey
    And param hash = hash
    When method delete
    Then status 200
    And match response.status == 'success'