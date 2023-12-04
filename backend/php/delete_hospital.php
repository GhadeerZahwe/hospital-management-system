<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['hospital_id'])) {
    // Sanitize input values
    $hospital_id = intval($_POST['hospital_id']);

    $delete_query = $mysqli->prepare('DELETE FROM hospitals WHERE id = ?');
    $delete_query->bind_param('i', $hospital_id);

    if ($delete_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Hospital deleted successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to delete hospital";
    }

    $delete_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
