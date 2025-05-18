<?php

namespace App\Filament\Resources\PenyebaranResource\Pages;

use App\Filament\Resources\PenyebaranResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

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
    protected function afterSave(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Penyebaran berhasil diubah.')
            ->body('Data Penyebaran telah berhasil diubah ke dalam sistem.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
