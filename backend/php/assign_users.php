<?php

include('connection.php');

$user_id= $_POST['user_id'];
$hospital_id = $_POST['hospital_id'];

$query = $mysqli->prepare('insert into hospital_users(hospital_id,user_id) values(?,?)');
$query->bind_param('ii', $hospital_id,$user_id);
$query->execute();
$response['status'] = "success";

echo json_encode($response);


?>
