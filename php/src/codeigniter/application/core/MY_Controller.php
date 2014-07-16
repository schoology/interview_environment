<?php 

class MY_Controller extends CI_Controller{

	function __construct(){
		parent::__construct();
	}

	function render_page($content){
		$data = array(
			'content' => $content
		);
		$this->load->view('page', $data);
	}
}