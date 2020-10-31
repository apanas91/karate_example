@api
Feature: Karate demo

  Background:
    * url baseUrl + '/soap'

  Scenario: Soap demo

    #Получение токена
    * def soapRequest =
    """
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:user="service/model/soap/userservice">
         <soapenv:Header/>
          <soapenv:Body>
              <user:GetUserByIdRequest>
                <user:id>1</user:id>
              </user:GetUserByIdRequest>
        </soapenv:Body>
      </soapenv:Envelope>
    """

    Given request soapRequest
    When soap action 'GetUserByIdRequest'
    Then status 200
    And match response /Envelope/Body/UserRes/id == '1'
