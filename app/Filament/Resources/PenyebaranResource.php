<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PenyebaranResource\Pages;
use App\Filament\Resources\PenyebaranResource\RelationManagers;
use App\Filament\Widgets\Map;
use App\Models\data_geo;
use App\Models\Penyebaran;
use App\Models\tahun;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\View;
use Filament\Forms\Form;
use Filament\Pages\Page;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\Layout\View as LayoutView;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use stdClass;

class PenyebaranResource extends Resource
{
    protected static ?string $model = data_geo::class;

    protected static ?string $navigationIcon = 'heroicon-o-presentation-chart-line';
    protected static ?string $label = 'Penyebaran';
    protected static ?string $slug = 'penyebaran';
    protected static ?string $navigationGroup = 'Geografis';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('tahun_id')
                    ->label('Tahun')
                    ->relationship('tahun', 'tahun')
                    ->searchable()
                    ->preload()
                    ->required(),
                Select::make('kota_id')
                    ->label('Kota')
                    ->relationship('kota', 'nama_kota')
                    ->searchable()
                    ->preload()
                    ->required(),
                TextInput::make('prevalensi_stunting')
                    ->label('Tingkat Stunting')
                    ->numeric()
                    ->required(),

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
                TextColumn::make('tahun.tahun')
                    ->label('Tahun')
                    ->sortable()
                    ->copyable()
                    ->searchable(),
                TextColumn::make('kota.nama_kota')
                    ->label('Kota')
                    ->searchable()
                    ->copyable()
                    ->sortable(),

                TextColumn::make('kota.shape_area')
                    ->label('Shape Area')
                    ->searchable()
                    ->copyable()
                    ->sortable(),
                TextColumn::make('kota.shape_leng')
                    ->label('Shape Leng')
                    ->searchable()
                    ->copyable()
                    ->sortable(),
                TextColumn::make('prevalensi_stunting')
                    ->label('Tingkat Stunting')
                    ->searchable()
                    ->copyable()
                    ->sortable(),

            ])
            ->emptyStateDescription('Once you write your first post, it will appear here.')
            ->filters([
                Tables\Filters\TrashedFilter::make(),
                Filter::make('tahun_id')
                    ->query(fn(Builder $query) => $query->where('tahun_id', true)),
                SelectFilter::make('tahun_id')
                    ->options([
                        '1' => '2021',
                        '2' => '2022',
                        '3' => '2023',
                        '4' => '2024',
                        '5' => '2025',
                        '6' => '2026',
                        '7' => '2027',
                    ]),
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
            'index' => Pages\ListPenyebarans::route('/'),
            'create' => Pages\CreatePenyebaran::route('/create'),
            'edit' => Pages\EditPenyebaran::route('/{record}/edit'),

        ];
    }
    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
    protected function getHeaderWidgets(): array
    {
        return [
            Map::class,
        ];
    }
}
