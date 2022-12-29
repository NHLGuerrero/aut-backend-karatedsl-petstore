@ignore
Feature: Reutilizable crear usuario random
  
  Background:
    * url ambiente.url
    * def req_crear_usuario = read('../../petstore/request/crear_usuario.json')
    * def res_crear_usuario = read('../../petstore/response/crear_usuario.json')

  @nuevo_usuario
  Scenario: Crear nuevo usuario
    Given path path_user
    And header Content-Type = 'application/json'
    * def utils_class = Java.type('utils.util')
    * def util = new utils_class()
    * set req_crear_usuario.id = util.random_number(6)
    * set req_crear_usuario.username = util.random_string(8)
    * set req_crear_usuario.password = util.random_string(8)
    And request req_crear_usuario
    When method post
    Then status 200
    And match response == res_crear_usuario