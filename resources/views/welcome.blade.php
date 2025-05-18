<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>SIGASI</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Custom CSS -->
  <link rel="stylesheet" href="{{ asset('css/app.css') }}" />
  <!-- Di dalam <head> -->
  <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />


</head>

<body style="
  margin: 0;
  background: linear-gradient(180deg, rgba(255, 255, 255, 0.49) 8%, rgba(245, 196, 94, 0.10) 37%, rgba(255, 255, 255, 0.49) 93%rgba(243, 230, 230, 0.49)
  background-size: cover;
">


<!DOCTYPE html>
<html lang="id">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SIGASI</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-b from-white to-yellow-50 font-sans">

  <!-- Navbar -->
  <nav class="flex items-center justify-between px-8 py-4 bg-black-50 custom-shadow">
    <div class="flex items-center space-x-4">
      <img src="{{ asset('images/logo_fav.png') }}"  style="width: 30px; height: 20px; alt=".'.">
      <a href="#" class="text-sm font-medium text-white-700 hover:text-orange-500">Peta Persebaran</a>
      <a href="#" class="text-sm font-medium text-white-700 hover:text-orange-500">Pencatatan Posyandu</a>
    </div>
    <a href="#" class="text-sm font-medium text-white-700 hover:text-orange-500">Login</a>
  </nav>

<!-- Hero Section -->
 <!-- Hero Section -->
<!-- <section class="h-screen flex items-center justify-center bg-gradient-to-br from-orange-100 to-yellow-200">
  <div class="text-center px-4">
    <h1 class="text-4xl md:text-6xl font-bold text-orange-800 mb-4">Selamat Datang di Sistem Posyandu</h1>
    <p class="text-lg text-gray-700 mb-6">Pantau layanan dan data stunting dengan mudah dan interaktif.</p>
    <a href="#fitur-utama" class="bg-orange-500 text-white py-3 px-6 rounded-lg hover:bg-orange-600 transition shadow-lg">
      Jelajahi Fitur
    </a>
  </div>
</section> -->

<section class="relative h-screen w-full overflow-hidden">
  <!-- Carousel -->
  <div id="heroCarousel" class="carousel slide h-full" data-bs-ride="carousel">
    <div class="carousel-inner h-full">
      <div class="carousel-item active h-full">
        <img src="{{ asset('images/image2.png') }}"
             class="d-block w-full h-full object-cover"
             alt="Slide 1">
      </div>
      <div class="carousel-item h-full">
        <img src="{{ asset('images/image4.png') }}"
             class="d-block w-full h-full object-cover"
             alt="Slide 2">
      </div>
      <div class="carousel-item h-full">
        <img src="{{ asset('images/image5.png') }}"
             class="d-block w-full h-full object-cover"
             alt="Slide 3">
      </div>
    </div>

    <!-- Carousel Controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
  </div>

  <!-- Overlay Text -->
  <div class="absolute inset-0 flex flex-col items-center justify-center text-center px-4 z-10 bg-black/30">
    <h1 class="text-5xl md:text-6xl font-bold text-white drop-shadow mb-3">SIGASI</h1>
    <h2 class="text-lg md:text-xl font-semibold text-orange-100 mb-3">Sistem Informasi Geografis Anak Sehat Indonesia</h2>
    <p class="text-white max-w-2xl text-sm md:text-base leading-relaxed">
      Platform Geographic Information System (GIS) berbasis web yang dirancang khusus untuk mendukung pencatatan dan pemantauan aktivitas posyandu terpadu di Provinsi Jawa Tengah.
    </p>
  </div>
</section>


<!-- Fitur Utama -->
<section class="px-8 py-16 bg-gradient-to-b from-white to-yellow-50">
  <div class="max-w-7xl mx-auto flex flex-col md:flex-row items-center gap-12">
    
    <!-- Title -->
    <div class="w-full md:w-1/3 flex justify-center md:justify-start" data-aos="fade-right">
      <h2 class="text-4xl md:text-5xl font-bold text-orange-800 text-center md:text-left">
        Fitur Utama
      </h2>
    </div>

    <!-- Feature Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 w-full md:w-2/3">
      
      <!-- Card 1 -->
      <div class="bg-white p-6 rounded-2xl shadow-lg hover:scale-105 transition-transform duration-300 hover:shadow-xl" data-aos="zoom-in-up" data-aos-delay="100">
        <img src="{{ asset('images/dashboard2.png') }}" class="w-full h-40 object-cover rounded-md mb-4" alt="Pencatatan Posyandu">
        <h3 class="text-xl font-semibold text-orange-600 mb-2">Pencatatan Posyandu</h3>
        <p class="text-sm text-gray-600 mb-4">Akses pencatatan layanan posyandu di berbagai wilayah.</p>
        <a href="#" class="inline-block bg-orange-500 text-white py-2 px-4 rounded hover:bg-orange-600">Dashboard</a>
      </div>

      <!-- Card 2 -->
      <div class="bg-white p-6 rounded-2xl shadow-lg hover:scale-105 transition-transform duration-300 hover:shadow-xl" data-aos="zoom-in-up" data-aos-delay="200">
        <img src="{{ asset('images/jateng.png') }}" class="w-full h-40 object-cover rounded-md mb-4" alt="Peta Persebaran">
        <h3 class="text-xl font-semibold text-orange-600 mb-2">Peta Persebaran Stunting</h3>
        <p class="text-sm text-gray-600 mb-4">Pantau data stunting di setiap daerah lewat peta interaktif.</p>
        <a href="#" class="inline-block bg-orange-500 text-white py-2 px-4 rounded hover:bg-orange-600">WEBGIS</a>
      </div>

    </div>
  </div>
</section>

<section class="py-10">
<div class="bg-white p-4 rounded-lg shadow-md">
<h2 class="text-2xl md:text-3xl font-bold text-orange-700 mb-8 text-center">
  Statistik Kasus Stunting
</h2>  <div class="flex flex-wrap justify-center gap-6">
    <!-- Card 1 -->
    <div class="bg-white border-2 border-yellow-200 rounded-2xl shadow-md p-6 w-60 hover:-translate-y-1 transition">
      <!-- <div class="text-4xl mb-2">👶</div> -->
      <i class="fas fa-baby fa-2x text-yellow-500 mb-2"></i>
      <div class="text-2xl font-bold text-emerald-700">128.572</div>
      <p class="text-sm text-gray-600">Balita Terdata</p>
    </div>
    <!-- Card 2 -->
    <div class="bg-white border-2 border-yellow-200 rounded-2xl shadow-md p-6 w-60 hover:-translate-y-1 transition">
      <!-- <div class="text-4xl mb-2">🧪</div> -->
      <i class="fas fa-ruler-vertical text-yellow-500 text-3xl"></i>
      <div class="text-2xl font-bold text-emerald-700">12.340</div>
      <p class="text-sm text-gray-600">Kasus Stunting</p>
    </div>
    <!-- Card 3 -->
    <div class="bg-white border-2 border-yellow-200 rounded-2xl shadow-md p-6 w-60 hover:-translate-y-1 transition">
      <!-- <div class="text-4xl mb-2">🏥</div> -->
      <i class="fas fa-clinic-medical text-yellow-500 text-3xl"></i>
      <!-- <i class="fas fa-clinic-medical text-emerald-500 text-3xl"></i> -->
      <div class="text-2xl font-bold text-emerald-700">4.203</div>
      <p class="text-sm text-gray-600">Posyandu Aktif</p>
    </div>
    <!-- Card 4 -->
    <div class="bg-white border-2 border-yellow-200 rounded-2xl shadow-md p-6 w-60 hover:-translate-y-1 transition">
      <i class="fas fa-city text-yellow-500 text-3xl"></i>
      <div class="text-2xl font-bold text-emerald-700">35</div>
      <p class="text-sm text-gray-600">Kab/Kota Terjangkau</p>
    </div>
  </div>
</section>

<section class="py-12">
  <div class="max-w-5xl mx-auto px-4 text-center">
    <h2 class="text-3xl font-bold text-orange-700 mb-6">Tonton Video Kami</h2>
    
    <div class="aspect-video rounded-xl overflow-hidden shadow-lg border-4 border-orange-200 mx-auto hover:scale-105 transition duration-300">
      <iframe 
        class="w-full h-full" 
        src="https://www.youtube.com/embed/UTiD4g0ncuQ"
        title="YouTube video player"
        frameborder="0"
        allowfullscreen>
      </iframe>
    </div>
  </div>
</section>

<section class = "py-12 bg white">
  <div >

</div>

<footer class="bg-white text-gray-800 py-8 mt-5">
  <div class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-3 gap-10">
    
    <!-- Logo & Description -->
    <div>
      <h3 class="text-2xl font-bold text-orange-700 mb-2">SIGASI</h3>
      <p class="text-sm text-gray-600">
        Sistem Informasi Geografis Anak Sehat Indonesia adalah platform pemantauan posyandu dan stunting berbasis GIS di Jawa Tengah.
      </p>
    </div>

    <!-- Navigasi -->
    <div>
      <h4 class="text-lg font-semibold text-orange-600 mb-3">Navigasi</h4>
      <ul class="space-y-2 text-sm">
        <li><a href="#" class="hover:text-orange-700 transition">Beranda</a></li>
        <li><a href="#" class="hover:text-orange-700 transition">Dashboard</a></li>
        <li><a href="#" class="hover:text-orange-700 transition">Peta Stunting</a></li>
        <li><a href="#" class="hover:text-orange-700 transition">Tentang Kami</a></li>
      </ul>
    </div>

    <!-- Kontak -->
    <div>
      <h4 class="text-lg font-semibold text-orange-600 mb-3">Kontak</h4>
      <p class="text-sm">Email: <a href="mailto:support@sigasi.id" class="text-orange-700 hover:underline">support@sigasi.id</a></p>
      <p class="text-sm">Telepon: 0856-xxxx-xxxx</p>
      <div class="flex space-x-4 mt-3">
        <a href="#" class="text-orange-700 hover:text-orange-900"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="text-orange-700 hover:text-orange-900"><i class="fab fa-instagram"></i></a>
        <a href="#" class="text-orange-700 hover:text-orange-900"><i class="fab fa-twitter"></i></a>
      </div>
    </div>

  </div>

  <!-- Bottom -->
  <div class="border-t border-orange-200 mt-10 pt-4 text-center text-sm text-gray-500">
    &copy; 2025 SIGASI. All rights reserved.
  </div>
</footer>

</body>
</html>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    var myCarousel = document.querySelector('#heroCarousel');
    // (Tambahkan script carousel jika diperlukan)
  </script>
  <!-- Sebelum </body> -->
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script>
  AOS.init();
</script>

</body>

</html>
