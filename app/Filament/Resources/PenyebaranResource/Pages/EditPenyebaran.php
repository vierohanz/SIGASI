<?php

namespace App\Filament\Resources\PenyebaranResource\Pages;

use App\Filament\Resources\PenyebaranResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPenyebaran extends EditRecord
{
    protected static string $resource = PenyebaranResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
            Actions\ForceDeleteAction::make(),
            Actions\RestoreAction::make(),
        ];
    }
}
