Feature:

  Background:
    * def urlBase = 'http://dataservice.accuweather.com/location'
    * def apiKey = 'VACwICTgIRqZI2MyNk4htqUAZkJVda86'
    * def invalidKey = 'VACwICTgIRqZI2MyNk4htqUAZkJVda8'
    * def region_code = 'EUR'

  Scenario: Verify API Response get Admin Area List by region_code

    Given path '/v1/countries/{region_code}'
    And param apiKey = apiKey
    When method get
    Then response.status == 200
    And print 'Response :', response'

  Scenario: Verify API response get Admin Area List by region_code and invalid apiKey

    Given path 'v1/adminareas/{region_code}'
    And param invalidKey = invalidKey
    When method get
    Then response.status = 400
    And match response.message == 'Api Authorization failed'



