<?php

use App\Http\Controllers\mapsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/getMap', [mapsController::class, 'getMap'])->name('getMaps');
Route::get('/getMap', [mapsController::class, 'getMapByTahun'])->name('getMapByTahun');
