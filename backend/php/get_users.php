<?php
include('connection.php');

$response = array(); // Initialize the response array

$query = $mysqli->prepare('SELECT users.id, users.first_name, users.last_name, users.email, user_types.name 
                           FROM users 
                           INNER JOIN user_types ON users.usertype_id = user_types.id');
if ($query) {
    $query->execute();
    $result = $query->get_result();

    if ($result) {
        while ($user = $result->fetch_assoc()) {
            $response[] = $user;
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
