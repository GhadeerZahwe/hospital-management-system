<?php
include('connection.php');

$response = array(); // Initialize the response array

if (isset($_POST['room_number']) && isset($_POST['is_vip']) &&
    isset($_POST['number_beds']) && isset($_POST['floor_number']) && isset($_POST['phone_number']) &&
    isset($_POST['cost_day_usd']) && isset($_POST['department_id'])) {

        
    $room_number = intval($_POST['room_number']);
    $is_vip = intval($_POST['is_vip']);
    $number_beds = intval($_POST['number_beds']);
    $floor_number = htmlspecialchars($_POST['floor_number']);
    $phone_number = htmlspecialchars($_POST['phone_number']);
    $cost_day_usd = intval($_POST['cost_day_usd']);
    $department_id = intval($_POST['department_id']);

    $insert_query = $mysqli->prepare('INSERT INTO rooms (room_number, is_vip, number_beds, floor_number, 
                                                    phone_number, cost_day_usd, department_id) 
                                      VALUES (?, ?, ?, ?, ?, ?, ?)');
    
    $insert_query->bind_param('iisdsii', $room_number, $is_vip, $number_beds, $floor_number, 
                              $phone_number, $cost_day_usd, $department_id);

    if ($insert_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Room added successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Failed to add room";
    }

    $insert_query->close();
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
