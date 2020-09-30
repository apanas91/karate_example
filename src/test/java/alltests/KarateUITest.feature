Feature: Karate demo
  Background:
  Scenario: SignInGithub
    * def username = 'username'
    * def password = 'password'

    Given driver 'https://github.com/login'
    And input('input[id=login_field]', username)
    And input('input[id=password]', password)
    When click('input[name=commit]')
    Then waitForUrl('https://github.com/')
