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
        Schema::create('joueurs', function (Blueprint $table) {
            $table->unsignedBigInteger('login_id');
            $table->foreign('login_id')->references('login')->on('utilisateur')->primary();
            $table->string('prenom');
            $table->string('nom');
            $table->text('urlTwitch');
            $table->text('urlYoutube');
            $table->text('description');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('joueurs');
    }
};
