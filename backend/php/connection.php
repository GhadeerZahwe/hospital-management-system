<?php

header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Methods:GET,POST,OPTIONS');
header('Access-Control-Allow-Headers:*');

$host = "localhost";
$db_user = "root";
$db_pass = null;
$db_name = "hospital_system";

$mysqli = new mysqli($host, $db_user, $db_pass, $db_name);
?>