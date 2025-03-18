<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query = $db->preparateInsert("regisztracio", $args);

$result = $db->execute($query, array_values($args));

$query_s = "SELECT `email`, `nev` FROM `regisztracio`";
$result_s = $db->execute($query_s);

$db = null;

if ($result_s['email'] === $args['email'] || $result_s['nev'] === $args['nev']) {
  Util::setError("duplicate_user");
  $result = null;
}
else{
  $result = $result[0];
}

Util::setResponse($result);