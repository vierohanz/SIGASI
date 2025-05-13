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
        Schema::create('data_geo', function (Blueprint $table) {
            $table->id();
            $table->integer('tahun_id');
            $table->foreign('tahun_id')->references('id')->on('tahun')->cascadeOnUpdate()->cascadeOnDelete();
            $table->integer('kota_id');
            $table->foreign('kota_id')->references('id')->on('kota')->cascadeOnUpdate()->cascadeOnDelete();
            $table->float('prevalensi_stunting')->nullable(false);
            // $table->float('shape_area');
            // $table->float('shape_long');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('data_geo');
    }
};
