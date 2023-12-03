<?php
include('connection.php');

$email = $_POST['email'];
$password = $_POST['password'];

$query = $mysqli->prepare('select users.id,users.first_name,users.last_name,users.email,users.password,user_types.name from users inner join user_types on users.usertype_id = user_types.id where email=?');
$query->bind_param('s', $email);
$query->execute();

$query->store_result();
$num_rows = $query->num_rows();
$query->bind_result($id, $first_name, $last_name, $email, $hashed_password,$usertype);
$query->fetch();
$response = [];
if ($num_rows == 0) {
    $response['response'] = "user not found";
} else {
    
    if (password_verify($password, $hashed_password)) {
        $response['response'] = "logged in";
        $response['user_id'] = $id;
        $response['first_name'] = $first_name;
        $response['last_name'] = $last_name;
        $response['email'] = $email;
        $response['usertype'] = $usertype;
        
    } else {
        $response["response"] = "Incorrect password";
    }
}

echo json_encode($response);
?>
