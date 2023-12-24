
<?php

header('Access-Control-Allow-Origin: *');

$connection = new mysqli("localhost", "root", "", "db_akademik");
$nama      = $_POST['nama'];
$nrp    = $_POST['nrp'];
$email    = $_POST['email'];
$jurusan    = $_POST['jurusan'];
$id         = $_POST['id'];

$result = mysqli_query($connection, "update mahasiswa set nama='$nama', nrp='$nrp', email='$email', jurusan='$jurusan' where id='$id'");

if ($result) {
    echo json_encode([
        'message' => 'Data edit successfully'
    ]);
} else {
    echo json_encode([
        'message' => 'Data Failed to update'
    ]);
}
