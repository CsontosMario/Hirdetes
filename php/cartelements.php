<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query ="SELECT `zoldsegek`.`kep`, `zoldsegek`.`megnevezes`, 
                `zoldsegek`.`kiszereles`, `kosarelemek`.`db`, `zoldsegek`.`ar` 
           FROM `kosarelemek`
            INNER JOIN `zoldsegek` ON `zoldsegek`.`termekID` = `kosarelemek`.`termekID`
            INNER JOIN `kosar` ON `kosar`.`id` = `kosarelemek`.`kosarID`
            INNER JOIN `regisztracio` ON `regisztracio`.`felhasznaloID` = `kosar`.`felhasznaloID`
          WHERE `kosar`.`felhasznaloID` = ?";
          
$result = $db->execute($query, strval($args));

$db = null;

Util::setResponse($result);