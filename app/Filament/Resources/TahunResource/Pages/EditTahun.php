<?php

namespace App\Filament\Resources\TahunResource\Pages;

use App\Filament\Resources\TahunResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditTahun extends EditRecord
{
    protected static string $resource = TahunResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    protected function afterSave(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Tahun berhasil diubah.')
            ->body('Data Tahun telah berhasil diubah ke dalam sistem.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
