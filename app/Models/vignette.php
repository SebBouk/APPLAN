<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class vignette extends Model
{
    use HasFactory;

    public function jeux()
    {
        return $this->belongsTo(Jeu::class);
    }
}
