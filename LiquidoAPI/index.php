<?php

require_once 'vendor/autoload.php';

use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;

header ("Access-Control-Allow-Origin: *");

$app = new \Slim\App([
    'settings' => [
        'displayErrorDetails' => true
    ]
]);

$app->get('/', "Controller\PageController:index");

//$app->get('/vessels/{place}/{date}', "Controller\PageController:getVesselsId");

$app->get('/vessels/list/{place}/{date}', "Controller\PageController:getListId");

$app->get('/vessels/info/{licenseId}', "Controller\PageController:getInfoVessels");

$app->get('/vessels/count/{place}/{date}', "Controller\PageController:getVesselsCount");

$app->get('/vessels/origin/{id}/{date}', "Controller\PageController:getOrigin");

$app->get('/login/user/{email}/{password}', "Controller\PageController:userLoggedIn");

$app->get('/login/vessel/{email}/{password}', "Controller\PageController:vesselLoggedIn");

$app->get('/register/user/{email}/{password}', "Controller\PageController:insertUser");

$app->get('/register/vessel/{license}/{email}/{company}/{officer}/{contact}/{password}', "Controller\PageController:insertVessel");


$app->post('/tracks', "Controller\PageController:insertTrack");

$app->run();