<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class joueur extends Model
{
    use HasFactory;

    protected $fillable = [
        'prenom',
        'nom',
        'urlTwitch',
        'urlYoutube',
        'description',
        'login_id'
    ];
    public $timestamps = false; // Désactive les timestamps automatiques

    public function phases()
    {
        return $this->belongsTo(phase::class);
    }

    public function users()
    {
        return $this->belongsTo(user::class, 'login_id', 'idUser');
    }
}
