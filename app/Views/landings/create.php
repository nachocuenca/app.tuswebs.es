<?php $title='Nueva landing'; ob_start(); ?>
<h1 class="h4 mb-3">Nueva landing</h1>
<form method="post" action="/admin/landings">
  <?php include __DIR__.'/_form.php'; ?>
  <button class="btn btn-success">Guardar</button>
  <a href="/admin/landings" class="btn btn-link">Cancelar</a>
</form>
<?php $content=ob_get_clean(); include __DIR__.'/../layouts/base.php'; ?>
