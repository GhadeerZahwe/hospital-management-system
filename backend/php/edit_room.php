<?php
include('connection.php');

$response = array(); // Initialize the response array

if (
    isset($_POST['room_id']) &&
    isset($_POST['room_number']) &&
    isset($_POST['is_vip']) &&
    isset($_POST['number_beds']) &&
    isset($_POST['floor_number']) &&
    isset($_POST['phone_number']) &&
    isset($_POST['cost_day_usd']) &&
    isset($_POST['department_id'])
) {
    $room_id = $_POST['room_id'];
    $room_number = $_POST['room_number'];
    $is_vip = $_POST['is_vip'];
    $number_beds = $_POST['number_beds'];
    $floor_number = $_POST['floor_number'];
    $phone_number = $_POST['phone_number'];
    $cost_day_usd = $_POST['cost_day_usd'];
    $department_id = $_POST['department_id'];

    $edit_query = $mysqli->prepare('UPDATE rooms SET 
                                    room_number = ?, 
                                    is_vip = ?, 
                                    number_beds = ?, 
                                    floor_number = ?, 
                                    phone_number = ?, 
                                    cost_day_usd = ?, 
                                    department_id = ? 
                                    WHERE id = ?');
    $edit_query->bind_param('iiisisii', $room_number, $is_vip, $number_beds, $floor_number, $phone_number, $cost_day_usd, $department_id, $room_id);

    if ($edit_query->execute()) {
        $response['status'] = "success";
        $response['message'] = "Room updated successfully";
    } else {
        $response['status'] = "failed";
        $response['message'] = "Error updating room. Please try again later.";
    }
} else {
    $response['status'] = "failed";
    $response['message'] = "Incomplete POST data";
}

echo json_encode($response);
?>
