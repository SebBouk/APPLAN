@extends('app')

@section('content')
    @foreach ($users as $user)
        {{ $user->login }}
    @endforeach
@endsection
