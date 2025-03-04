<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query = $db->preparateInsert("kosarelemek", $args);

$result = $db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);