<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class joueur extends Model
{
    use HasFactory;

    public function phases()
    {
        return $this->belongsTo(phase::class);
    }

    public function users()
    {
        return $this->hasOne(user::class);
    }
}
