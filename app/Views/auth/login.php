<?php $title='Acceder'; ob_start(); ?>
<div class="row justify-content-center">
  <div class="col-md-4">
    <div class="card shadow-sm">
      <div class="card-body">
        <h1 class="h4 mb-3">Iniciar sesión</h1>
        <?php if($e=flash('error')): ?><div class="alert alert-danger"><?= e($e) ?></div><?php endif; ?>
        <form method="post" action="/login">
          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required autofocus>
          </div>
          <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <input type="password" name="password" class="form-control" required>
          </div>
          <button class="btn btn-primary w-100">Acceder</button>
        </form>
      </div>
    </div>
  </div>
</div>
<?php $content=ob_get_clean(); include __DIR__.'/../layouts/base.php'; ?>
