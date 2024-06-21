<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jeu extends Model
{
    use HasFactory;

    public function categories()
    {
        return $this->belongsToMany(categorie::class);
    }

    public function vignettes()
    {
        return $this->hasMany(vignette::class);
    }

    public function objectifs()
    {
        return $this->belongsToMany(objectif::class);
    }
}
