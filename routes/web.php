<?php

use App\Livewire\Admin\Dashboard;
use App\Livewire\Admin\EditProduk;
use App\Livewire\Admin\Kategori;
use App\Livewire\Admin\Produk;
use App\Livewire\Admin\Profil as AdminProfil;
use App\Livewire\Admin\Slider;
use App\Livewire\Admin\Transaksi;
use App\Livewire\Admin\Ulasan;
use App\Livewire\Admin\UlasanShow;
use App\Livewire\Admin\Umkm;
use App\Livewire\Admin\User;
use App\Livewire\Auth\Login;
use App\Livewire\Auth\Register;
use App\Livewire\Front\Cart;
use App\Livewire\Front\Checkout;
use App\Livewire\Front\CheckoutSuccess;
use App\Livewire\Front\Produk as FrontProduk;
use App\Livewire\Front\ProdukDetail;
use App\Livewire\Front\Profil;
use App\Livewire\Front\Rekomendasi;
use App\Livewire\Front\Riwayat;
use App\Livewire\Front\Tentang;
use Illuminate\Support\Facades\Route;
use App\Livewire\Home;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;

Route::get('/seed', function () {
  return Artisan::call('migrate:fresh --seed');
});

Route::get('/', Home::class)
  ->name('front.beranda');
Route::get('/produk', FrontProduk::class)
  ->name('front.produk');
Route::get('/produk/{slug}', ProdukDetail::class)
  ->name('front.produk-detail');
Route::get('/tentang', Tentang::class)
  ->name('front.tentang');
Route::get('/rekomendasi', Rekomendasi::class)
  ->name('front.rekomendasi');


Route::middleware(['guest'])->group(function () {
  Route::get('/login', Login::class)->name('login');
  Route::get('/register', Register::class)->name('register');
});

Route::middleware(['auth'])->group(function () {
  Route::get('/logout', function (Request $request) {
    Auth::logout();
    $request->session()->invalidate();
    $request->session()->regenerateToken();
    return redirect()->route('login');
  })->name('logout');

  Route::prefix('dashboard')->group(function () {
    Route::middleware(['admin'])->group(function () {
      Route::get('/kategori', Kategori::class)->name('admin.kategori');
      Route::get('/slider', Slider::class)->name('admin.slider');
      Route::get('/umkm', Umkm::class)->name('admin.umkm');
      Route::get('/user', User::class)->name('admin.user');
    });
    Route::middleware(['umkm'])->group(function () {
      Route::get('/transaksi', Transaksi::class)->name('admin.transaksi');
      Route::get('/ulasan', Ulasan::class)->name('admin.ulasan');
      Route::get('/ulasan/{id}/produk', UlasanShow::class)->name('admin.ulasan.detail');
    });
    Route::middleware(['can:admin-umkm'])->group(function () {
      Route::get('/', Dashboard::class)->name('admin.dashboard');
      Route::get('/produk', Produk::class)->name('admin.produk');
      Route::get('/produk/{id}/edit', EditProduk::class)->name('admin.produk.edit');
      Route::get('/profil', AdminProfil::class)->name('admin.profil');
    });
  });

  Route::middleware(['user'])->group(function () {
    Route::get('/keranjang', Cart::class)
      ->name('front.keranjang');
    Route::get('/checkout', Checkout::class)
      ->name('front.checkout');
    Route::get('/checkout-success', CheckoutSuccess::class)
      ->name('front.checkout-success');
    Route::get('/riwayat-pesanan', Riwayat::class)
      ->name('front.riwayat');
    Route::get('/profil', Profil::class)
      ->name('front.profil');
  });
});
