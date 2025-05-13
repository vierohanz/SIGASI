<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class Balita extends Model
{
    use Notifiable,
        SoftDeletes,
        HasFactory;

    protected $table = 'balita';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;
    protected $guarded = [];
    public function users()
    {
        return $this->belongsTo(User::class);
    }

    public function kota()
    {
        return $this->belongsTo(Kota::class);
    }

    public function pengukuran_gizi()
    {
        return $this->hasMany(pengukuran_gizi::class, 'balita_id');
    }
}
