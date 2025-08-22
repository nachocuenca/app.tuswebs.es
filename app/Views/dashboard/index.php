<?php $title='Dashboard'; ob_start(); ?>
<div class="d-flex justify-content-between align-items-center mb-3">
  <h1 class="h4">Dashboard</h1>
  <a class="btn btn-success" href="/admin/landings/create">Nueva landing</a>
</div>
<p class="text-muted">Bienvenido a APP-WEBS. Usa el menú para gestionar landings.</p>
<?php $content=ob_get_clean(); include __DIR__.'/../layouts/base.php'; ?>
