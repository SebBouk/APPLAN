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
        Schema::create('point_objectif', function (Blueprint $table) {
            $table->unsignedBigInteger('jeu_id');
            $table->foreign('jeu_id')->references('nomJeu')->on('jeux');
            $table->unsignedBigInteger('phase_id');
            $table->foreign('phase_id')->references('nomPhase')->on('phase');
            $table->unsignedBigInteger('objectif_id');
            $table->foreign('objectif_id')->references('id')->on('objectifs');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('point_objectif');
    }
};
