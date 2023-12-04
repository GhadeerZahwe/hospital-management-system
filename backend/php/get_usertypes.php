<?php
include('connection.php');

$response = array(); // Initialize the response array

$query = $mysqli->prepare('SELECT * FROM user_types');
if ($query) {
    $query->execute();
    $result = $query->get_result();

    if ($result) {
        while ($user_type = $result->fetch_assoc()) {
            $response[] = $user_type;
        }
        $query->close();
    } else {
        $response['status'] = "failed";
        $response['message'] = "Error fetching results from the database";
    }
} else {
    $response['status'] = "failed";
    $response['message'] = "Error preparing the SQL statement";
}

echo json_encode($response);
?>
