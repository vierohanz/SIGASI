<?php

namespace App\Filament\Resources\PengukuranGiziResource\Pages;

use App\Filament\Resources\PengukuranGiziResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePengukuranGizi extends CreateRecord
{
    protected static string $resource = PengukuranGiziResource::class;
    protected function afterCreate(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Pengukuran Gizi berhasil dibuat.')
            ->body('Data bPengukuran Gizi telah berhasil disimpan ke dalam sistem. Silakan cek kembali jika diperlukan.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
