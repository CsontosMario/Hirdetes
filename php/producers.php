<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `id`, `nev`, 
                 `szuletett`, 
                 `kep` 
            FROM `termeloink`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);