<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class objectif extends Model
{
    use HasFactory;

    public function jeux()
    {
        return $this->morphedToMany(jeu::class);
    }

    public function phases()
    {
        return $this->morphedToMany(phase::class);    
    }
}