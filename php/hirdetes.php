<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `termekID`,
                 `kep`, 
                 `megnevezes`, 
                 `leiras`, 
                 `ar`, 
                 `kiszereles` 
            FROM `zoldsegek`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);