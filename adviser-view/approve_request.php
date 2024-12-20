<?php
require_once '../databases/connect.php';
require_once '../functions/functions.php';

$data = json_decode(file_get_contents('php://input'), true);

$excuse_letter_id = clean_input($data['excuse_letter_id'] ?? null);
$adviser_id = clean_input($data['adviser_id'] ?? null);
$date = clean_input($data['date'] ?? null);
$approval = clean_input($data['approval'] ?? null);

if (!$excuse_letter_id || !$adviser_id || !$approval) {
    echo json_encode([
        'success' => false,
        'message' => 'Missing required data!'
    ]);
    exit;
}

    try {
        // Initialize database connection
        $db = new Database();
        $pdo = $db->connect();

        $stmt = $pdo->prepare("UPDATE approval SET noted_adviser = :noted_adviser, approved_adviser = :approved_adviser, date_adviser_approved = :date_adviser_approved WHERE id = :id ");

        $stmt->bindParam(":noted_adviser", $adviser_id);
        $stmt->bindParam(":approved_adviser", $approval);
        $stmt->bindParam(":date_adviser_approved", $date);
        $stmt->bindParam(":id", $excuse_letter_id);

        $stmt->execute();
        
        if ($stmt->rowCount()) {
            echo json_encode([
                'success' => true,
                'message' => 'Request processed successfully'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Failed to process the request'
            ]);
        }
    
    } catch (PDOException $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Database error: ' . $e->getMessage()
        ]);
    }
?>