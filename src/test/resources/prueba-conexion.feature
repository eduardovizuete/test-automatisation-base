Feature: Prueba simple de conexión

  Scenario: Verificar configuración
    * print 'Verificando que Karate puede leer este feature'
    * def result = { status: 'ok' }
    * match result.status == 'ok'
