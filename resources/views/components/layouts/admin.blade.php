<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>{{ isset($title) ? "$title | rekomU" : 'rekomU' }}</title>
  <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
  <link rel="icon" href="{{ asset('storage/setting/logo.png') }}" type="image/x-icon" />

  <style>
    .custom-table {
      width: 100%;
      border-collapse: collapse;
    }

    .custom-table th {
      text-transform: uppercase;
      letter-spacing: 1px;
      background: #F8F9FA;
      padding: 10px 24px;
      font-weight: 600;
      font-size: .95rem;
    }

    .custom-table td {
      padding: 6px 24px;
    }

    .custom-table th,
    .custom-table td {
      border: 1px solid rgb(225, 225, 225);
      text-align: left;
    }

    /* Bagian Card Ulasan */
    .custom-card {
      flex: 0 0 100%;
      max-width: 100%;
      margin-bottom: 1rem;
    }

    @media (min-width: 576px) {
      .custom-card {
        flex: 0 0 50%;
        max-width: 50%;
      }
    }

    @media (min-width: 900px) {
      .custom-card {
        flex: 0 0 33.33%;
        max-width: 33.33%;
      }
    }

    @media (min-width: 1000px) {
      .custom-card {
        flex: 0 0 30%;
        max-width: 30%;
      }
    }

    @media (min-width: 1200px) {
      .custom-card {
        flex: 0 0 25%;
        max-width: 25%;
      }
    }

    @media (min-width: 1400px) {
      .custom-card {
        flex: 0 0 20%;
        max-width: 20%;
      }
    }



    @keyframes text-animate {

      0%,
      100% {
        color: currentColor;
      }

      50% {
        color: #f0f0f0;
        /* Warna putih tetapi tidak sepenuhnya putih */
      }
    }

    .text-loading {
      animation: text-animate 1s infinite;
    }

    /* body::-webkit-scrollbar {
      display: none;
    } */
  </style>

  <!-- Fonts and icons -->
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/plugin/webfont/webfont.min.js"></script>
  <script data-navigate-once>
    WebFont.load({
      google: {
        families: ["Public Sans:300,400,500,600,700"]
      },
      custom: {
        families: [
          "Font Awesome 5 Solid",
          "Font Awesome 5 Regular",
          "Font Awesome 5 Brands",
          "simple-line-icons",
        ],
        urls: ["{{ asset('admin-assets/assets/css/fonts.min.css') }}"],
      },
      active: function() {
        sessionStorage.fonts = true;
      },
    });
  </script>

  <!-- CSS Files -->
  <link rel="stylesheet" href="{{ asset('admin-assets') }}/assets/css/bootstrap.min.css" />
  <link rel="stylesheet" href="{{ asset('admin-assets') }}/assets/css/plugins.min.css" />
  <link rel="stylesheet" href="{{ asset('admin-assets') }}/assets/css/kaiadmin.min.css" />

  <!-- CSS Just for demo purpose, don't include it in your project -->
  {{-- <link rel="stylesheet" href="{{ asset('admin-assets') }}/assets/css/demo.css" /> --}}
</head>

<body>
  <div class="wrapper">
    <!-- Sidebar -->
    {{-- @include('livewire.admin.partials.sidebar') --}}
    <livewire:admin.partials.sidebar />
    <!-- End Sidebar -->

    <div class="main-panel">
      {{-- @include('livewire.admin.partials.header') --}}
      <livewire:admin.partials.header />

      <div class="container">
        <div class="page-inner">
          {{ $slot }}
        </div>
      </div>
      {{-- @include('livewire.admin.partials.footer') --}}
      <livewire:admin.partials.footer />
    </div>
  </div>


  <script>
    document.addEventListener('livewire:init', () => {
      Livewire.on('submitted', (event) => {
        $.notify({
          icon: 'icon-bell',
          title: event.title ?? 'Notifikasi',
          message: event.message,
        }, {
          type: event.type,
          placement: {
            from: "top",
            align: "center"
          },
          time: 1000,
        })
      });
    });
  </script>

  <!--   Core JS Files   -->
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/core/jquery-3.7.1.min.js"></script>
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/core/popper.min.js"></script>
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/core/bootstrap.min.js"></script>
  <!-- jQuery Scrollbar -->
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js">
  </script>
  <!-- Bootstrap Notify -->
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js">
  </script>
  <!-- Sweet Alert -->
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
  <!-- Kaiadmin JS -->
  <script data-navigate-once src="{{ asset('admin-assets') }}/assets/js/kaiadmin.min.js"></script>


</body>

</html>
