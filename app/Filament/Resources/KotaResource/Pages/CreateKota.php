<?php

namespace App\Filament\Resources\KotaResource\Pages;

use App\Filament\Resources\KotaResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Auth;

class CreateKota extends CreateRecord
{
    protected static string $resource = KotaResource::class;
    protected function afterCreate(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Kota berhasil dibuat.')
            ->body('Data Kota telah berhasil disimpan ke dalam sistem. Silakan cek kembali jika diperlukan.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
