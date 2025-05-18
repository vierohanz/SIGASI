<?php

namespace App\Filament\Resources\PosyanduResource\Pages;

use App\Filament\Resources\PosyanduResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditPosyandu extends EditRecord
{
    protected static string $resource = PosyanduResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
            Actions\ForceDeleteAction::make(),
            Actions\RestoreAction::make(),
        ];
    }
    protected function afterSave(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Posyandu berhasil diubah.')
            ->body('Data Posyandu telah berhasil diubah ke dalam sistem.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
