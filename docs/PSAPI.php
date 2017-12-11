<?php 

//Variable de connexion (modifiable)
define('USER',"soniwebnqxsoni");
define('PASSWD',"Fairbanks142");
define('SERVER',"soniwebnqxsoni.mysql.db");
define('BASE',"soniwebnqxsoni");

if(isset($_GET['print'])){
	echo "ok";
	var res = json_decode($_GET['print']);
	var_dump(res);

		echo json_encode($res);
}

?>