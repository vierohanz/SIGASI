<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KotaResource\Pages;
use App\Filament\Resources\KotaResource\RelationManagers;
use App\Models\Kota;
use Filament\Forms;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class KotaResource extends Resource
{
    protected static ?string $model = Kota::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-office-2';
    protected static ?string $slug = 'kota';
    protected static ?string $navigationGroup = 'Management';



    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('kode_negara')
                    ->label('Kode Negara')
                    ->required(),
                TextInput::make('nama_negara')
                    ->label('Nama Negara')
                    ->required(),
                TextInput::make('kode_provinsi')
                    ->label('Kode provinsi')
                    ->required(),
                TextInput::make('nama_provinsi')
                    ->label('Nama provinsi')
                    ->required(),
                TextInput::make('kode_kota')
                    ->label('Kode Kota')
                    ->required(),
                TextInput::make('name_kota')
                    ->label('Nama Kota')
                    ->required(),
                TextInput::make('shape_leng')
                    ->label('Shape leng')
                    ->required(),
                TextInput::make('shape_area')
                    ->label('Shape Area')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')
                    ->label('No')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('nama_provinsi')
                    ->label('Nama Provinsi')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('kode_kota')
                    ->label('Kode Kota')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('nama_kota')
                    ->label('Nama Kota')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('shape_leng')
                    ->label('Shape Leng')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('shape_area')
                    ->label('Shape Area')
                    ->searchable()
                    ->sortable(),
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
            'index' => Pages\ListKotas::route('/'),
            'create' => Pages\CreateKota::route('/create'),
            'edit' => Pages\EditKota::route('/{record}/edit'),
        ];
    }

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
}
