<?php

namespace App\Http\Controllers;

use App\Models\joueur;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class Joueurs extends Controller
{
    public function index()
    {

        $joueurs = joueur::all();
        $user = user::all();

        return view('joueurs.index', [
            'joueurs' => $joueurs,
            'login'=>$user
        ]);
    }

    public function create()
    {
        return view('joueurs.create');
    }

    public function store(Request $request)
    {

        $user = User::create([
            'login' => $request->input('login'),
            'mdp' => Hash::make($request->input('mdp')),
        ]);

        joueur::create([
            'prenom' => $request->input('prenom'),
            'nom' => $request->input('nom'),
            'urlTwitch' => $request->input('urlTwitch'),
            'urlYoutube' => $request->input('urlYoutube'),
            'description' => $request->input('description'),
            'login-id' => $user->idUser,
        ]);

        return redirect()->route('joueurs.index')-> with('success','Joueur et utilisateur créés avec succès');
    }
}
