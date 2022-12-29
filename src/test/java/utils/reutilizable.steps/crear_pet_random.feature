@ignore
Feature: Reutilizable crear pet

  Background: 
    * url ambiente.url
    * def req_crear_pet = read('../../petstore/request/crear_pet.json')
    * def res_crear_pet = read('../../petstore/response/crear_pet.json')

  @nuevo_pet
  Scenario: Añadir nuevo pet a la tienda
    Given path path_pet
    And header Content-Type = 'application/json'
    * def utils_class = Java.type('utils.util')
    * def util = new utils_class()
    * set req_crear_pet.id = util.random_number(6)
    * set req_crear_pet.name = util.random_string(8)
    And request req_crear_pet
    When method post
    Then status 200
    And match response == res_crear_pet
