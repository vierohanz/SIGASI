<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class mapsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'tahun' => $this->tahun?->tahun,
            'kota' => $this->kota?->nama_kota,
            'prevalensi_stunting' => $this->prevalensi_stunting,
            'shape_area' => $this->kota?->shape_area,
            'shape_leng' => $this->kota?->shape_leng
        ];
    }
}
