<?php
class faculty {

    public $email;
    public $password;
    private $pdo;

    function __construct($db) {
        $this->pdo = $db->connect();
    }

    function get_adviser($username) {
        $sql = "SELECT * FROM adviser
        JOIN users ON adviser.user_id = users.ids
        WHERE email = :email
        LIMIT 1;";

        $query = $this->pdo->prepare($sql);

        $query->bindParam(':email', $username);
        
        if ($query->execute()) {
            $data = $query->fetch(PDO::FETCH_ASSOC);
            if ($data) {
                session_start();
                $_SESSION['ids'] = $data['ids'];
                $_SESSION['last_name'] = $data['last_name'];
                $_SESSION['first_name'] = $data['first_name'];
                $_SESSION['middle_name'] = $data['middle_name'];

                return true; 
            }
        }
        
        return false;
    }

    function get_guidance($username) {
        $sql = "SELECT * FROM adviser
        JOIN users ON adviser.user_id = users.ids
        WHERE email = :email
        LIMIT 1;";

        $query = $this->pdo->prepare($sql);

        $query->bindParam(':email', $username);
        
        if ($query->execute()) {
            $data = $query->fetch(PDO::FETCH_ASSOC);
            if ($data) {
                session_start();
                $_SESSION['ids'] = $data['ids'];
                $_SESSION['last_name'] = $data['last_name'];
                $_SESSION['first_name'] = $data['first_name'];
                $_SESSION['middle_name'] = $data['middle_name'];

                return true; 
            }
        }
        
        return false;
    }
    
    function get_prof($username) {
        $sql = "SELECT * FROM professors
        JOIN users ON professors.user_id = users.ids
        WHERE email = :email
        LIMIT 1;";

        $query = $this->pdo->prepare($sql);

        $query->bindParam(':email', $username);
        
        if ($query->execute()) {
            $data = $query->fetch(PDO::FETCH_ASSOC);
            if ($data) {
                session_start();
                $_SESSION['ids'] = $data['ids'];
                $_SESSION['last_name'] = $data['last_name'];
                $_SESSION['first_name'] = $data['first_name'];
                $_SESSION['middle_name'] = $data['middle_name'];

                return true; 
            }
        }
       
        return false;
    }

    function get_type($id){
        $sql = "SELECT user_type FROM users WHERE ids = :id";

        $query = $this->pdo->prepare($sql);

        $query->bindParam(":id", $id); 
        $data = null;

        if ($query->execute()) {
            $data = $query->fetchColumn();  
        }
        return $data;
    }

    function get_dept() {
        $sql = "SELECT department.name as Name, COALESCE(COUNT(excuse_letter.id), 0) as Count
        FROM department
        LEFT JOIN sections ON department.id = sections.department_id
        LEFT JOIN student ON student.sections_id = sections.id
        LEFT JOIN excuse_letter ON student.student_id = excuse_letter.student_id
        GROUP BY department.id, Name ";

        $query = $this->pdo->prepare($sql);

        $data = null;

        if($query->execute()) {
            $data = $query->fetchAll();
        }
        return $data;
    }

    function get_total_year($subject) {
        $sql = "SELECT year_level FROM sections LEFT JOIN department ON department.id = sections.department_id WHERE department.name LIKE :name ORDER BY year_level ASC";

        $query = $this->pdo->prepare($sql);
        $query->bindParam(":name", $subject); 
        $data = null;

        if($query->execute()) {
            $data = $query->fetchAll();
        }
        return $data;
    }

    function get_course() {
        $sql = "SELECT * FROM course";

        $query = $this->pdo->prepare($sql);

        $data = null;

        if($query->execute()) {
            $data = $query->fetchAll();
        }
        return $data;
    }
    
}