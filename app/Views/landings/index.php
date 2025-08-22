<?php $title='Landings'; ob_start(); ?>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h1 class="h4">Landings</h1>
  <a class="btn btn-primary" href="/admin/landings/create">Crear</a>
</div>

<table class="table table-striped align-middle">
  <thead><tr>
    <th>ID</th><th>Cliente</th><th>Título</th><th>Slug</th><th class="text-end">Acciones</th>
  </tr></thead>
  <tbody>
  <?php foreach ($landings as $l): ?>
    <tr>
      <td><?= (int)$l['id'] ?></td>
      <td><?= e($l['nombre_cliente'] ?? '') ?></td>
      <td><?= e($l['titulo'] ?? '') ?></td>
      <td><?= e($l['slug'] ?? '') ?></td>
      <td class="text-end">
        <a class="btn btn-sm btn-outline-secondary" href="/admin/landings/edit?id=<?= (int)$l['id'] ?>">Editar</a>
        <form action="/admin/landings/delete" method="post" class="d-inline">
          <input type="hidden" name="id" value="<?= (int)$l['id'] ?>">
          <button class="btn btn-sm btn-outline-danger" onclick="return confirm('¿Eliminar?')">Eliminar</button>
        </form>
      </td>
    </tr>
  <?php endforeach; ?>
  </tbody>
</table>
<?php $content=ob_get_clean(); include __DIR__.'/../layouts/base.php'; ?>
