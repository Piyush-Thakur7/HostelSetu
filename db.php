<?php
// db.php - Central Database Connection Wrapper for HostelSetu
// Uses PHP Data Objects (PDO) with Prepared Statements for SQL Injection Immunity

$host = '127.0.0.1';
$port = '3306';
$dbname = 'hostelsetu_db';
$user = 'root';
$pass = ''; // Default XAMPP/local password is empty. Change here if MySQL has a password.

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4", $user, $pass, $options);
} catch (PDOException $e) {
    // If database doesn't exist yet, attempt connecting to MySQL server to notify gracefully
    try {
        $pdoServer = new PDO("mysql:host=$host;port=$port;charset=utf8mb4", $user, $pass, $options);
        die("<div style='font-family:sans-serif;padding:30px;background:#fef2f2;border:2px solid #ef4444;border-radius:10px;margin:30px;'>"
            . "<h2 style='color:#b91c1c;'>HostelSetu Database Not Initialized</h2>"
            . "<p>The MySQL server is running, but <code>hostelsetu_db</code> was not found.</p>"
            . "<p><strong>Quick Fix for Dimple:</strong> Import <code>database/schema.sql</code> into phpMyAdmin or run it in MySQL.</p>"
            . "</div>");
    } catch (PDOException $e2) {
        die("<div style='font-family:sans-serif;padding:30px;background:#fef2f2;border:2px solid #ef4444;border-radius:10px;margin:30px;'>"
            . "<h2 style='color:#b91c1c;'>Database Connection Error</h2>"
            . "<p>" . htmlspecialchars($e->getMessage()) . "</p>"
            . "<p>Ensure MySQL is running on port 3306 and check username/password in <code>db.php</code>.</p>"
            . "</div>");
    }
}
?>
