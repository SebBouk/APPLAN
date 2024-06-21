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
        Schema::create('correspond', function (Blueprint $table) {
            $table->unsignedBigInteger('jeu_id');
            $table->foreign('jeu_id')->references('nomJeu')->on('jeux');
            $table->unsignedBigInteger('cat_id');
            $table->foreign('cat_id')->references('nomCat')->on('categorie');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('correspond');
    }
};
