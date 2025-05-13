<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Selamat Datang</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite('resources/css/app.css')
    @livewire('database-notifications')
</head>

<body class="text-black scroll-smooth">
    <button type="button">
        Notifications ({{ $unreadNotificationsCount }} unread)
    </button>
    <section id="home" class="">
        @include('sections.home')
    </section>

    <section id="maps" class="bg-blue-900 animate-fade-in">
        @include('sections.maps')
    </section>

    <section id="customer-service" class="bg-indigo-800 animate-fade-in">
        @include('sections.customer-service')
    </section>
</body>

</html>
