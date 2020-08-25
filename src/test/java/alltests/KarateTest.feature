Feature: Karate demo

  Background:
    * url baseUrl

  Scenario: Karate demo

    #Получение токена
    * def authRequest =
    """
      {"username": "admin", "password": "admin"}'
    """
    Given path '/authenticate'
    And request authRequest
    And header Content-type = 'application/json;charset=UTF-8'
    Then method post
    Then status 200
    Then match response.token != null
    * def token = response.token

    #Добавление сообщения
    * def newMessage =
    """
      {"text": "Hello, Karate"}
    """
    Given path '/message'
    And request newMessage
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method post
    Then status 200
    Then match response.text == "Hello, Karate"
    * def messageId = response.id

    #Получение записи
    Given path '/message/' + messageId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method get
    Then status 200

    #Редактирование записи
    * def editMessage =
    """
      {"text": "Karate test"}
    """
    Given path '/message/' + messageId
    And request editMessage
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method put
    Then status 200
    Then match response.text == "Karate test"

    #Получение всех сообщений
    Given path '/message'
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method get
    Then status 200

    #Удаление сообщения
    Given path '/message/' + messageId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method delete
    Then status 200

    #Удаление сообщения (Not found)
    Given path '/message/' + messageId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method delete
    Then status 404