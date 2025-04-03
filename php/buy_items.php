<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "DELETE FROM `kosarelemek` 
                WHERE `kosarID` = ?";

$result = $db->execute($query, $args);

// $query = $db->preparateInsert("kosar", $args);

// $result = $db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);