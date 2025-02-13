<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

// $query = "SELECT `kep`, 
//                  `megnevezes`, 
//                  `leiras`, 
//                  `ar`, 
//                  `kiszereles` 
//             FROM `zoldsegek_?`";

$query = "SELECT `kep`, 
                 `megnevezes`, 
                 `leiras`, 
                 `ar`, 
                 `kiszereles` 
            FROM `zoldsegek_hu`";

//$result = $db->execute($query, array($args['language']));
$result = $db->execute($query);

$db = null;

Util::setResponse($result);