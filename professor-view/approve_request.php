<?php
require_once '../databases/connect.php';

$data = json_decode(file_get_contents('php://input'), true);

$excuse_letter_id = $data['excuse_letter_id'] ?? null;
$date = $data['date'] ?? null;
$approval = $data['approval'] ?? null;

if (!$excuse_letter_id || !$approval) {
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

        $stmt = $pdo->prepare("UPDATE excuse_letter SET prof_awknowledge = :prof_awknowledge, approval_date = :approval_date WHERE id = :id");

        $stmt->bindParam(":prof_awknowledge", $approval);
        $stmt->bindParam(":approval_date", $date);
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