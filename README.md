# app.tuswebs.es

Landing builder en PHP 8.2 con Bootstrap 5.

## Requisitos
- PHP 8.2+
- Composer
- MySQL/MariaDB

## Instalación
```bash
composer install
cp .env.example .env
# Ajusta credenciales DB en .env

Configura tu servidor para apuntar a public/ como DocumentRoot.
En local puedes usar:

php -S localhost:8000 -t public

Migraciones

Ejecuta los .sql de migrations/ en tu base de datos.
Acceso

Crea un usuario en usuarios con password hasheado por password_hash($plain, PASSWORD_DEFAULT).
