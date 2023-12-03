<?php
include('connection.php');

$query = $mysqli->prepare('SELECT * FROM hospitals');
$query->execute();
$array=$query->get_result();

$response=[];
while ($hospitals= $array->fetch_assoc()) {
    $response[]=$hospitals;
}

echo json_encode($response);




?>