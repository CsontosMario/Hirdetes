<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

$args = Util::getArgs();

$query = "SELECT `felhasznaloID`, `jelszo`, `jelszo2`, `nev`, `iranyitoszam`, `varos`, `cim`, `orszag` FROM `regisztracio`";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);