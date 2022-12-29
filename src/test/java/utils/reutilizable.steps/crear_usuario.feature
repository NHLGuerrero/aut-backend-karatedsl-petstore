@ignore
Feature: Reutilizable crear user
  
    Background:
        * url ambiente.url
        * def req_crear_usuario = read('../../petstore/request/crear_usuario.json')
        * def res_crear_usuario = read('../../petstore/response/crear_usuario.json')

    @nuevo_usuario
    Scenario: Crear nuevo usuario
        Given path path_user
        And header Content-Type = 'application/json'
        * set req_crear_usuario.id = __arg.id
        * set req_crear_usuario.username = __arg.username
        And request req_crear_usuario
        When method post
        Then status 200
        And match response == res_crear_usuario