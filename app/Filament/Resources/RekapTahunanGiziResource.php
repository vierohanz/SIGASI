<?php

namespace App\Filament\Resources;

use App\Filament\Resources\RekapTahunanGiziResource\Pages;
use App\Filament\Resources\RekapTahunanGiziResource\RelationManagers;
use App\Models\rekap_tahunan_gizi;
use App\Models\RekapTahunanGizi;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class RekapTahunanGiziResource extends Resource
{
    protected static ?string $model = rekap_tahunan_gizi::class;

    protected static ?string $label = 'Rekap Tahunan Gizi';
    protected static ?string $slug = 'rekap_tahunan_gizi';
    protected static ?string $navigationGroup = 'Geografis';
    protected static ?string $navigationIcon = 'heroicon-o-inbox-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\ForceDeleteBulkAction::make(),
                    Tables\Actions\RestoreBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListRekapTahunanGizis::route('/'),
            'create' => Pages\CreateRekapTahunanGizi::route('/create'),
            'edit' => Pages\EditRekapTahunanGizi::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
}
