<section class="ftco-section"
  style="position: relative; background-image: url('{{ asset('img/bg-login.png') }}'); background-size: cover; background-position: center;">
  <div class="container">
    <div class="row justify-content-center align-items-center" style="height: 100vh;">
      <div class="col-lg-9">
        <div class="card p-3 p-lg-5">
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <h6>Sistem Rekomendasi Produk UMKM<br>rekomU</h6>
              <a href="{{ route('front.beranda') }}" wire:navigate>
                <img style="width: 50px; height: 50px; object-fit: cover;" class="border"
                  src="{{ asset('img/logo.png') }}" alt="logo">
              </a>
            </div>
            <h4>Register</h4>

            <div class="mt-5">
              @if (session('error'))
                <div class="alert alert-danger">{{ session('error') }}</div>
              @endif
              <form wire:submit="register">
                <div class="row justify-content-center">
                  <div class="col-lg-6">
                    <div class="mb-4">
                      <input wire:model="name" type="text" class="form-control py-4" placeholder="Nama User / UMKM">
                      @error('name')
                        <small class="text-danger mt-1 d-block">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="mb-4">
                      <input wire:model="email" type="text" class="form-control py-4" placeholder="Alamat Email">
                      @error('email')
                        <small class="text-danger mt-1 d-block">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="mb-4">
                      <input wire:model.defer="password" type="password" class="form-control py-4"
                        placeholder="Password">
                      @error('password')
                        <small class="text-danger mt-1 d-block">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="mb-4">
                      <input wire:model.defer="password_confirmation" type="password" class="form-control py-4"
                        placeholder="Konfirmasi Password">
                      @error('password_confirmation')
                        <small class="text-danger mt-1 d-block">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="mb-4">
                      <select wire:model="group_id" class="form-control" style="height: 40px;">
                        <option value="">Pilh Tipe Akun</option>
                        @foreach ($groups as $item)
                          <option value="{{ $item->id }}">{{ $item->name }}</option>
                        @endforeach
                      </select>
                      @error('group_id')
                        <small class="text-danger mt-1 d-block">{{ $message }}</small>
                      @enderror
                    </div>
                  </div>
                </div>
                <div class="text-center">
                  <button type="submit" style="width: 200px;" class="btn btn-dark py-3 text-center">Buat Akun</button>
                  <button type="reset" style="width: 200px;"
                    class="btn btn-light border py-3 text-center">Reset</button>
                </div>
              </form>
            </div>
            <div class="mt-4">
              <p class="text-center">Sudah punya akun? <a href="{{ route('login') }}" wire:navigate>Login</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
