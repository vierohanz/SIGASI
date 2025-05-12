<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::factory()->create([
            'nik' => '3322892717251',
            'name' => 'Rais Hannan Rizanto',
            'email' => 'rizantohannan@gmail.com',
            'password' => Hash::make('password'),
        ]);

        User::factory()->create([
            'nik' => '3322892715638',
            'name' => 'Muhammad Rayhan Maulanan Anas',
            'email' => 'rayhanzz33@gmail.com',
            'password' => Hash::make('password'),
        ]);

        User::factory()->create([
            'nik' => '3322892715913',
            'name' => 'Salwa Fitriyatunnisa',
            'email' => 'salwafitriya@gmail.com',
            'password' => Hash::make('password'),
        ]);
    }
}
