<?php 
$db_server = getenv('MYSQL_HOST'); 
$db_name = getenv('MYSQL_DATABASE');  
$db_user = getenv('MYSQL_USER'); 
$db_password = getenv('MYSQL_PASSWORD'); 
$no_of_records_per_page = 10; 
$appname = 'IFSCrud'; 

$link = mysqli_connect($db_server, $db_user, $db_password, $db_name); 
$query = "SHOW VARIABLES LIKE 'character_set_database'";
if ($result = mysqli_query($link, $query)) {
    while ($row = mysqli_fetch_row($result)) {
        if (!$link->set_charset($row[1])) {
            printf("Error loading character set $row[1]: %s\n", $link->error);
            exit();
        } else {
            // printf("Current character set: %s", $link->character_set_name());
        }
    }
}

?>
