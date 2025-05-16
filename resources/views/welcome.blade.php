
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Selamat Datang</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    <!-- ... -->
    @vite('resources/css/app.css')
    {{-- @livewire('database-notifications') --}}
</head>

<body class="text-black scroll-smooth">
    @include('sections.navbar') {{-- ✅ Ini akan menyisipkan navbar --}}
    @vite('resources/js/pages/navbar.js')

    <section id="home" class="pt-0">
        @include('sections.home')
    </section>
    @vite('resources/css/landing.css')
    @vite('resources/js/pages/landing.js')
    
    <section id="info" class="animate-fade-in">
        @include('sections.info')
    @vite('resources/css/info.css')
    @vite('resources/js/pages/info.js')

    <section id="maps" class="bg-white animate-fade-in">
        @include('sections.maps')
    </section>
    @vite('resources/css/maps.css')
    @vite('resources/js/pages/maps.js')

    </section>
</body>
</html>
