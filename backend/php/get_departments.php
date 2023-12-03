<?php
include('connection.php');

$query = $mysqli->prepare('SELECT * FROM departments');
$query->execute();
$array=$query->get_result();

$response=[];
while ($departments= $array->fetch_assoc()) {
    $response[]=$departments;
}

echo json_encode($response);




?>