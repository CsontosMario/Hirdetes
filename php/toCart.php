<?php

require_once("../../common/php/environment.php");

$args=Util::getArgs();

$db = new Database();

$query= $db->preparateInsert("kosarelemek", $args);

$result=$db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);