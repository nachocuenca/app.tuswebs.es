<?php
declare(strict_types=1);

use Dotenv\Dotenv;

require __DIR__ . '/../vendor/autoload.php';

$dotenv = Dotenv::createImmutable(dirname(__DIR__));
$dotenv->load();

ini_set('display_errors', ($_ENV['APP_DEBUG'] ?? 'false') === 'true' ? '1' : '0');
error_reporting(E_ALL);
date_default_timezone_set($_ENV['TIMEZONE'] ?? 'Europe/Madrid');

if (session_status() === PHP_SESSION_NONE) {
    session_name($_ENV['SESSION_NAME'] ?? 'APPWEBSSESSID');
    session_start();
}

require __DIR__ . '/paths.php';
require __DIR__ . '/../app/Support/Helpers.php';
require __DIR__ . '/database.php';
