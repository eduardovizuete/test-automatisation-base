@REQ_HU-GV-001 @HU001 @create_characters @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU-GV-001 Crear personajes Marvel (microservicio para gestión de personajes Marvel)

  Background:
    * url port_marvel_characters_api
    * path '/characters'
    * def generarHeaders =
      """
      function() {
        return {
          "Content-Type": "application/json"
        };
      }
      """
    * def headers = generarHeaders()
    * headers headers

  @id:1 @crearPersonaje @solicitudExitosa201
  Scenario: T-API-HU-GV-001-CA04-Crear personaje exitosamente 201 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    And request jsonData
    When method POST
    Then status 201
    # And match response != null
    # And match response.id != null

  @id:2 @crearPersonaje @errorValidacion400
  Scenario: T-API-HU-GV-001-CA05-Crear personaje con datos inválidos 400 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_invalid_character.json')
    And request jsonData
    When method POST
    Then status 400
    # And match response.name contains 'required'
    # And match response.alterego contains 'required'

  @id:3 @crearPersonaje @errorDuplicado400
  Scenario: T-API-HU-GV-001-CA06-Crear personaje con nombre duplicado 400 - karate
    # Primero creamos un personaje
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_duplicate_character.json')
    And request jsonData
    When method POST
    Then status 201
    
    # Intentamos crear el mismo personaje de nuevo
    And request jsonData
    When method POST
    Then status 400
    # And match response.error contains 'already exists'
    # And match response.error != null

  @id:4 @crearPersonaje @errorServicio500
  Scenario: T-API-HU-GV-001-CA07-Crear personaje con error interno 500 - karate
    * def jsonData = read('classpath:data/marvel_characters_api/request_create_character.json')
    * set jsonData.name = "ErrorServer500"
    And request jsonData
    When method POST
    Then status 500
    # And match response.status == 500
    # And match response.message contains 'Error interno del servidor'
