  <div class="main-header">
    <div class="main-header-logo">
      <!-- Logo Header -->
      <div class="logo-header" data-background-color="dark">
        <a href="{{ route('admin.dashboard') }}" class="logo">
          <img src="{{ asset('img/logo.png') }}" alt="navbar brand" class="navbar-brand" height="20" />
        </a>
        <div class="nav-toggle">
          <button class="btn btn-toggle toggle-sidebar">
            <i class="gg-menu-right"></i>
          </button>
          <button class="btn btn-toggle sidenav-toggler">
            <i class="gg-menu-left"></i>
          </button>
        </div>
        <button class="topbar-toggler more">
          <i class="gg-more-vertical-alt"></i>
        </button>
      </div>
      <!-- End Logo Header -->
    </div>
    <!-- Navbar Header -->
    <nav class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
      <div class="container-fluid">
        <nav class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
          <h6 class="fw-bold">SELAMAT DATANG DI HALAMAN DASHBOARD</h6>
        </nav>
        <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
          <li class="nav-item topbar-user dropdown hidden-caret">
            <a class="dropdown-toggle profile-pic" data-bs-toggle="dropdown" href="#" aria-expanded="false">
              <div class="avatar-sm">
                <img src="{{ asset("$imgProfil") }}" alt="user" class="avatar-img rounded-circle" />
              </div>
              <span class="profile-username">
                <span class="op-7">Hi,</span>
                <span class="fw-bold">{{ auth()->user()->name }}</span>
              </span>
            </a>
            <ul class="dropdown-menu dropdown-user animated fadeIn">
              <div class="dropdown-user-scroll scrollbar-outer">
                <li>
                  <div class="user-box">
                    <div class="avatar-lg">
                      <img src="{{ asset("$imgProfil") }}" alt="image profile" class="avatar-img rounded" />
                    </div>
                    <div class="u-text">
                      <h4>{{ auth()->user()->name }}</h4>
                      <p class="text-muted">{{ auth()->user()->email }}</p>
                      <a href="{{ route('admin.profil') }}" wire:navigate class="btn btn-xs btn-secondary btn-sm">
                        Lihat Profil
                      </a>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="dropdown-divider"></div>
                  <a href="{{ route('logout') }}" class="dropdown-item">
                    <div class="icon-preview d-flex align-items-end">
                      <i class="icon-logout"></i>&nbsp;&nbsp;
                      <span style="transform: translateY(1.2px)">Logout</span>
                    </div>
                  </a>
                </li>
              </div>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
  </div>
