Feature: Users

  Background:
    * url ambiente.url
    * def req_crear_usuario = read('../request/crear_usuario.json')
    * def res_crear_usuario = read('../response/crear_usuario.json')
    * def res_response_busqueda = read('../response/response_busqueda.json')
    * def utils_class = Java.type('utils.util')
    * def reutilizable_crear_usuario = read('../../utils/reutilizable.steps/crear_usuario.feature')
    * def reutilizable_crear_usuario_random = read('../../utils/reutilizable.steps/crear_usuario_random.feature')

  @nuevo_usuario
  Scenario: Crear nuevo usuario
    * set req_crear_usuario.id = 1231233
    * set req_crear_usuario.username = 'UsuarioDePrueba'
    * set req_crear_usuario.firstName = 'Usuario'
    * set req_crear_usuario.lastName = 'Prueba'
    * set req_crear_usuario.email = 'usuariodeprueba@gmail.com'
    * set req_crear_usuario.password = 'probando123'
    * set req_crear_usuario.phone = '12312313'
    * set req_crear_usuario.userStatus = 1
    Given path path_user
    And header Content-Type = 'application/json'
    And request req_crear_usuario
    When method post
    Then status 200
    And match response == res_crear_usuario

  @buscar_pet_username
  Scenario: Buscar por por username
    * def nuevo_usuario = call reutilizable_crear_usuario {"id": 123123, "username": "UsuarioDePrueba"}
    Given path path_user, 'UsuarioDePrueba'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    And match response == res_response_busqueda

  @login
  Scenario: Login con username y password
    * def nuevo_usuario_random = call reutilizable_crear_usuario_random
    * def util = new utils_class()
    * set req_crear_usuario.id = nuevo_usuario_random.response.id
    * set req_crear_usuario.username = nuevo_usuario_random.response.username
    * set req_crear_usuario.password = nuevo_usuario_random.response.password
    Given path path_user, 'login'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field username = nuevo_usuario_random.response.username
    And form field password = nuevo_usuario_random.response.password
    When method get
    Then status 200
    And match response == res_crear_usuario
  
  @logout
  Scenario: Cerrar sesion de usuario en el sistema
    Given path path_user, 'logout'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    And match response == res_crear_usuario

  @actualizar_usuario
  Scenario: Actualizar informacion de usuario
    * def nuevo_usuario = call reutilizable_crear_usuario {"id": 123123, "username": "UsuarioDePrueba"}
    * def util = new utils_class()
    * set req_crear_usuario.username = util.random_string(8)
    * set req_crear_usuario.id = 123123
    Given path path_user, 'UsuarioDePrueba'
    And header Content-Type = 'application/json'
    And request req_crear_usuario
    When method put
    Then status 200
    And match response == res_crear_usuario
  
  @eliminar_usuario
  Scenario: Eliminar usuario
    * def nuevo_usuario = call reutilizable_crear_usuario {"id": 123123, "username": "UsuarioDePrueba"}
    Given path path_user, 'UsuarioDePrueba'
    And header Content-Type = 'application/json'
    When method delete
    Then status 200
    And match response == res_crear_usuario