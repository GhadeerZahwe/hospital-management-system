<?php

include('connection.php');

$response = array(); // Initialize the response array

if (
    isset($_POST['first_name']) &&
    isset($_POST['last_name']) &&
    isset($_POST['email']) &&
    isset($_POST['password']) &&
    isset($_POST['user_type'])
) {
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $user_type = $_POST['user_type'];

    $check_email =  $mysqli->prepare('SELECT email FROM users WHERE email = ?');
    $check_email->bind_param('s', $email);
    $check_email->execute();
    $check_email->store_result();
    $email_exists = $check_email->num_rows();

    if ($email_exists > 0) {
        $response['status'] = "failed";
        $response['message'] = "Email already exists";
    } else {
        $query =  $mysqli->prepare('SELECT id FROM user_types WHERE name = ?');
        $query->bind_param('s', $user_type);
        $query->execute();
        $array = $query->get_result();
        $user_type_id = $array->fetch_assoc();

        $hashed_password = password_hash($password, PASSWORD_BCRYPT);

        $insert_query =  $mysqli->prepare('INSERT INTO users(first_name, last_name, email, password, usertype_id) VALUES (?, ?, ?, ?, ?)');
        $insert_query->bind_param('ssssi', $first_name, $last_name, $email, $hashed_password, $user_type_id['id']);
        
        if ($insert_query->execute()) {
            $response['status'] = "success";
            $response['message'] = "User registered successfully";
        } else {
            $response['status'] = "failed";
            $response['message'] = "Registration failed. Please try again later.";
        }
    }
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
