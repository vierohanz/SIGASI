<?php

namespace App\Filament\Resources\RekapTahunanGiziResource\Pages;

use App\Filament\Resources\RekapTahunanGiziResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListRekapTahunanGizis extends ListRecords
{
    protected static string $resource = RekapTahunanGiziResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
