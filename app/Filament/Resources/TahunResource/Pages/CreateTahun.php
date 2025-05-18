<?php

namespace App\Filament\Resources\TahunResource\Pages;

use App\Filament\Resources\TahunResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateTahun extends CreateRecord
{
    protected static string $resource = TahunResource::class;
    protected function afterCreate(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Tahun berhasil dibuat.')
            ->body('Data Tahun telah berhasil disimpan ke dalam sistem. Silakan cek kembali jika diperlukan.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
