<?php
include('connection.php');

$response = array(); // Initialize the response array

$query = $mysqli->prepare('SELECT * FROM hospitals');
if ($query) {
    $query->execute();
    $result = $query->get_result();

    if ($result) {
        while ($hospital = $result->fetch_assoc()) {
            $response[] = $hospital;
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
