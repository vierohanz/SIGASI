<x-filament-widgets::widget class="fi-maps-widget">
    <x-filament-maps::card :has-border="$this->getHasBorder()" :heading="$this->getHeading()" :footer="$this->getFooter()">
        <x-filament-maps::map :rounded="$this->getRounded()" :tile-layer-url="$this->getTileLayerUrl()" :tile-layer-options="$this->getTileLayerOptions()" :height="$this->getHeight()" :options="$this->getMapOptions()"
            :actions="$this->getCachedMapActions()" :extra-attribute-bag="$this->getExtraAttributeBag()" :extra-alpine-attribute-bag="$this->getExtraAlpineAttributeBag()" :fullpage="$this->isFullPage()" :polling-interval="$this->getPollingInterval()" />
    </x-filament-maps::card>
</x-filament-widgets::widget>
