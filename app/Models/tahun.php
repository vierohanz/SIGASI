<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class tahun extends Model
{
    use Notifiable,
        HasFactory;

    protected $table = 'tahun';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;
    protected $guarded = [];
    public function data_geo()
    {
        return $this->hasMany(data_geo::class, 'tahun_id');
    }
}
