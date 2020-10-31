@mock
Feature: Mock demo
  Background:
  Scenario: Mock demo
    Given url 'http://localhost:8080/test'
    Then method get

    Given url 'http://localhost:8080/test'
    And request ""
    Then method post

    Given url 'http://localhost:8080/test'
    And request '{"name": "Peet"}'
    Then method post