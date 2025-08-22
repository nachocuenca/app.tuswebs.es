<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= e($title ?? 'APP-WEBS') ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/css/app.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container">
    <a class="navbar-brand" href="/">APP-WEBS</a>
    <div class="d-flex">
      <?php if (!empty($_SESSION['usuario_id'])): ?>
        <form action="/logout" method="post"><button class="btn btn-sm btn-outline-danger">Salir</button></form>
      <?php else: ?>
        <a class="btn btn-sm btn-primary" href="/login">Entrar</a>
      <?php endif; ?>
    </div>
  </div>
</nav>
<main class="container py-4">
  <?= $content ?? '' ?>
</main>
<script src="/assets/js/app.js"></script>
</body>
</html>
