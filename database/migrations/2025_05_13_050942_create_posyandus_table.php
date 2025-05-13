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
        Schema::create('posyandu', function (Blueprint $table) {
            $table->id();
            $table->integer('kota_id');
            $table->foreign('kota_id')->references('id')->on('kota')->cascadeOnUpdate()->cascadeOnDelete();
            $table->integer('jumlah_posyandu');
            $table->enum('status', ['Aktif', 'Tidak Aktif']);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posyandu');
    }
};
