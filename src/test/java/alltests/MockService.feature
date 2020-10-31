Feature: mock service

  Background:
    * configure cors = true
  Scenario: pathMatches('/mocktest')
    * def responseHeaders = { 'Content-Type': 'application/json;charset=UTF-8', 'Content-Length': '#(len)'}
    * def response = '{"method": "all"}'
    * def responseStatus = 200
    * def responseDelay = 0

  Scenario: pathMatches('/mocktest') && methodIs('post')
    * def responseHeaders = { 'Content-Type': 'application/json;charset=UTF-8', 'Content-Length': '#(len)'}
    * def response = '{"method": "post"}'
    * def responseStatus = 200
    * def responseDelay = 10

  Scenario: pathMatches("/mocktest") && methodIs('post') && request.name == "Peet"
    * def responseHeaders = { 'Content-Type': 'application/json;charset=UTF-8', 'Content-Length': '#(len)'}
    * def response = '{"method": "post", "name":"Peet"}'
    * def responseStatus = 200
    * def responseDelay = 10






