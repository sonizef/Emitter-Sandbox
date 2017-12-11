<?php 
// Identifiant site

//Variable de connexion (modifiable)
define('USER',"root");
define('PASSWD',"root");
define('SERVER',"localhost");
define('BASE',"tdphp");

//Connexion à la BDD
$dsn="mysql:dbname=".BASE.";host=".SERVER;
    try{
      $bdd=new PDO($dsn,USER,PASSWD);
      $utf = "SET NAMES 'utf8'";
      $bdd->query($utf);
    }
    catch(PDOException $e){
      printf("Échec de la connexion : %s\n", $e->getMessage());
      exit();
    }
?>