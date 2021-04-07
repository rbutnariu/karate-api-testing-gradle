Feature: Create and Read persons ...

  Background:
    * url baseUrl
    * def personBase = '/api/person/'

  Scenario: Create a person

    Given path personBase
    And request { "firstName": "Jowhn", "lastName": "Doe", "age": 30 }
    And header Accept = 'application/json'
    When method post
    Then status 200
    And match response == '11'

  Scenario: Get person we just created

    Given path personBase + '0'
    When method GET
    Then status 200
    And match response == { firstName: 'John', lastName: 'Doe', age: 30 }