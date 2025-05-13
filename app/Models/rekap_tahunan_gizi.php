<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class rekap_tahunan_gizi extends Model
{
    use Notifiable,
        HasFactory;
    protected $table = 'rekap_tahunan_gizi';
    protected $primaryKey = 'id';
    protected $keyType = 'int';
    public $incrementing = true;
    public $timestamps = true;
    protected $guarded = [];
    public function pengukuran_gizi()
    {
        return $this->belongsTo(pengukuran_gizi::class);
    }
}
