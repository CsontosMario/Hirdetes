<?php

require_once("../../common/php/environment.php");

$db = new Database();

$args=Util::getArgs();

$query="";

$result=$db->execute($query);

$db = null;

Util::setResponse($result);