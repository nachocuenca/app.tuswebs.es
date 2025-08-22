<?php
$landing = $landing ?? null;
$title = $landing ? ($landing['titulo'] ?? 'Landing') : 'Landing no encontrada';
ob_start();
?>
<?php if(!$landing): ?>
  <div class="alert alert-warning">No se encontró la landing solicitada.</div>
<?php else: ?>
  <div class="py-5 text-center">
    <h1 class="display-5"><?= e($landing['titulo'] ?? '') ?></h1>
    <p class="lead"><?= e($landing['descripcion'] ?? '') ?></p>
  </div>
<?php endif; ?>
<?php $content=ob_get_clean(); include __DIR__.'/../layouts/base.php'; ?>
