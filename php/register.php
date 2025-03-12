<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query = $db->preparateInsert("regisztracio", $args);

$result = $db->execute($query, array_values($args));

$db = null;

if ($result['email'] === $args['email'] || $result['nev'] === $args['nev']) {
  Util::setError("duplicate_user");
}

$result = $result[0];

Util::setResponse($result);