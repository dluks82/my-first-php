<?php
$servername = getenv('DB_HOST');
$username = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
$dbname = getenv('DB_NAME');

// Conecta ao banco de dados PostgreSQL
$conn = pg_connect("host=$servername dbname=$dbname user=$username password=$password");

if (!$conn) {
  die("Connection failed: " . pg_last_error());
}

// Consulta de exemplo
$result = pg_query($conn, "SELECT * FROM example_table");

if (!$result) {
  echo "An error occurred.\n";
  exit;
}

while ($row = pg_fetch_assoc($result)) {
  echo "id: " . $row["id"] . " - Name: " . $row["name"] . "<br>";
}

pg_close($conn);
