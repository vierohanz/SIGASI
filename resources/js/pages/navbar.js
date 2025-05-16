  window.addEventListener('scroll', function () {
    const navbar = document.getElementById('navbar');
    if (window.scrollY > 50) {
      navbar.classList.add('bg-white', 'text-black');
      navbar.classList.remove('bg-transparent', 'text-white');
    } else {
      navbar.classList.remove('bg-white', 'text-black', 'shadow-md');
      navbar.classList.add('bg-transparent', 'text-white');
    }
  });