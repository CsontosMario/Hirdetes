<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs(false);

$db = new Database();

$query = "SELECT `nev`, `orszag`, `telepules`, `cim`, `iranyitoszam` 
            FROM `regisztracio` 
           WHERE `felhasznaloID` = ?";

$result = $db->execute($query, $args);

$db = null;

$result = $result[0];

Util::setResponse($result);