<?php
declare(strict_types=1);
require __DIR__ . '/../config/bootstrap.php';

use App\Support\Router;

$router = new Router();
require __DIR__ . '/../app/Routes/web.php';

$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH) ?: '/';
$router->dispatch($_SERVER['REQUEST_METHOD'], rtrim($path, '/') ?: '/');
