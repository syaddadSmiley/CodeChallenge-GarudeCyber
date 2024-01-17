<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->get('/register', 'RegisterController::index');
$routes->post('/register', 'RegisterController::register');

$routes->get('/login', 'LoginController::index');
$routes->post('/login', 'LoginController::login');

$routes->get('/redeem', 'RedeemController::index');
$routes->post('/redeem', 'RedeemController::redeemVoucher');

$routes->get('/logout', 'LogoutController::index');


