<section class="ftco-section"
  style="position: relative; background-image: url('{{ asset('img/bg-login.png') }}'); background-size: cover; background-position: center;">
  <div class="container">
    <div class="row justify-content-center align-items-center" style="height: 100vh;">
      <div class="col-lg-5">
        <div class="card p-3 p-lg-5">
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <h6>Sistem Rekomendasi Produk UMKM<br>rekomU</h6>
              <a href="{{ route('front.beranda') }}" wire:navigate>
                <img style="width: 50px; height: 50px; object-fit: cover;" class="border"
                  src="{{ asset('img/logo.png') }}" alt="logo">
              </a>
            </div>
            <h4>Login</h4>

            <div class="mt-5">

              @if (session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
              @elseif (session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
              @endif

              <form wire:submit="authenticate">
                <div class="mb-4">
                  <input wire:model="email" type="text" class="form-control py-4" placeholder="Username / Email">
                  @error('email')
                    <small class="text-danger mt-1 d-block">{{ $message }}</small>
                  @enderror
                </div>
                <div class="mb-4">
                  <input wire:model.defer="password" type="password" class="form-control py-4" placeholder="******">
                  @error('password')
                    <small class="text-danger mt-1 d-block">{{ $message }}</small>
                  @enderror
                </div>
                <div>
                  <button class="btn btn-dark py-3 w-100 text-center">Masuk</button>
                </div>
              </form>
            </div>

            <div class="mt-4">
              <p class="text-center">Belum punya akun? <a href="{{ route('register') }}" wire:navigate>Daftar</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</section>
