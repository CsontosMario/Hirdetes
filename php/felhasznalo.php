<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

$args = Util::getArgs();

$query = "SELECT `felhasznaloID`,
                 `jelszo`
            FROM `regisztracio`
            WHERE `nev` = ?;";

$result = $db->execute($query, array($args['nev']));

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