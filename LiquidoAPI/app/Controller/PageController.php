<?php

namespace Controller;

use Model\PageModel as Model;

class PageController{

	public function insertTrack($request, $response){
		$model = new Model();
		$output = $model->insertTrack($request);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		}
		else{
			return $response->withStatus(400);
		}
	}

	public function getVesselsCount($request, $response, $args){
		$model = new Model();
		$output = $model->getVesselsCount($args["place"], $args["date"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}

	public function insertUser($request, $response, $args){
		$model = new Model();
		$output = $model->insertUser($args["email"], $args["password"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}

	public function userLoggedIn($request, $response, $args){
		$model = new Model();
		$output = $model->userLoggedIn($args["email"], $args["password"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}

	public function vesselLoggedIn($request, $response, $args){
		$model = new Model();
		$output = $model->vesselLoggedIn($args["email"], $args["password"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}

	public function insertVessel($request, $response, $args){
		$model = new Model();
		$output = $model->insertVessel($args["license"], $args["email"], $args["company"], $args["officer"], $args["contact"], $args["password"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}

	public function getOrigin($request, $response, $args){
		$model = new Model();
		$output = $model->getOrigin($args["id"], $args["date"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}

	public function getListId($request, $response, $args){
		$model = new Model();
		$output = $model->getListId($args["place"], $args["date"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}

	public function getInfoVessels($request, $response, $args){
		$model = new Model();
		$output = $model->getInfoVessels($args["licenseId"]);
		if($output){
			return $response->withStatus(200)
							->withHeader("Content-Type", "application/json")
							->write(Model::$data);
		} else {
			return $response->withStatus(404);
		}
	}
}