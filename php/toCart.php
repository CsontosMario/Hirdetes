<?php

require_once("../../common/php/environment.php");

$args=Util::getArgs();

$db = new Database();

$query = "SELECT `termekID` 
            FROM `kosarelemek` 
           WHERE `kosarID` = :kosarID 
             AND `termekID` = :termekID";

$result = $db->execute($query, ["kosarID" => $args['kosarID'], 
                                "termekID" => $args['termekID']]);

if (!is_null($result)) {
  $query= $db->preparateInsert("kosarelemek", $args);

  $result=$db->execute($query, array_values($args));
}
else{
  $query= "UPDATE `kosarelemek` 
              SET `db`=`db`+ :db,
                  `ar`=`ar`+ :ar
            WHERE `kosarID` = :kosarID
              AND `termekID` = :termekID";

  $result=$db->execute($query, ["db"       => $args['db'],
                                "ar"       =>$args['ar'],
                                "kosarID"  =>$args['kosarID'],
                                "termekID" =>$args['termekID']]);
}

$db = null;

Util::setResponse($result);