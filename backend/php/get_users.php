<?php
include('connection.php');

$query = $mysqli->prepare('select users.id,users.first_name,users.last_name,users.email,user_types.name from users inner join user_types on users.usertype_id = user_types.id');
$query->execute();
$array=$query->get_result();

$response=[];
while ($users= $array->fetch_assoc()) {
    $response[]=$users;
}

echo json_encode($response);




?>