<?php

namespace Model;

use Helper\DB as DB;

class PageModel extends DB{
	
	public static $data;

	public function insertTrack($request){
		$request = $request->getParsedBody();
		$data = array();
		$this->ins()->insert_with_date("track/vessel_id, date, location, created_at/{$request['vessel_id']}, {$request['date']}, {$request['location']}: NOW()");
		$id = $this->ins()->lastInsertedId();
		if($data = $this->ins()->select_fetch("track/*", "id={$id}")){
			self::$data = json_encode($data);
			return true;
		}
		else{
			return false;
		}

	}


	public function getVesselsCount($place, $date){

		$data = array();

		if($data = DB::ins()->select_rowCount("track/vessel_id", "date={$date}, location={$place}")) {
			self::$data = json_encode($data);
			return true;
		} else {
			return false;
		}

	}

	public function getListId($place, $date){

		$data = array();

		$query = "SELECT license_code FROM vessels INNER JOIN track ON track.vessel_id = vessels.id WHERE track.location = '{$place}' AND track.date = '{$date}'"; 

		

		if($data = DB::ins()->query_query($query)) {
			self::$data = json_encode($data);
			return true;
		} else {
			return false;
		}

	}

	public function getOrigin($id, $date){

		$data = array();

		if($data = DB::ins()->select_fetch("track/location", "id=$id, date=$date")) {
			self::$data = json_encode($data);
			return true;
		} else {
			return false;
		}

	}

	public function getInfoVessels($licenseId){

		$data = array();

		if($data = DB::ins()->innerJoin("vessels/license", 
									    "email, company_name, officer, contact_number, created_at/license_code", 
									    "license/id=vessels/license_id", 
									     null,  
									    "license.id=vessels.license_id")) {
			self::$data = json_encode($data);
			return true;
		} else {
			return false;
		}

	}

	public function insertUser($email, $password){

		if(DB::ins()->insert("users/email, password/$email, $password")){
			return true;
		} else {
			return true;
		}

	}

	public function userLoggedIn($email, $password){

		if(DB::ins()->select_rowCount("users/email, password", "email=$email, password=$password")){
			return true;
		} else {
			return false;
		}

	}

	public function vesselLoggedIn($email, $password){

		if(DB::ins()->select_rowCount("users/email, password", "email=$email, password=$password")){
			return true;
		} else {
			return false;
		}

	}

	public function insertVessel($license, $email, $company, $officer, $contact, $password){

		if(DB::ins()->insert("vessels/license_code, email, company_name, officer, contact_number, password/$license, $email, $company, $officer, $contact, $password")){
			return true;
		} else {
			return true;
		}

	}


}