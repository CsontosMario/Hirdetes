<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `email`, `nev` FROM `regisztracio` 
           WHERE `email` = ?";
$result = $db->execute($query, [$args['email']]);

if (!is_null($result)) {
  Util::setError("duplicate_user");
}
else{
  $query = $db->preparateInsert("regisztracio", $args);
  
  $result = $db->execute($query, array_values($args)); 
}

$db = null;

Util::setResponse($result);