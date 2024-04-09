Feature:

  Background:
    * url = 'http://dataservice.accuweather.com/location'
    * def apiKey = 'VACwICTgIRqZI2MyNk4htqUAZkJVda86'
    * def invalidKey = 'VACwICTgIRqZI2MyNk4htqUAZkJVda8'
    * def country_code = 'US'

  Scenario: Verify API Response get Admin Area List by country_code = US

    Given path 'v1/adminareas/{country_code}'
    And param apiKey = apiKey
    When method get
    Then response.status == 200
    And print 'Response :', response'

  Scenario: Verify API response get Admin Area List by coutry_code {US} and invalid apiKey

    Given path 'v1/adminareas/{country_code}'
    And param invalidKey = invalidKey
    When method get
    Then response.status = 400
    And match response.message == 'Api Authorization failed'



