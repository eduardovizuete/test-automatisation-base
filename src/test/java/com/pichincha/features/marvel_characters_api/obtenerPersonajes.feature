@REQ_HU-GV-001 @HU001 @get_all_characters @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU-GV-001 Obtener todos los personajes (microservicio para gestión de personajes Marvel)

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

  @id:1 @obtenerPersonajes @solicitudExitosa200
  Scenario: T-API-HU-GV-001-CA01-Obtener todos los personajes exitosamente 200 - karate
    When method GET
    Then status 200
    # And match response != null
    # And match $ == '#array'

  @id:2 @obtenerPersonajesPorId @solicitudExitosa200
  Scenario: T-API-HU-GV-001-CA02-Obtener personaje por ID exitosamente 200 - karate
    * path '/1'
    When method GET
    Then status 200
    # And match response != null
    # And match response.id == 1

  @id:3 @obtenerPersonajesPorId @noEncontrado404
  Scenario: T-API-HU-GV-001-CA03-Obtener personaje por ID inexistente 404 - karate
    * path '/999'
    When method GET
    Then status 404
    # And match response.error == "Character not found"
    # And match response.error != null
