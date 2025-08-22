<?php
use App\Controllers\{AuthController, DashboardController, LandingController, RenderController};

$router->get('/', [DashboardController::class, 'index']);

// Auth
$router->get('/login', [AuthController::class, 'showLogin']);
$router->post('/login', [AuthController::class, 'login']);
$router->post('/logout', [AuthController::class, 'logout']);

// Landings CRUD (admin)
$router->get('/admin/landings', [LandingController::class, 'index']);
$router->get('/admin/landings/create', [LandingController::class, 'create']);
$router->post('/admin/landings', [LandingController::class, 'store']);
$router->get('/admin/landings/edit', [LandingController::class, 'edit']);   // ?id=#
$router->post('/admin/landings/update', [LandingController::class, 'update']);
$router->post('/admin/landings/delete', [LandingController::class, 'delete']);

// Render público por slug
$router->get('/w', [RenderController::class, 'bySlug']); // ?s=mi-slug
