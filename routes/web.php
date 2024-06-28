<?php

use App\Http\Controllers\Controller;
use App\Http\Controllers\Joueurs;
use App\Models\joueur;
use Illuminate\Support\Facades\Route;

Route::view('/','index');
Route::get('/joueurs',[\App\Http\Controllers\Joueurs::class,'index'])->name('joueurs.index');
Route::get('/users',[App\Http\Controllers\Users::class,'index'])->name('users.index');
Route::post('/joueurs',[\App\Http\Controllers\Joueurs::class,'store'])->name('joueurs.store');
Route::get('/joueurs/create',[\App\Http\Controllers\Joueurs::class,'create'])->name('joueurs.create');