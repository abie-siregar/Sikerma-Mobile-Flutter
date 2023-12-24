<?php

header('Access-Control-Allow-Origin: *');

$connection = new mysqli("localhost", "root", "", "db_akademik");
$nama      = $_POST['nama'];
$nrp    = $_POST['nrp'];
$email    = $_POST['email'];
$jurusan    = $_POST['jurusan'];


$result = mysqli_query($connection, "insert into mahasiswa set nama='$nama', nrp='$nrp', email='$email', jurusan='$jurusan'");

if ($result) {
    echo json_encode([
        'message' => 'Data input successfully'
    ]);
} else {
    echo json_encode([
        'message' => 'Data Failed to input'
    ]);
}
