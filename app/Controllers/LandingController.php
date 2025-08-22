<?php
namespace App\Controllers;
use App\Models\{Landing, Cliente};

final class LandingController {
    private function requireAuth(): void {
        if (!isset($_SESSION['usuario_id'])) redirect('/login');
    }

    public function index(): void {
        $this->requireAuth();
        $landings = (new Landing())->allWithCliente();
        view('landings/index', compact('landings'));
    }

    public function create(): void {
        $this->requireAuth();
        $clientes = (new Cliente())->all();
        view('landings/create', compact('clientes'));
    }

    public function store(): void {
        $this->requireAuth();
        (new Landing())->create($_POST);
        redirect('/admin/landings');
    }

    public function edit(): void {
        $this->requireAuth();
        $id = (int)($_GET['id'] ?? 0);
        $landing = (new Landing())->find($id);
        $clientes = (new Cliente())->all();
        view('landings/edit', compact('landing', 'clientes'));
    }

    public function update(): void {
        $this->requireAuth();
        (new Landing())->update((int)($_POST['id'] ?? 0), $_POST);
        redirect('/admin/landings');
    }

    public function delete(): void {
        $this->requireAuth();
        (new Landing())->delete((int)($_POST['id'] ?? 0));
        redirect('/admin/landings');
    }
}
