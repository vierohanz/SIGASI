<?php

namespace App\Filament\Resources\PengukuranGiziResource\Pages;

use App\Filament\Resources\PengukuranGiziResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPengukuranGizis extends ListRecords
{
    protected static string $resource = PengukuranGiziResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
