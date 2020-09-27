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

    #Получение списка пользователей
    Given path '/api/v1/user'
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method get
    Then status 200
    * def recipientId = response[0].id


    #Добавление сообщения
    * def newMessage =
    """
      {
      "text": "Hello, Karate",
      "recipient": #(recipientId)
      }
    """
    Given path '/api/v1/message'
    And request newMessage
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method post
    Then status 200
    Then match response.text == "Hello, Karate"
    * def messageId = response.id

    #Получение записи
    Given path '/api/v1/message/' + messageId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method get
    Then status 200

    #Редактирование записи
    * def editMessage =
    """
      {"text": "Karate test"}
    """
    Given path '/api/v1/message/' + messageId
    And request editMessage
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method put
    Then status 200
    Then match response.text == "Karate test"

    #Получение всех сообщений
    Given path '/api/v1/message'
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method get
    Then status 200

    #Удаление сообщения
    Given path '/api/v1/message/' + messageId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method delete
    Then status 200

    #Удаление сообщения (Not found)
    Given path '/api/v1/message/' + messageId
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method delete
    Then status 404