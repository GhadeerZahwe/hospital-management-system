<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['id']) && isset($_POST['name'])) {
   
    $user_type_id = $_POST['id'];
    $new_name = $_POST['name'];

    $update_query = $mysqli->prepare('UPDATE user_types SET name = ? WHERE id = ?');
    $update_query->bind_param('si', $new_name, $user_type_id);

    if ($update_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "User type updated successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to update user type";
    }

    $update_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
