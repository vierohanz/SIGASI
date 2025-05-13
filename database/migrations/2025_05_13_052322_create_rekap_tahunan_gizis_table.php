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
        Schema::create('rekap_tahunan_gizi', function (Blueprint $table) {
            $table->id();
            $table->integer('pengukuran_gizi_id')->nullable(false);
            $table->foreign('pengukuran_gizi_id')->references('id')->on('pengukuran_gizi')->cascadeOnUpdate()->cascadeOnDelete();
            $table->string('kota');
            $table->integer('tahun');
            $table->integer('jumlah_pengukuran');
            $table->float('rata_berat_badan');
            $table->float('rata_tinggi_badan');
            $table->float('rata_lingkaran_badan');
            $table->float('rata_z_score_bb_u');
            $table->float('rata_z_score_tb_u');
            $table->float('rata_z_score_bb_tb');
            $table->string('status_gizi_tahunan');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rekap_tahunan_gizi');
    }
};
