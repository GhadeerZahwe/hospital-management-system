<?php
include('connection.php');

$query = $mysqli->prepare('SELECT * FROM rooms');
$query->execute();
$array=$query->get_result();

$response=[];
while ($rooms= $array->fetch_assoc()) {
    $response[]=$rooms;
}

echo json_encode($response);




?>