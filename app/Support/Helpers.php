<?php
function view(string $path, array $vars = []): void {
    extract($vars, EXTR_SKIP);
    include APP_PATH . '/Views/' . str_replace('.', '/', $path) . '.php';
}
function redirect(string $to): void { header('Location: '.$to); exit; }
function flash(string $key, ?string $val=null) {
    if ($val !== null) { $_SESSION['flash'][$key] = $val; return; }
    $v = $_SESSION['flash'][$key] ?? null; unset($_SESSION['flash'][$key]); return $v;
}
function e(?string $v): string { return htmlspecialchars($v ?? '', ENT_QUOTES, 'UTF-8'); }
