<?php
namespace App\Models;

final class Usuario extends Model {
    public function findByEmail(string $email): ?array {
        $st = $this->db->prepare('SELECT * FROM usuarios WHERE email = ? LIMIT 1');
        $st->execute([$email]);
        $row = $st->fetch();
        return $row ?: null;
    }
}
