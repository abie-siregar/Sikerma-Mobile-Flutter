<?php

$connect = new mysqli("localhost", "root", "", "db_akademik");

if ($connect) {
    echo "Connection Succes";
} else {
    echo "Connection Failed";
    exit();
}
?>