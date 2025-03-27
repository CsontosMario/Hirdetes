<?php

require_once("../../common/php/environment.php");

$db = new Database();

$args=Util::getArgs();

$query = "";

$result = $db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);