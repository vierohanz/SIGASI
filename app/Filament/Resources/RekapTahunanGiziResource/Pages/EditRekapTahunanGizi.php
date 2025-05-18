<?php

namespace App\Filament\Resources\RekapTahunanGiziResource\Pages;

use App\Filament\Resources\RekapTahunanGiziResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditRekapTahunanGizi extends EditRecord
{
    protected static string $resource = RekapTahunanGiziResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
            Actions\ForceDeleteAction::make(),
            Actions\RestoreAction::make(),
        ];
    }
}
