<?php
include('connection.php');

$response = array(); 

if (
    isset($_POST['name']) &&
    isset($_POST['building']) &&
    isset($_POST['floor'])
) {
    $name = $_POST['name'];
    $building = $_POST['building'];
    $floor = $_POST['floor'];

    $insert_query = $mysqli->prepare('INSERT INTO departments(name, building, floor) VALUES (?, ?, ?)');
    $insert_query->bind_param('sss', $name, $building, $floor);

    if ($insert_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Department added successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to add department";
    }

    $insert_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
