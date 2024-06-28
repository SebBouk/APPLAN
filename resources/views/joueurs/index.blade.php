@extends('app')

@section('content')
    @foreach ($joueurs as $joueur)
        {{ $joueur->nom }}{{ $joueur->user->login }}
    @endforeach
@endsection
