<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('joue', function (Blueprint $table) {
            $table->unsignedBigInteger('joueur_id');
            $table->foreign('joueur_id')->references('login')->on('joueur');
            $table->unsignedBigInteger('phase_id');
            $table->foreign('phase_id')->references('nomPhase')->on('phase');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('joue');
    }
};
