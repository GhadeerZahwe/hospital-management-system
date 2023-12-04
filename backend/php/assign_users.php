<?php

include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['user_id'], $_POST['hospital_id'])) {
    $user_id = $_POST['user_id'];
    $hospital_id = $_POST['hospital_id'];

    $query = $mysqli->prepare('INSERT INTO hospital_users (hospital_id, user_id) VALUES (?, ?)');
    if ($query) {
        $query->bind_param('ii', $hospital_id, $user_id);
        $result = $query->execute();

        if ($result) {
            $response['status'] = "success";
        } else {
            $response['status'] = "failed";
            $response['message'] = "Error executing the query: " . $mysqli->error;
        }

        $query->close();
    } else {
        $response['status'] = "failed";
        $response['message'] = "Error preparing the SQL statement: " . $mysqli->error;
    }
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
