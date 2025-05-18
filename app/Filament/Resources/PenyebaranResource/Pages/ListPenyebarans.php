<?php

namespace App\Filament\Resources\PenyebaranResource\Pages;

use App\Filament\Resources\PenyebaranResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Contracts\View\View;

class ListPenyebarans extends ListRecords
{
    protected static string $resource = PenyebaranResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
