<?php
require_once './libs/Router.php';
require_once './app/controller/Dino-api.controller.php';
require_once './app/controller/auth-api.controller.php';

//crea router

$router = new Router();

//defino tabla de ruteo

$router->addroute('dinosaurios', 'GET', 'DinoApiController', 'GetDinos');
$router->addroute('dinosaurios/:ID', 'GET', 'DinoApiController', 'GetDino');
$router->addroute('dinosaurios/:ID', 'DELETE', 'DinoApiController', 'DeleteDino');
$router->addroute('dinosaurios', 'POST', 'DinoApiController', 'InsertarDino');
$router->addroute('dinosaurios/:ID', 'PUT', 'DinoApiController', 'EditarDino');

$router->addRoute("auth/token", 'GET', 'AuthApiController', 'getToken');

//ejecuta la ruta

$router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);