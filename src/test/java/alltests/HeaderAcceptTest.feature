Feature: Karate demo

  Background:
    * url 'http://localhost:8080'

  Scenario: Accept Demo
    #Получение значения в разных форматах в зависимости от Accept
    Given path 'api/v2/test/book'
    And header Accept = 'application/json'
    Then method get
    Then status 200

    Given path 'api/v2/test/book'
    And header Accept = 'application/xml'
    Then method get
    Then status 200

