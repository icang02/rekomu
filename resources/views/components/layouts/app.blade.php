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
    .single-latest-news {
      border-top-right-radius: 11px;
      border-top-left-radius: 11px;
    }

    @keyframes text-animate {

      0%,
      100% {
        color: currentColor;
      }

      50% {
        color: #cecece;
        /* Warna putih tetapi tidak sepenuhnya putih */
      }
    }

    .text-loading {
      animation: text-animate 1.5s infinite;
    }


    .btn-custom {
      font-size: 1rem;
      outline: none;
      font-family: 'Poppins', sans-serif;
      background: #F28123;
      border-radius: 50px;
      color: #fff;
      border: none;
      padding: 10px 20px;
      transition: 0.3s;
    }

    .btn-custom:focus {
      outline: none;
      box-shadow: 0 0 8px #f28023c5;
    }

    .btn-custom2:focus {
      outline: none;
      box-shadow: 0 0 8px #446271be;
    }

    .btn-custom:hover {
      background-color: #051922;
      color: #F28123;
    }

    .btn-custom2 {
      font-size: 1rem;
      outline: none;
      font-family: 'Poppins', sans-serif;
      background: #446271;
      border-radius: 50px;
      color: #fff;
      border: none;
      padding: 10px 20px;
      transition: 0.3s;
    }

    .btn-custom2:hover {
      background-color: #283941;
    }

    .disabled {
      pointer-events: none;
      opacity: 0.6;
    }
  </style>
  @stack('style')

  {{-- @livewireStyles --}}
</head>

<body>

  {{-- PreLoader --}}
  {{-- <div class="loader">
    <div class="loader-inner">
      <div class="circle"></div>
    </div>
  </div> --}}
  {{-- PreLoader End --}}

  {{-- Header --}}
  <livewire:front.partials.header />
  {{-- Header End --}}


  {{-- Home Page Slider --}}
  {{ $slot }}
  {{-- Home Page Slider End --}}

  {{-- Copyright --}}
  <livewire:front.partials.footer />
  {{-- Copyright End --}}


  {{-- Jquery --}}
  <script data-navigate-once src="{{ asset('front') }}/assets/js/jquery-1.11.3.min.js"></script>
  {{-- Bootstrap 4 --}}
  <script data-navigate-once src="{{ asset('front') }}/assets/bootstrap/js/bootstrap.min.js"></script>
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

  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <x-livewire-alert::scripts />

  <script src="{{ asset('vendor/livewire-alert/livewire-alert.js') }}"></script>
  <x-livewire-alert::flash />

  @stack('script')

  {{-- @livewireScripts --}}
</body>

</html>
