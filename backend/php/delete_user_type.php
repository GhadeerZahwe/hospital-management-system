<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['id'])) {
    // Sanitize input values
    $user_type_id = $_POST['id'];

    $delete_query = $mysqli->prepare('DELETE FROM user_types WHERE id = ?');
    $delete_query->bind_param('i', $user_type_id);

    if ($delete_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "User type deleted successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to delete user type";
    }

    $delete_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
