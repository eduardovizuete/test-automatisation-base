@REQ_HU-GV-001 @HU001 @delete_characters @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU-GV-001 Eliminar personajes Marvel (microservicio para gestión de personajes Marvel)

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

  @id:1 @eliminarPersonaje @solicitudExitosa204
  Scenario: T-API-HU-GV-001-CA11-Eliminar personaje exitosamente 204 - karate
    # Primero creamos un personaje para asegurarnos de que exista
    * def createData = read('classpath:data/marvel_characters_api/request_create_character.json')
    And request createData
    When method POST
    Then status 201
    * def characterId = response.id
    
    # Ahora lo eliminamos
    * path '/' + characterId
    When method DELETE
    Then status 204
    # And match response == ''
    # And match responseStatus == 204

  @id:2 @eliminarPersonaje @noEncontrado404
  Scenario: T-API-HU-GV-001-CA12-Eliminar personaje inexistente 404 - karate
    * path '/999'
    When method DELETE
    Then status 404
    # And match response.error == "Character not found"
    # And match response.error != null

  @id:3 @eliminarPersonaje @errorServicio500
  Scenario: T-API-HU-GV-001-CA13-Eliminar personaje con error interno 500 - karate
    # Primero creamos un personaje especial que provocará un error al eliminar
    * def createData = read('classpath:data/marvel_characters_api/request_create_character.json')
    * set createData.name = "ErrorServer500Delete"
    And request createData
    When method POST
    Then status 201
    * def characterId = response.id
    
    # Ahora intentamos eliminarlo, lo que provocará un error interno
    * path '/' + characterId
    When method DELETE
    Then status 500
    # And match response.status == 500
    # And match response.message contains 'Error interno del servidor'
