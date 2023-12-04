<?php
include('connection.php');

$response = array(); // Initialize the response array

if (
    isset($_POST['name']) &&
    isset($_POST['address']) &&
    isset($_POST['phone_number']) &&
    isset($_POST['email'])
) {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $phone_number = $_POST['phone_number'];
    $email = $_POST['email'];

    $insert_query = $mysqli->prepare('INSERT INTO hospitals(name, address, phone_number, email) VALUES (?, ?, ?, ?)');
    $insert_query->bind_param('ssss', $name, $address, $phone_number, $email);

    if ($insert_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Hospital added successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to add hospital";
    }

    $insert_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
