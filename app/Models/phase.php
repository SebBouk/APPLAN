<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class phase extends Model
{
    use HasFactory;

    public function joueurs()
    {
        return $this->hasMany(joueur::class);
    }
    
    public function objectifs()
    {
        return $this->morphedToMany(objectif::class);
    }
    
    public function jeux()
    {
        return $this->morphedToMany(jeu::class);
    }
}
