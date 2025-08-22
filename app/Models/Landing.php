<?php
namespace App\Models;

final class Landing extends Model {
    public function allWithCliente(): array {
        $sql = 'SELECT l.*, c.nombre AS nombre_cliente
                FROM landings l
                LEFT JOIN clientes c ON c.id = l.cliente_id
                ORDER BY l.fecha_actualizado DESC';
        return $this->db->query($sql)->fetchAll();
    }

    public function find(int $id): ?array {
        $st = $this->db->prepare('SELECT * FROM landings WHERE id = ?');
        $st->execute([$id]);
        $row = $st->fetch();
        return $row ?: null;
    }

    public function findBySlug(string $slug): ?array {
        $st = $this->db->prepare('SELECT * FROM landings WHERE slug = ? LIMIT 1');
        $st->execute([$slug]);
        $row = $st->fetch();
        return $row ?: null;
    }

    public function create(array $data): void {
        $st = $this->db->prepare('INSERT INTO landings (cliente_id, slug, titulo, descripcion, fecha_creado, fecha_actualizado)
                                  VALUES (?, ?, ?, ?, NOW(), NOW())');
        $st->execute([
            $data['cliente_id'] ?? null,
            $data['slug'] ?? null,
            $data['titulo'] ?? '',
            $data['descripcion'] ?? ''
        ]);
    }

    public function update(int $id, array $data): void {
        $st = $this->db->prepare('UPDATE landings SET cliente_id=?, slug=?, titulo=?, descripcion=?, fecha_actualizado=NOW() WHERE id=?');
        $st->execute([
            $data['cliente_id'] ?? null,
            $data['slug'] ?? null,
            $data['titulo'] ?? '',
            $data['descripcion'] ?? '',
            $id
        ]);
    }

    public function delete(int $id): void {
        $st = $this->db->prepare('DELETE FROM landings WHERE id = ?');
        $st->execute([$id]);
    }
}
