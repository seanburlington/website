---
layout: post
title: Accessing CKAN data from PHP
created: 1266960166
comments: true
categories:
- php
- drupal
- ckan
- open data
---
I've been working on a couple of open data projects recently - which has been very rewarding.

A couple of people have asked for some code so I've knocked up a quick version of the sort of thing I've been working on.

This code requires PHP 5.1 for the JSON functions but doesn't need any extra libraries (pecl_http can give better error messages but is a bit of a pain to install).

The Notes field in packages returns output in Markdown format - you can convert this to HTMl with a parser available at http://michelf.com/projects/php-markdown

This isn't production code so please test before using.


<?php

class Ckan {
	private  $url = 'http://www.ckan.net/';
	private $errors = array(
                              '400'  =>   'Bad Request',
                              '403'  =>   'Not Authorized',
                              '404'  =>   'Not Found',
                              '500'  =>   'Internal Server Error', 
	);
	
	public function __construct($url=null){
		if ($url){
			$this->url=$url;
		}
	}
	
	private function transfer($url){

		$ch = curl_init($this->url . $url);


		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_TIMEOUT, 30);
		$result = curl_exec($ch);
		$info = curl_getinfo($ch);
		curl_close($ch);
		if ($info['http_code'] != 200){
			throw new CkanException($this->error_codes["$info[http_code]"]);
		}
		if (!$result){
			throw new CkanException("No Result");
		}
		return json_decode($result);
	}

	public function search($keyword){
		$results = $this->transfer('api/search/package/?all_fields=1&q=' . urlencode($keyword));
		if (!$results->count){
			throw new CkanException("Search Error");
		}
		return $results;
	}

	public function getPackage($package){
		$package = $this->transfer('api/rest/package/' . urlencode($package));
		if (!$package->name){
			throw new CkanException("Package Load Error");
		}
		return $package;
	}


	public function getPackageList(){
		$list =  $this->transfer('api/rest/package/');
		if (!is_array($list)){
			throw new CkanException("Package List Error");
		}
		return $list;
	}

	public function getGroup($group){
		$group = $this->transfer('api/rest/group/' . urlencode($group) );
		if (!$group->name){
			throw new CkanException("Group Error");
		}
		return $group;
	}

	public function getGroupList(){
		$groupList = $this->transfer('api/rest/group/');
		if (!is_array($groupList)){
			throw new CkanException("Group List Error");
		}
		return $groupList;
	}
}

class CkanException extends Exception{}


?>



Test with 

<?php

require_once("ckan.php");

$ckan = new Ckan();


$data = $ckan->getPackage('edmonton-data');

print_r($data);

?>

I'm keeping this file and a Drupal module that uses it on Github at: 

http://github.com/practicalweb/drupal-ckan

