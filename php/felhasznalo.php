<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

// $args = array(
//      "nev" => "Raikou Usagi",
//      "jelszo" => "1234aA"
// );

$args = Util::getArgs();

$query = "SELECT `felhasznaloID`, 
                 `nev` 
            FROM `regisztracio`
            WHERE `nev` = ?";

$result = $db->execute($query, array($args['nev']));

if (is_null($result)) {
     Util::setError("Kérem bejelentkezés előtt regisztrálja ezt a felhasználót!");
}
else{
     $result = $result[0];
}

$db = null;

Util::setResponse($result);