<?php
$landing = $landing ?? ['id'=>null,'cliente_id'=>null,'slug'=>'','titulo'=>'','descripcion'=>''];
$clientes = $clientes ?? [];
?>
<div class="mb-3">
  <label class="form-label">Cliente</label>
  <select name="cliente_id" class="form-select">
    <option value="">— Sin cliente —</option>
    <?php foreach ($clientes as $c): ?>
      <option value="<?= (int)$c['id'] ?>" <?= ($landing['cliente_id']??null)==$c['id']?'selected':'' ?>><?= e($c['nombre']) ?></option>
    <?php endforeach; ?>
  </select>
</div>
<div class="mb-3">
  <label class="form-label">Slug</label>
  <input type="text" name="slug" class="form-control" value="<?= e($landing['slug'] ?? '') ?>" placeholder="mi-landing">
</div>
<div class="mb-3">
  <label class="form-label">Título</label>
  <input type="text" name="titulo" class="form-control" value="<?= e($landing['titulo'] ?? '') ?>">
</div>
<div class="mb-3">
  <label class="form-label">Descripción</label>
  <textarea name="descripcion" class="form-control" rows="4"><?= e($landing['descripcion'] ?? '') ?></textarea>
</div>
