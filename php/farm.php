<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `kep` FROM `farm`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);