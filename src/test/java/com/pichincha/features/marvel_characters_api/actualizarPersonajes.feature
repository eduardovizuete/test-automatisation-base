@REQ_HU-GV-001 @HU001 @update_characters @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU-GV-001 Actualizar personajes Marvel (microservicio para gestión de personajes Marvel)

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

  @id:1 @actualizarPersonaje @solicitudExitosa200
  Scenario: T-API-HU-GV-001-CA08-Actualizar personaje exitosamente 200 - karate
    # Primero creamos un personaje para asegurarnos de que exista
    * def createData = read('classpath:data/marvel_characters_api/request_create_character.json')
    And request createData
    When method POST
    Then status 201
    * def characterId = response.id
    
    # Ahora lo actualizamos
    * path '/' + characterId
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 200
    # And match response.id == characterId
    # And match response.name == jsonData.name

  @id:2 @actualizarPersonaje @noEncontrado404
  Scenario: T-API-HU-GV-001-CA09-Actualizar personaje inexistente 404 - karate
    * path '/999'
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    And request jsonData
    When method PUT
    Then status 404
    # And match response.error == "Character not found"
    # And match response.error != null

  @id:3 @actualizarPersonaje @errorServicio500
  Scenario: T-API-HU-GV-001-CA10-Actualizar personaje con error interno 500 - karate
    # Primero creamos un personaje para asegurarnos de que exista
    * def createData = read('classpath:data/marvel_characters_api/request_create_character.json')
    And request createData
    When method POST
    Then status 201
    * def characterId = response.id
    
    # Ahora intentamos actualizarlo con datos que provocarán un error
    * path '/' + characterId
    * def jsonData = read('classpath:data/marvel_characters_api/request_update_character.json')
    * set jsonData.name = "ErrorServer500"
    And request jsonData
    When method PUT
    Then status 500
    # And match response.status == 500
    # And match response.message contains 'Error interno del servidor'
