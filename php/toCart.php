<?php

require_once("../../common/php/environment.php");

$args=Util::getArgs();

$db = new Database();

//Checking if product is alredy in the cart
$query = "SELECT `termekID` 
            FROM `kosarelemek` 
           WHERE `kosarID` = :kosarID 
             AND `termekID` = :termekID";

$result = $db->execute($query, ["kosarID" => $args['kosarID'], 
                                "termekID" => $args['termekID']]);

//Check if result is empty or not
if (!is_null($result)) {
  //Place new product in the cart
  $query= $db->preparateInsert("kosarelemek", $args);
  $result=$db->execute($query, array_values($args));
}
else{
  //Update alredy existing product amount
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