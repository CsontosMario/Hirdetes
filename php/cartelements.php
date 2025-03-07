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

$query = "INSERT INTO `kosarelemek`(`kosarID`, `termekID`, `db`, `ar`) VALUES ('',10,1,2000);";

$result = $db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);