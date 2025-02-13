<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query = "SELECT `id`, `nev`, 
                 `szuletesihely`, `szuletesiev`, 
                 `rolaroviden`, `rola`, 
                 `munkanev`, 
                 `kep` 
          FROM `programozoink_hu`";

$result = $db->preparateInsert($query);

$db = null;

Util::setResponse($result);