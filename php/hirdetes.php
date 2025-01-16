<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

$args = Util::getArgs();

$query = "SELECT `kep`, `termekID`, `megnevezes`, `leiras`, `ar`, `kiszereles` FROM `zoldsegek`";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);