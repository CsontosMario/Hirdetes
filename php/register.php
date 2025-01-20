<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

$args = Util::getArgs();

$query = "INSERT INTO `regisztracio`(`jelszo`, `nev`, `iranyitoszam`, `varos`, `cim`, `orszag`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]' )";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);