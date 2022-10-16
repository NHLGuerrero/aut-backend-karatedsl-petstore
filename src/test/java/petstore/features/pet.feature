Feature: Pet

  Background:
    * url ambiente.url
    * def req_crear_pet = read('../request/crear_pet.json')
    * def res_crear_pet = read('../response/crear_pet.json')
    * def reutilizable_crear_pet = read('../../utils/reutilizable.steps/crear_pet.feature')
    * def reutilizable_crear_pet_random = read('../../utils/reutilizable.steps/crear_pet_random.feature')

  @nuevo_pet
  Scenario: Añadir nuevo pet a la tienda
    * set req_crear_pet.id = 1231233
    * set req_crear_pet.name = 'Limon'
    * set req_crear_pet.status = 'available'
    Given path path_pet
    And header Content-Type = 'application/json'
    And request req_crear_pet
    When method post
    Then status 200
    And match response == res_crear_pet

  @buscar_pet_id
  Scenario: Buscar por por id
    * def nuevo_pet = call reutilizable_crear_pet {"id": 123123, "name": "Coco"}
    Given path path_pet, '123123'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    And match response == {"id": #number,"name": "#string","photoUrls": [],"tags": [],"status": "#string"}

  @actualizar_pet
  Scenario: Actualizar informacion de pet
    * def nuevo_pet = call reutilizable_crear_pet {"id": 123123, "name": "Coco"}
    * def utils_class = Java.type('utils.util')
    * def util = new utils_class()
    * set req_crear_pet.name = util.random_string(8)
    * set req_crear_pet.id = 123123
    Given path path_pet
    And header Content-Type = 'application/json'
    And request req_crear_pet
    When method put
    Then status 200
    And match response == res_crear_pet

  @eliminar_pet
  Scenario: Eliminar pet
    * def nuevo_pet_random = call reutilizable_crear_pet_random
    * def utils_class = Java.type('utils.util')
    * def util = new utils_class()
    * set req_crear_pet.name = nuevo_pet_random.response.name
    * set req_crear_pet.id = nuevo_pet_random.response.id
    Given path path_pet, nuevo_pet_random.response.id
    And header Content-Type = 'application/json'
    When method delete
    Then status 200
    And match response == {"code": 200, "type": "unknown", "message": "#(nuevo_pet_random.response.id + '')"}