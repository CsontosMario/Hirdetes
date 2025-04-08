<?php

require_once("../../common/php/environment.php");

$db = new Database();

$args=Util::getArgs();

$query = "DELETE FROM `kosarelemek` 
                WHERE `kosarID` = :kosarID 
                  AND `termekID` = :termekID";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);