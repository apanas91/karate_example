Feature: Karate demo

  Background:
    * url baseUrl

  Scenario: Karate demo

    #Получение токена
    * def authRequest =
    """
      {"username": "admin", "password": "admin"}'
    """
    Given path '/api/v1/authenticate'
    And request authRequest
    And header Content-type = 'application/json;charset=UTF-8'
    Then method post
    Then status 200
    Then match response.token != null
    * def token = response.token

    #Добавление сообщения
    * def newOrder =
    """
      {
      "text": "Hello, Karate",
      "comment": "commenghntatius"
      }
    """
    Given path '/api/v1/order'
    And request newOrder
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method post
    Then status 200
    Then match response.text == "Hello, Karate"
    * def orderId = response.id

    #Получение записи
    Given path '/api/v1/order/' + orderId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method get
    Then status 200

    #Редактирование записи
    * def editOrder =
    """
      {"text": "Karate edit",
       "comment": "comment edit"}
    """

    Given path '/api/v1/order/' + orderId
    And request editOrder
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method put
    Then status 200
    Then match response.comment == "comment edit"

    #Получение всех записей
    Given path '/api/v1/order'
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method get
    Then status 200

    #Удаление
    Given path '/api/v1/order/' + orderId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method delete
    Then status 200

    #Удаление (Not found)
    Given path '/api/v1/order/' + orderId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method delete
    Then status 404