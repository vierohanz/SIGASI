<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class posyandu extends Model
{
    use Notifiable,
        HasFactory;

    protected $table = 'posyandu';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;
    protected $guarded = [];
    public function kota()
    {
        return $this->belongsTo(Kota::class);
    }
}
