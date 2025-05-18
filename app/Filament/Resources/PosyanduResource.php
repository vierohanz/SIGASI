<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PosyanduResource\Pages;
use App\Filament\Resources\PosyanduResource\RelationManagers;
use App\Models\Posyandu;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use stdClass;

class PosyanduResource extends Resource
{
    protected static ?string $model = Posyandu::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-office';
    protected static ?string $slug = 'posyandu';
    protected static ?string $navigationGroup = 'Management';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('kota_id')
                    ->relationship('kota', 'nama_kota')
                    ->label('Kota')
                    ->required(),
                TextInput::make('jumlah_posyandu')
                    ->numeric()
                    ->label('Jumlah Posyandu')
                    ->prefix('Total: ')
                    ->required(),
                Select::make('status')
                    ->options([
                        'Aktif' => 'Aktif',
                        'Tidak Aktif' => 'Tidak Aktif',
                    ])
                    ->required()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('No')
                    ->label('No')
                    ->getStateUsing(static function (stdClass $rowLoop): string {
                        return (string) $rowLoop->iteration;
                    })
                    ->rowIndex(),
                TextColumn::make('kota.nama_kota')
                    ->label('Nama Kota')
                    ->searchable()
                    ->copyable(),
                TextColumn::make('jumlah_posyandu')
                    ->label('Jumlah Posyandu')
                    ->searchable()
                    ->copyable(),
                TextColumn::make('status')
                    ->label('Status')
                    ->searchable()
                    ->copyable()
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'Aktif' => 'success',
                        'Tidak Aktif' => 'danger',
                    })
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListPosyandus::route('/'),
            'create' => Pages\CreatePosyandu::route('/create'),
            'edit' => Pages\EditPosyandu::route('/{record}/edit'),
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
