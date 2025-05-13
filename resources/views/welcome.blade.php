<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Selamat Datang</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    @vite('resources/css/app.css')
    <style>
        @keyframes fade-in {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }

            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fade-in {
            animation: fade-in 1.5s ease-out;
        }
    </style>
</head>

<body class="bg-gradient-to-br from-blue-800 to-indigo-900 min-h-screen flex items-center justify-center text-white">
    <div class="text-center px-6 animate-fade-in">
        <h1 class="text-5xl md:text-11xl font-extrabold mb-4">Selamat Datang di SIGASI</h1>
        <p class="text-lg md:text-xl mb-8">Kelola event kamu dengan mudah dan profesional.</p>
        <a href=""
            class="inline-block px-8 py-3 bg-white text-indigo-800 font-semibold rounded-full shadow-lg hover:scale-105 transition-transform duration-300">
            Mulai Sekarang
        </a>
    </div>
</body>

</html>
