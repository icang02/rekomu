<div class="top-header-area" id="sticker">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-sm-12 text-center">
        <div class="main-menu-wrap">
          {{-- Logo --}}
          <div class="site-logo">
            <a href="{{ route('front.beranda') }}" wire:navigate>
              <img width="50" src="{{ asset('img/logo.png') }}" alt="logo">
            </a>
          </div>
          {{-- Logo End --}}

          {{-- Menu Start --}}
          <nav class="main-menu">
            <ul>
              <li @class(['current-list-item' => Request::routeIs('front.beranda')])>
                <a href="{{ route('front.beranda') }}" wire:navigate>Beranda</a>
              </li>
              <li @class([
                  'current-list-item' =>
                      Request::routeIs('front.produk') ||
                      Request::routeIs('front.produk-detail'),
              ])>
                <a href="{{ route('front.produk') }}" wire:navigate>Produk</a>
              </li>
              <li @class(['current-list-item' => Request::routeIs('front.tentang')])>
                <a href="{{ route('front.tentang') }}" wire:navigate>Tentang</a>
              </li>
              @if (auth()->check() && auth()->user()->group_id == 2)
                <li @class(['current-list-item' => Request::routeIs('front.rekomendasi')])>
                  <a href="{{ route('front.rekomendasi') }}" wire:navigate>Rekomendasi</a>
                </li>
              @endif

              @guest
                <li class="ml-3">
                  <a href="{{ route('login') }}" wire:navigate class="d-inline-flex align-items-center">
                    <i class="fas fa-sign"></i>
                    &nbsp;&nbsp; Login
                  </a>
                </li>
              @endguest

              @if (auth()->check())
                <li class="ml-3" @class(['current-list-item' => Request::routeIs('front.tentang')])>
                  <a class="d-inline-flex align-items-center">
                    <i class="fas fa-user"></i>
                    &nbsp;&nbsp; Akun
                  </a>
                  <ul class="sub-menu">
                    @if (auth()->user()->group_id != 2)
                      <li><a href="{{ route('admin.dashboard') }}">Dashboard</a></li>
                    @endif
                    @if (auth()->user()->group_id == 2)
                      <li><a wire:navigate href="{{ route('front.profil') }}">Profil Saya</a></li>
                      <li><a wire:navigate href="{{ route('front.riwayat') }}">Riwayat Pesanan</a></li>
                    @endif
                    <li><a href="{{ route('logout') }}">Logout</a></li>
                  </ul>
                </li>
              @endif

              <li>
                <div class="header-icons">
                  @if (auth()->check() && auth()->user()->group_id == 2)
                    <livewire:partials.cart-count />
                  @endif
                  <a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                </div>
              </li>
            </ul>
          </nav>
          <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
          <div class="mobile-menu"></div>
          {{-- Menu End --}}
        </div>
      </div>
    </div>
  </div>

  <form wire:submit="searching">
    <div class="search-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <span class="close-btn"><i class="fas fa-window-close"></i></span>
            <div class="search-bar">
              <div class="search-bar-tablecell">
                <h3>Search For:</h3>
                <input wire:model="search" type="text" placeholder="Keywords">
                <button type="submit">Search <i class="fas fa-search"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
