<?php

namespace App\Filament\Resources\PengukuranGiziResource\Pages;

use App\Filament\Resources\PengukuranGiziResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditPengukuranGizi extends EditRecord
{
    protected static string $resource = PengukuranGiziResource::class;

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
            ->title('Data Pengukuran Gizi berhasil diubah.')
            ->body('Data Pengukuran Gizi telah berhasil diubah ke dalam sistem.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
