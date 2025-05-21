<?php 
session_start();
//connect.php
$server	    = 'localhost:3306';
$username	= 'root';
$password	= '123.com';
$database	= 'db_forum';

$conn = mysqli_connect($server, $username, $password, $database);
// Check connection
if (!$conn) {
    exit('Error: could not establish database connection');
}
// Select database
if (!mysqli_select_db($conn, $database)) {
    exit('Error: could not select the database');
}

$_SESSION['conn'] =  $conn;