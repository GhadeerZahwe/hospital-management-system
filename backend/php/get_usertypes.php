<?php
include('connection.php');

$query = $mysqli->prepare('SELECT * FROM user_types');
$query->execute();
$array=$query->get_result();

$response=[];
while ($user_types= $array->fetch_assoc()) {
    $response[]=$user_types;
}

echo json_encode($response);




?>