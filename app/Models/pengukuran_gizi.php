<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;

class pengukuran_gizi extends Model
{
    use Notifiable,
        HasFactory,
        SoftDeletes;

    protected $table = 'pengukuran_gizi';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;
    protected $guarded = [];
    public function balita()
    {
        return $this->belongsTo(Balita::class);
    }

    public function rekap_tahunan_gizi()
    {
        return $this->hasMany(rekap_tahunan_gizi::class, 'balita_id');
    }
}
