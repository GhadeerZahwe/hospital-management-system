<?php
include('connection.php');

$response = array(); // Initialize the response array

if (
    isset($_POST['department_id']) &&
    isset($_POST['name']) &&
    isset($_POST['building']) &&
    isset($_POST['floor'])
) {
    $department_id = $_POST['department_id'];
    $name = $_POST['name'];
    $building = $_POST['building'];
    $floor = $_POST['floor'];

    $update_query = $mysqli->prepare('UPDATE departments SET name = ?, building = ?, floor = ? WHERE id = ?');
    $update_query->bind_param('sssi', $name, $building, $floor, $department_id);

    if ($update_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Department updated successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to update department";
    }

    $update_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
