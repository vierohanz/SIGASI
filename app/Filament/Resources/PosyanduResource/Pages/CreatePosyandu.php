<?php

namespace App\Filament\Resources\PosyanduResource\Pages;

use App\Filament\Resources\PosyanduResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePosyandu extends CreateRecord
{
    protected static string $resource = PosyanduResource::class;
    protected function afterCreate(): void
    {
        $recipient = Auth::user();
        Notification::make()
            ->title('Data Posyandu berhasil dibuat.')
            ->body('Data Posyandu telah berhasil disimpan ke dalam sistem. Silakan cek kembali jika diperlukan.')
            ->success()
            ->sendToDatabase($recipient);
    }
}
