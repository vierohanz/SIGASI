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
        Schema::create('pengukuran_gizi', function (Blueprint $table) {
            $table->id();
            $table->integer('balita_id')->nullable(false);
            $table->foreign('balita_id')->references('id')->on('balita')->cascadeOnUpdate()->cascadeOnDelete();
            $table->date('tanggal_pengukuran')->nullable(false);
            $table->integer('umur_bulan')->nullable(false);
            $table->float('berat_badan')->nullable(false);
            $table->float('tinggi_badan')->nullable(false);
            $table->float('lingkar_lengan')->nullable(false);
            $table->float('z_score_bb_u')->nullable(false);
            $table->float('z_score_tb_u')->nullable(false);
            $table->float('z_score_bb_tb')->nullable(false);
            $table->enum('weight_for_age', ['Normal', 'Underweight', 'Severely Underweight'])->nullable(false);
            $table->enum('height_for_age', ['Normal', 'Stunted', 'Severely Stunted'])->nullable(false);
            $table->enum('weight_for_height', ['Obesitas', 'Gemuk', 'Normal', 'Gizi Kurang', 'Gizi Buruk'])->nullable(false);
            $table->string('petugas')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pengukuran_gizi');
    }
};
