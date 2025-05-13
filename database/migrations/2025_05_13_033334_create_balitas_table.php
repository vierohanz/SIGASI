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
        Schema::create('balita', function (Blueprint $table) {
            $table->id();
            $table->string('nik')->unique()->nullable(false);
            $table->integer('users_id');
            $table->foreign('users_id')
                ->references('id')
                ->on('users')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->integer('kota_id');
            $table->foreign('kota_id')->references('id')->on('kota')->cascadeOnUpdate()->cascadeOnDelete();
            $table->string('nama_balita')->nullable(false);
            $table->date('tanggal_lahir')->nullable(false);
            $table->enum('jenis_kelamin', ['Laki-laki', 'Perempuan']);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('balita');
    }
};
