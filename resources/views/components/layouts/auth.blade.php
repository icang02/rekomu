<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description"
    content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

  <title>{{ isset($title) ? "$title | rekomU" : 'rekomU' }}</title>

  {{-- Favicon --}}
  <link rel="shortcut icon" type="image/png" href="{{ asset('img/logo.png') }}">
  {{-- Google Font --}}
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
  {{-- Fontawesome --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/css/all.min.css">
  {{-- Bootstrap 4 --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/bootstrap/css/bootstrap.min.css">
  {{-- Owl Carousel --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/css/owl.carousel.css">
  {{-- Macnific Popup --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/css/magnific-popup.css">
  {{-- Animate CSS --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/css/animate.css">
  {{-- Mean Menu CSS --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/css/meanmenu.min.css">
  {{-- Main Style --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/css/main.css">
  {{-- Responsive --}}
  <link rel="stylesheet" href="{{ asset('front') }}/assets/css/responsive.css">

  <style>
    .ftco-section {
      position: relative;
    }

    .ftco-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(to top, #53a5e4, #357892);
      /* Gradient biru ke biru muda */
      opacity: 0.7;
      /* Sesuaikan opacity sesuai kebutuhan */
      pointer-events: none;
      /* Agar overlay tidak mengganggu interaksi dengan elemen di bawahnya */
      z-index: 1;
      /* Menempatkan overlay di atas gambar latar belakang */
    }

    .ftco-section>* {
      position: relative;
      z-index: 2;
      /* Konten di atas overlay */
    }
  </style>
</head>

<body>

  {{ $slot }}

  {{-- Jquery --}}
  <script src="{{ asset('front') }}/assets/js/jquery-1.11.3.min.js"></script>
  {{-- Bootstrap 4 --}}
  <script src="{{ asset('front') }}/assets/bootstrap/js/bootstrap.min.js"></script>
  {{-- Count Down --}}
  <script src="{{ asset('front') }}/assets/js/jquery.countdown.js"></script>
  {{-- Isotope --}}
  <script src="{{ asset('front') }}/assets/js/jquery.isotope-3.0.6.min.js"></script>
  {{-- Waypoints --}}
  <script src="{{ asset('front') }}/assets/js/waypoints.js"></script>
  {{-- Owl Carousel --}}
  <script src="{{ asset('front') }}/assets/js/owl.carousel.min.js"></script>
  {{-- Magnific Popup --}}
  <script src="{{ asset('front') }}/assets/js/jquery.magnific-popup.min.js"></script>
  {{-- Mean Menu --}}
  <script src="{{ asset('front') }}/assets/js/jquery.meanmenu.min.js"></script>
  {{-- Sticker JS --}}
  <script src="{{ asset('front') }}/assets/js/sticker.js"></script>
  {{-- Main JS --}}
  <script src="{{ asset('front') }}/assets/js/main.js"></script>
</body>

</html>
