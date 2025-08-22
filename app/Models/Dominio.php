<?php
namespace App\Models;

final class Dominio extends Model {
    public function landingByHost(string $host): ?array {
        $st = $this->db->prepare('SELECT l.* FROM dominios d JOIN landings l ON l.id=d.landing_id WHERE d.host = ? AND d.activo = 1 LIMIT 1');
        $st->execute([$host]);
        $row = $st->fetch();
        return $row ?: null;
    }
}
