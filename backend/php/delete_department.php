<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['department_id'])) {
    // Sanitize input value
    $department_id = $_POST['department_id'];

    $delete_query = $mysqli->prepare('DELETE FROM departments WHERE id = ?');
    $delete_query->bind_param('i', $department_id);

    if ($delete_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Department deleted successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to delete department";
    }

    $delete_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
