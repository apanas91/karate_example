Feature: Karate demo

  Background:
    * url baseUrl
  Scenario Outline: Karate Scenario outline demo

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
    * def newMessage =
    """
      {
      "text": "<text>",
      "comment": "<comment>"
      }
    """
    Given path '/api/v1/order'
    And request newMessage
    And header Content-type = 'application/json;charset=UTF-8'
    And header Authorization = 'Bearer ' + token
    Then method post
    Then status 200
    Then match response.text == "<text>"

    Examples:
      | text            | comment         |
      | Hello World     | London Good By  |
      | Karate Outline  | Demo test       |

