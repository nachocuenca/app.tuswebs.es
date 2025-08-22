<?php
namespace App\Models;

final class Cliente extends Model {
    public function all(): array {
        return $this->db->query('SELECT * FROM clientes ORDER BY nombre')->fetchAll();
    }
}
