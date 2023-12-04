<?php
include('connection.php');

$response = array(); // Initialize the response array

if (
    isset($_POST['user_id']) &&
    isset($_POST['first_name']) &&
    isset($_POST['last_name']) &&
    isset($_POST['email']) &&
    isset($_POST['usertype_id'])
) {
    $userId = $_POST['user_id'];
    $firstName = $_POST['first_name'];
    $lastName = $_POST['last_name'];
    $email = $_POST['email'];
    $userTypeId = $_POST['usertype_id'];

    $query = $mysqli->prepare('UPDATE users SET first_name = ?, last_name = ?, email = ?, usertype_id = ? WHERE id = ?');
    $query->bind_param('sssii', $firstName, $lastName, $email, $userTypeId, $userId);

    if ($query->execute()) {
        $response['status'] = "success";
        $response['message'] = "User information updated successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Error updating user information";
    }

    $query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
