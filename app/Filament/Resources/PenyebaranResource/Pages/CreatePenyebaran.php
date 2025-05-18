<?php

namespace App\Filament\Resources\PenyebaranResource\Pages;

use App\Filament\Resources\PenyebaranResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePenyebaran extends CreateRecord
{
    protected static string $resource = PenyebaranResource::class;
    protected function afterCreate(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Penyebaran berhasil dibuat.')
            ->body('Data Penyebaran telah berhasil disimpan ke dalam sistem. Silakan cek kembali jika diperlukan.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
