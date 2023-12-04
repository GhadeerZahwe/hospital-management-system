<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['user_id'])) {
    $user_id = $_POST['user_id'];

    $delete_query = $mysqli->prepare('DELETE FROM users WHERE id = ?');
    $delete_query->bind_param('i', $user_id);

    if ($delete_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "User deleted successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Error deleting user. Please try again later.";
    }
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
