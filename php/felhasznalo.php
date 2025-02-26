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
  Util::setError("please_register");
}

$result = $result[0];

if ($args['jelszo'] !== $result['jelszo']) {
  Util::setError("sign_in_password_error");
}

unset($result['jelszo']);

Util::setResponse($result);