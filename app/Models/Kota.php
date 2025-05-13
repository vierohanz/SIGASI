<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;

class Kota extends Model
{
    use Notifiable,
        SoftDeletes,
        HasFactory;

    protected $table = 'kota';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;
    protected $guarded = [];
    public function balita()
    {
        return $this->hasMany(Balita::class, 'kode_kota');
    }
    public function data_geo()
    {
        return $this->hasMany(data_geo::class, 'kode_kota');
    }
    public function posyandu()
    {
        return $this->hasMany(posyandu::class, 'kode_kota');
    }
}
