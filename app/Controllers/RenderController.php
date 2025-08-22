<?php
namespace App\Controllers;
use App\Models\Landing;

final class RenderController {
    public function bySlug(): void {
        $slug = $_GET['s'] ?? '';
        $landing = (new Landing())->findBySlug($slug);
        view('render/show', compact('landing'));
    }
}
