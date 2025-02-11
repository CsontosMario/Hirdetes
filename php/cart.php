<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

$query = "SELECT `megnevezes`
            FROM `fizetes`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);