<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

$args = Util::getArgs();

$query = $db->preparateInsert("regisztracio", $args);

$result = $db->execute($query, array_valuese($args));

$db = null;

Util::setResponse($result);