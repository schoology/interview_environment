<?php 

class MY_Controller extends CI_Controller{

	function __construct(){
		ini_set('auto_detect_line_endings',true);
		parent::__construct();
	}

	function render_page($content){
		$data = array(
			'content' => $content
		);
		$this->load->view('page', $data);
	}
}
