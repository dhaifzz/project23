<?php
require_once '../databases/connect.php';

// Check if subject is provided
if (isset($_GET['subject'])) {
    $subject = trim($_GET['subject']);
        
    try {
        // Initialize database connection
        $db = new Database();
        $pdo = $db->connect();

        // Prepare and execute query
        $stmt = $pdo->prepare("SELECT id FROM subject WHERE acronym = :subject LIMIT 1");
        $stmt->execute([':subject' => $subject]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        // Return JSON response
        if ($result) {
            echo json_encode([
                'success' => true,
                'course_id' => $result['id']
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Course not found'
            ]);
        }
    } catch (PDOException $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Database error: ' . $e->getMessage()
        ]);
    }
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Invalid request: Subject not provided'
    ]);
}
