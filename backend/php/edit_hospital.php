<?php
include('connection.php');

$response = array(); // Initialize the response array

if (
    isset($_POST['hospital_id']) &&
    isset($_POST['name']) &&
    isset($_POST['address']) &&
    isset($_POST['phone_number']) &&
    isset($_POST['email'])
) {
    // Sanitize input values
    $hospital_id = intval($_POST['hospital_id']);
    $name = htmlspecialchars($_POST['name']);
    $address = htmlspecialchars($_POST['address']);
    $phone_number = htmlspecialchars($_POST['phone_number']);
    $email = htmlspecialchars($_POST['email']);

    $update_query = $mysqli->prepare('UPDATE hospitals SET name = ?, address = ?, phone_number = ?, email = ? WHERE id = ?');
    $update_query->bind_param('ssssi', $name, $address, $phone_number, $email, $hospital_id);

    if ($update_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Hospital information updated successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to update hospital information";
    }

    $update_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
