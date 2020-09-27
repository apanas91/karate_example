function fn() {
    var env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    //Красивые  запросы в логах
    karate.configure('logPrettyRequest', true);
    //Красивые ответы в логах
    karate.configure('logPrettyResponse', true);
    //Проверяем установленное окружение
    if (!env) {
        env = 'test';
    }
    var config = {
        env: env,
    }
    //Задаем конфиги в зависимости от окружения
    if (env == 'test') {
        config.baseUrl = 'http://localhost:8080'

    } else if (env == 'test') {
        config.baseUrl = 'http://localhost:8080'
    }
    return config;
}

