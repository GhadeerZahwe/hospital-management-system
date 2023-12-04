<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['room_id'])) {
    $room_id = $_POST['room_id'];

    $delete_query = $mysqli->prepare('DELETE FROM rooms WHERE id = ?');
    $delete_query->bind_param('i', $room_id);

    if ($delete_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Room deleted successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Error deleting room. Please try again later.";
    }
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
