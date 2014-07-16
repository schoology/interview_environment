<?php

class Home extends MY_Controller{
	
	function __construct(){
		parent::__construct();
	}

	function index(){
		$this->render_page("My Interview Solution");
	}
}