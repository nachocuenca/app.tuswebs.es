<?php
namespace App\Controllers;

final class DashboardController {
    public function index(): void {
        view('dashboard/index', []);
    }
}
