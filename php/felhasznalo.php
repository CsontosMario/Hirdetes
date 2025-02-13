<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query = "SELECT `felhasznaloID`, 
                 `nev`, 
                 `jelszo` 
            FROM `regisztracio` 
          WHERE `email` 
            LIKE ?;";

$result = $db->execute($query, array($args['email']));

$db = null;

if (is_null($result)) {
  Util::setError("Kérem bejelentkezés előtt regisztrálja ezt a felhasználót!");
}

$result = $result[0];

if ($args['jelszo'] !== $result['jelszo']) {
  Util::setError("Hibás jelszó!");
}

unset($result['jelszo']);

Util::setResponse($result);