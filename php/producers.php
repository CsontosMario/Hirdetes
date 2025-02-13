<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query = "SELECT `id`, `nev`, 
                 `szuletett`, `rolaroviden`, 
                 `rola`, `munkanev`, 
                 `kep` 
            FROM `termeloink`";

$result = $db->preparateInsert($query);

$db = null;

Util::setResponse($result);