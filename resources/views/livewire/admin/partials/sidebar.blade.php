<div class="sidebar" data-background-color="dark">
    <div class="sidebar-logo">
        <!-- Logo Header -->
        <div class="logo-header" data-background-color="dark">
            <a href="{{ route('admin.dashboard') }}" wire:navigate class="logo d-flex">
                <img src="{{ asset('img/logo.png') }}" alt="navbar brand" class="navbar-brand" height="40" />
                <span class="text-light fw-bold" style="letter-spacing: 2px; margin-left: -7px;">ekomU</span>
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
    {{-- Sidebar Menu --}}
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <ul class="nav nav-secondary">
                <li class="nav-item {{ Route::is('admin.dashboard') ? 'active' : '' }}">
                    <a href="{{ route('admin.dashboard') }}">
                        <i class="fas fa-home"></i>
                        <p>Dashboard</p>
                    </a>
                </li>

                @if (Auth::user()->group_id === 1)
                    <li class="nav-section">
                        <span class="sidebar-mini-icon">
                            <i class="fa fa-ellipsis-h"></i>
                        </span>
                        <h4 class="text-section">Data Sistem</h4>
                    </li>
                    <li class="{{ request()->routeIs('admin.slider') ? 'active' : '' }} nav-item">
                        <a wire:navigate href="{{ route('admin.slider') }}">
                            <i class="fas fa-desktop"></i>
                            <p>Slider</p>
                        </a>
                    </li>
                    <li class="nav-item {{ Route::is('admin.kategori') ? 'active' : '' }}">
                        <a wire:navigate href="{{ route('admin.kategori') }}">
                            <i class="fas fa-layer-group"></i>
                            <p>Kategori</p>
                        </a>
                    </li>
                    <li
                        class="{{ request()->routeIs('admin.produk') || request()->routeIs('admin.produk.edit') ? 'active' : '' }} nav-item">
                        <a wire:navigate href="{{ route('admin.produk') }}">
                            <i class="fas fa-table"></i>
                            <p>Produk</p>
                        </a>
                    </li>
                    <li class="nav-section">
                        <span class="sidebar-mini-icon">
                            <i class="fa fa-ellipsis-h"></i>
                        </span>
                        <h4 class="text-section">Data UMKM & User</h4>
                    </li>
                    <li class="{{ request()->routeIs('admin.umkm') ? 'active' : '' }} nav-item">
                        <a wire:navigate href="{{ route('admin.umkm') }}">
                            <i class="fas fa-th-list"></i>
                            <p>UMKM</p>
                        </a>
                    </li>
                    <li class="{{ request()->routeIs('admin.user') ? 'active' : '' }} nav-item">
                        <a wire:navigate href="{{ route('admin.user') }}">
                            <i class="fas fa-file"></i>
                            <p>User</p>
                        </a>
                    </li>
                @endif

                @if (Auth::user()->group_id === 3)
                    <li class="nav-section">
                        <span class="sidebar-mini-icon">
                            <i class="fa fa-ellipsis-h"></i>
                        </span>
                        <h4 class="text-section">Menu Utama</h4>
                    </li>
                    <li
                        class="{{ request()->routeIs('admin.produk') || request()->routeIs('admin.produk.edit') ? 'active' : '' }} nav-item">
                        <a wire:navigate href="{{ route('admin.produk') }}">
                            <i class="fas fa-table"></i>
                            <p>Data Produk</p>
                        </a>
                    </li>
                    <li class="{{ request()->routeIs('admin.transaksi') ? 'active' : '' }} nav-item">
                        <a wire:navigate href="{{ route('admin.transaksi') }}">
                            <i class="far fa-chart-bar"></i>
                            <p>Transaksi</p>
                        </a>
                    </li>
                    <li
                        class="{{ request()->routeIs('admin.ulasan') || request()->routeIs('admin.ulasan.detail') ? 'active' : '' }} nav-item">
                        <a wire:navigate href="{{ route('admin.ulasan') }}">
                            <i class="fas fa-pen-square"></i>
                            <p>Ulasan</p>
                        </a>
                    </li>
                @endif
            </ul>
        </div>
    </div>
</div>
