<?php

namespace App\Filament\Resources\BalitaResource\Pages;

use App\Filament\Resources\BalitaResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Auth;

class CreateBalita extends CreateRecord
{
    protected static string $resource = BalitaResource::class;

    protected function afterCreate(): void
    {
        $recipient = Auth::user();

        Notification::make()
            ->title('Data Balita berhasil dibuat.')
            ->body('Data Balita telah berhasil disimpan ke dalam sistem. Silakan cek kembali jika diperlukan.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
