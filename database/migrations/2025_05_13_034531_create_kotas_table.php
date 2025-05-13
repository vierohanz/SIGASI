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
        Schema::create('kota', function (Blueprint $table) {
            $table->id();
            $table->string('kode_kota')->unique()->nullable(false);
            $table->string('nama_kota')->nullable(false);
            $table->string('kode_negara')->nullable(false);
            $table->string('nama_negara')->nullable(false);
            $table->string('kode_provinsi')->nullable(false);
            $table->string('nama_provinsi')->nullable(false);
            $table->float('shape_leng')->nullable(false);
            $table->float('shape_area')->nullable(false);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kota');
    }
};
