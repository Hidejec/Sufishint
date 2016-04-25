<?php

namespace Controller;

require_once 'vendor/autoload.php';

class BaseController{

	public function view(){
		$app2 = new \Slim\App();
		$container = $app2->getContainer();
		
		$container['view'] = function ($container) {
		    $view = new \Slim\Views\Twig('app/View', [
		        'cache' => false
		    ]);
		    $view->addExtension(new \Slim\Views\TwigExtension(
		        $container['router'],
		        $container['request']->getUri()
		    ));
		
		    return $view;
		};
		return $container['view'];
	}
}