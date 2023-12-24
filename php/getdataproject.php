<?php

header('Access-Control-Allow-Origin: *');


$connection = new mysqli("localhost", "root", "", "db_akademik");
$data       = mysqli_query($connection, "select * from project");
$data       = mysqli_fetch_all($data, MYSQLI_ASSOC);

echo json_encode($data);
