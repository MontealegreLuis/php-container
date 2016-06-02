#!/usr/bin/env php
<?php
try {
    echo "Database name:";
    $databaseName = trim(fgets(STDIN));
    echo "Database user:";
    $databaseUser = trim(fgets(STDIN));
    $databasePassword = read_password('Database password:');
    $confirmPassword = read_password('Confirm password:');
    if ($databasePassword !== $confirmPassword) {
        fwrite(STDERR, "Passwords do not match");
        exit(1);
    }
    $connection = new PDO('mysql:host=codeup_db', 'root', 'codeup', [
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ]);
    $drop = "DROP DATABASE IF EXISTS `$databaseName`";
    $create = "CREATE DATABASE `$databaseName` DEFAULT CHARACTER SET = utf8 COLLATE = utf8_general_ci";
    $grant = "GRANT ALL PRIVILEGES on `$databaseName`.* TO `$databaseUser`@localhost IDENTIFIED BY '$databasePassword'";

    $connection->exec($drop);
    $connection->exec($create);
    $connection->exec($grant);

} catch (PDOException $e) {
    echo $e;
}

function read_password($prompt) {
    $command = "/usr/bin/env bash -c 'echo OK'";
    if (rtrim(shell_exec($command)) !== 'OK') {
        fwrite(STDERR, "Can't invoke bash");
        exit(1);
    }
    $command = "/usr/bin/env bash -c 'read -s -p \""
        . addslashes($prompt)
        . "\" mypassword && echo \$mypassword'";
    $password = rtrim(shell_exec($command));
    echo "\n";
    return $password;
}
