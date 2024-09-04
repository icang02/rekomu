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
  <link rel="shortcut icon" type="image/png" href="{{ asset('front') }}/assets/img/favicon.png">
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
  @include('livewire.front.partials.header')
  {{-- Header End --}}

  {{-- Search Area --}}
  <div class="search-area">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <span class="close-btn"><i class="fas fa-window-close"></i></span>
          <div class="search-bar">
            <div class="search-bar-tablecell">
              <h3>Search For:</h3>
              <input type="text" placeholder="Keywords">
              <button type="submit">Search <i class="fas fa-search"></i></button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  {{-- Search Area End --}}

  {{-- Home Page Slider --}}
  @php
    $slider = \App\Models\Slider::latest('id')->first();
  @endphp
  <div>
    <div class="breadcrumb-section breadcrumb-bg"
      style="background-image: url('{{ asset("storage/$slider->image") }}'); background-size: cover; background-position: bottom;">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="breadcrumb-text">
              <p>rekomU</p>
              <h1>403</h1>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="cart-section mt-100 mb-150">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">
            <div class="error-text">
              <h1>Forbidden</h1>
              <p>Halaman tidak dapat diakses.</p>
              <a href="{{ route('front.beranda') }}" wire:navigate class="boxed-btn">Kembali</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  {{-- Home Page Slider End --}}

  {{-- Copyright --}}
  @include('livewire.front.partials.footer')
  {{-- Copyright End --}}


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
