<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PengukuranGiziResource\Pages;
use App\Filament\Resources\PengukuranGiziResource\RelationManagers;
use App\Models\pengukuran_gizi;
use App\Models\PengukuranGizi;
use DateTime;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
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

class PengukuranGiziResource extends Resource
{
    protected static ?string $model = pengukuran_gizi::class;
    protected static ?string $navigationIcon = 'heroicon-o-chart-bar-square';
    protected static ?string $label = 'Pengukuran Gizi';
    protected static ?string $slug = 'pengukuran_gizi';
    protected static ?string $navigationGroup = 'Management';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('balita_id')
                    ->label('Balita')
                    ->relationship('balita', 'nama_balita')
                    ->searchable()
                    ->preload()
                    ->required(),
                DatePicker::make('tanggal_pengukuran')
                    ->label('Tanggal Pengukuran')
                    ->required(),
                TextInput::make('umur_bulan')
                    ->label('Umur Bulan')
                    ->numeric()
                    ->prefix('Bulan')
                    ->required(),
                TextInput::make('berat_badan')
                    ->label('Berat Bulan')
                    ->numeric()
                    ->prefix('KG')
                    ->required(),
                TextInput::make('tinggi_badan')
                    ->label('Tinggi Bulan')
                    ->numeric()
                    ->prefix('Cm')
                    ->required(),
                TextInput::make('lingkar_lengan')
                    ->label('Lingkar Lengan')
                    ->numeric()
                    ->prefix('Cm')
                    ->required(),
                TextInput::make('z_score_bb_u')
                    ->label('Z Score BB U')
                    ->numeric()
                    ->disabled()
                    ->prefix('Skor')
                    ->required(),
                TextInput::make('z_score_tb_u')
                    ->label('Z Score TB U')
                    ->numeric()
                    ->prefix('Skor')
                    ->disabled()
                    ->required(),
                TextInput::make('z_score_bb_tb')
                    ->label('Z Score BB TB')
                    ->numeric()
                    ->prefix('Skor')
                    ->disabled()
                    ->required(),
                Select::make('weight_for_age')
                    ->label('WAZ')
                    ->disabled()
                    ->required()
                    ->prefix('Status Berat')
                    ->options([
                        'Normal' => 'Normal',
                        'Underweight' => 'Underweight',
                        'Severely Underweight' => 'Severely Underweight',
                    ]),
                Select::make('height_for_age')
                    ->label('HAZ')
                    ->disabled()
                    ->prefix('Status Tinggi')
                    ->required()
                    ->options([
                        'Normal' => 'Normal',
                        'Stunted' => 'Stunted',
                        'Severely Stunted' => 'Severely Stunted',
                    ]),
                Select::make('weight_for_height')
                    ->label('WHZ')
                    ->disabled()
                    ->prefix('Status Tinggi Berat')
                    ->required()
                    ->options([
                        'Obesitas' => 'danger',
                        'Gemuk' => 'warning',
                        'Normal' => 'success',
                        'Gizi Kurang' => 'danger',
                        'Gizi Buruk' => 'danger',
                    ]),

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
                TextColumn::make('balita_id')
                    ->label('Nama Balita')
                    ->searchable()
                    ->copyable()
                    ->sortable(),
                TextColumn::make('tanggal_pengukuran')
                    ->label('Tanggal Pengukuran')
                    ->searchable()
                    ->copyable()
                    ->sortable(),
                TextColumn::make('umur_bulan')
                    ->label('Umur Bulan')
                    ->searchable()
                    ->copyable()
                    ->suffix(' Bulan')
                    ->sortable(),
                TextColumn::make('berat_badan')
                    ->label('Berat Bulan')
                    ->searchable()
                    ->copyable()
                    ->suffix(' Kg')
                    ->sortable(),
                TextColumn::make('tinggi_badan')
                    ->label('Tinggi Badan')
                    ->searchable()
                    ->copyable()
                    ->suffix(' Cm')
                    ->sortable(),
                TextColumn::make('lingkar_lengan')
                    ->label('Lingkar Lengan')
                    ->searchable()
                    ->copyable()
                    ->suffix(' Cm')
                    ->sortable(),
                TextColumn::make('z_score_bb_u')
                    ->label('Z Score BB')
                    ->searchable()
                    ->copyable()
                    ->suffix(' Kg')
                    ->sortable(),
                TextColumn::make('z_score_tb_u')
                    ->label('Z Score TB')
                    ->searchable()
                    ->copyable()
                    ->suffix(' Cm')
                    ->sortable(),
                TextColumn::make('z_score_bb_tb')
                    ->label('Z Score TB BB')
                    ->searchable()
                    ->copyable()
                    ->sortable(),
                TextColumn::make('weight_for_age')
                    ->label('WAZ')
                    ->searchable()
                    ->copyable()
                    ->color(fn(string $state): string => match ($state) {
                        'Normal' => 'success',
                        'Underweight' => 'warning',
                        'Severely Underweight' => 'danger',
                    })
                    ->sortable(),
                TextColumn::make('height_for_age')
                    ->label('HAZ')
                    ->searchable()
                    ->copyable()
                    ->color(fn(string $state): string => match ($state) {
                        'Normal' => 'success',
                        'Stunted' => 'warning',
                        'Severely Stunted' => 'danger',
                    })
                    ->sortable(),
                TextColumn::make('weight_for_height')
                    ->label('WHZ')
                    ->searchable()
                    ->copyable()
                    ->color(fn(string $state): string => match ($state) {
                        'Obesitas' => 'danger',
                        'Gemuk' => 'warning',
                        'Normal' => 'success',
                        'Gizi Kurang' => 'danger',
                        'Gizi Buruk' => 'danger',
                    })
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
            'index' => Pages\ListPengukuranGizis::route('/'),
            'create' => Pages\CreatePengukuranGizi::route('/create'),
            'edit' => Pages\EditPengukuranGizi::route('/{record}/edit'),
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
