<?php $title='Editar landing'; ob_start(); ?>
<h1 class="h4 mb-3">Editar landing</h1>
<form method="post" action="/admin/landings/update">
  <input type="hidden" name="id" value="<?= (int)($landing['id'] ?? 0) ?>">
  <?php include __DIR__.'/_form.php'; ?>
  <button class="btn btn-primary">Actualizar</button>
  <a href="/admin/landings" class="btn btn-link">Cancelar</a>
</form>
<?php $content=ob_get_clean(); include __DIR__.'/../layouts/base.php'; ?>
