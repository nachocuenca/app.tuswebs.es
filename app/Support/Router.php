<?php
namespace App\Support;

final class Router {
    private array $routes = ['GET'=>[], 'POST'=>[]];

    public function get(string $path, array $handler): void { $this->routes['GET'][$path] = $handler; }
    public function post(string $path, array $handler): void { $this->routes['POST'][$path] = $handler; }

    private function run(array $handler): void {
        [$class, $method] = $handler;
        (new $class())->{$method}();
    }

    public function dispatch(string $method, string $path): void {
        $handler = $this->routes[$method][$path] ?? null;
        if (!$handler) {
            http_response_code(404);
            echo '404 — Not Found';
            return;
        }
        $this->run($handler);
    }
}
