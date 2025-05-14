<?php

namespace App\Http\Controllers;

use App\Http\Requests\mapsRequest;
use App\Http\Resources\mapsResource;
use App\Models\data_geo;
use App\Models\tahun;
use Illuminate\Http\Request;

class mapsController extends Controller
{
    public function getMap()
    {
        $maps = data_geo::all();
        return mapsResource::collection($maps);
    }

    public function getMapByTahun(Request $request)
    {
        $tahun = $request->query('tahun');
        if (!$tahun) {
            return response()->json(['message' => 'Tahun parameter is required'], 400);
        }
        $tahunData = tahun::where('tahun', $tahun)->first();
        if (!$tahunData) {
            return response()->json(['message' => 'No matching tahun found'], 404);
        }
        $maps = data_geo::with('tahun')
            ->where('tahun_id', $tahunData->id)
            ->get();
        if ($maps->isEmpty()) {
            return response()->json(['message' => 'No maps found for this year'], 404);
        }
        return mapsResource::collection($maps);
    }
}
