@REQ_HU-GV-001 @HU001 @marvel_characters_api @Agente2 @E2 @iniciativa_marvel
Feature: HU-GV-001 Master Feature para pruebas de API Marvel Characters

  Background:
    * configure ssl = true

  Scenario: Ejecutar pruebas de obtención de personajes
    * call read('classpath:com/pichincha/features/marvel_characters_api/obtenerPersonajes.feature')
  
  Scenario: Ejecutar pruebas de creación de personajes
    * call read('classpath:com/pichincha/features/marvel_characters_api/crearPersonajes.feature')
  
  Scenario: Ejecutar pruebas de actualización de personajes
    * call read('classpath:com/pichincha/features/marvel_characters_api/actualizarPersonajes.feature')
  
  Scenario: Ejecutar pruebas de eliminación de personajes
    * call read('classpath:com/pichincha/features/marvel_characters_api/eliminarPersonajes.feature')
