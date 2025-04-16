<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "UPDATE `regisztracio` 
             SET `email`=:email,
                 `nev`=:nev,
                 `telefonszam`=:telefonszam,
                 `iranyitoszam`=:iranyitoszam,
                 `telepules`=:telepules,
                 `cim`=:cim,
                 `orszag`=:orszag 
           WHERE `felhasznaloID` = :felhasznaloID";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);