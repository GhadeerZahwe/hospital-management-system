<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['email']) && isset($_POST['password'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = $mysqli->prepare('SELECT users.id, users.first_name, users.last_name, users.email, users.password, user_types.name 
                               FROM users 
                               INNER JOIN user_types ON users.usertype_id = user_types.id 
                               WHERE email = ?');
    $query->bind_param('s', $email);
    $query->execute();

    $query->store_result();
    $num_rows = $query->num_rows();
    $query->bind_result($id, $first_name, $last_name, $email, $hashed_password, $usertype);
    $query->fetch();

    if ($num_rows == 0) {
        $response['status'] = "failed";
        $response['message'] = "User not found";
    } else {
        if (password_verify($password, $hashed_password)) {
            $response['status'] = "success";
            $response['message'] = "Logged in";
            $response['user_id'] = $id;
            $response['first_name'] = $first_name;
            $response['last_name'] = $last_name;
            $response['email'] = $email;
            $response['usertype'] = $usertype;
        } else {
            $response['status'] = "failed";
            $response['message'] = "Incorrect password";
        }
    }
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
