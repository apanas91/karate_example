@ui
Feature: Karate demo
  Background:
    And def username = 'username'
    And def password = 'password'
    * configure driver = { type: 'chromedriver', start: false, webDriverUrl: 'http://localhost:4444/wd/hub', timeout: 120000 }
  Scenario: SignInGithub (Запуск на удаленную машину)

    Given driver 'https://github.com/login'
    And input('input[id=login_field]', username)
    And input('input[id=password]', password)
    When click('input[name=commit]')

#  На машину (где будут выполняться тесты) скачать веб драйвер Chrome (актуальную версию, в соответствии с версией браузера) https://chromedriver.chromium.org/downloads
#  В системных переменных добавить новую переменную webdriver.chrome.driver, в значение указать путь к драйверу
#  Для уверенности, что все подтянулось, лучше перезапустить систему)
#  На машину (где будут выполняться тесты) скачать Selenium Server https://www.selenium.dev/downloads/
#  Запускаем Selenium server
#  На машине (где будут выполняться тесты) необходимо отключить брандмауэр (или как то "умно" его настроить)
#  В Karate - сценарии сконфигурировать драйвер (пример ниже)
#    * configure driver = { type: 'chromedriver', start: false, webDriverUrl: 'http://192.168.100.22:4444/wd/hub', timeout: 120000 }
#  в webDriverUrl указываем адрес хоста, где запущен Selenium Server
#  Запускаем тест. Готово.