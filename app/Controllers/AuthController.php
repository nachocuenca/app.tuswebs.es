<?php
namespace App\Controllers;
use App\Models\Usuario;

final class AuthController {
    public function showLogin(): void { view('auth/login'); }

    public function login(): void {
        $email = trim($_POST['email'] ?? '');
        $password = $_POST['password'] ?? '';
        $user = (new Usuario())->findByEmail($email);
        if ($user && password_verify($password, $user['password'])) {
            $_SESSION['usuario_id'] = $user['id'];
            $_SESSION['rol'] = $user['rol'] ?? 'admin';
            redirect('/');
        }
        flash('error', 'Credenciales inválidas');
        redirect('/login');
    }

    public function logout(): void {
        session_destroy();
        redirect('/login');
    }
}
