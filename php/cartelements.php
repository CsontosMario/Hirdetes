<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$params = Util::objMerge(array(
  "kosarID" => NULL,
  "termekID" => NULL,
  "db" => NULL,
  "ar" => NULL
), $args, true);

$query = "INSERT INTO `kosarelemek`(`kosarID`, `termekID`, `db`, `ar`) VALUES";

$result = $db->execute($query, $params);

if (!$result['affectedRows']) {
  Util::setError('apply_for_failed', $db);
}

$db = null;

Util::setResponse($result);