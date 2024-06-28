@extends('app')

@section('content')
    <form action="{{ route('joueurs.store') }}" method="POST">
        @csrf
        <li><input type="id" name="login" placeholder="Login"></li>
        <li><input type="password" name="mdp" placeholder="Mot de passe"></li>
        <li><input type="text" name="prenom" placeholder="Prénom"></li>
        <li><input type="text" name="nom" placeholder="Nom"></li>
        <li><input type="text" name="urlTwitch" placeholder="Url Twitch"></li>
        <li><input type="text" name="urlYoutube" placeholder="Url YouTube"></li>
        <li><input type="text" name="description" placeholder="Description"></li>
        <li><button type="submit">Créer</button></li>
    </form>
@endsection
