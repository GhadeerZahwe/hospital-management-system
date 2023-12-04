<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['name'])) {
    $name = $_POST['name'];

    $insert_query = $mysqli->prepare('INSERT INTO user_types (name) VALUES (?)');
    $insert_query->bind_param('s', $name);

    if ($insert_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "User type added successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to add user type";
    }

    $insert_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
