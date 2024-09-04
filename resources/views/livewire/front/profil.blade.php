<div>
  @include('livewire.front.partials.breadcrumb', ['title' => 'Profil'])
  @php
    $imgProfil =
        $image && in_array($image->getClientOriginalExtension(), ['jpg', 'jpeg', 'png'])
            ? $image->temporaryUrl()
            : (auth()->user()->image
                ? asset('storage/' . auth()->user()->image)
                : asset('img/default-user.png'));
  @endphp

  <style>
    .text-c-dark {
      color: #363C45;
    }

    .text-c-muted {
      color: #808489;
    }

    .text-md {
      font-size: 1rem;
    }

    .text-sm {
      font-size: 0.95rem;
      margin-top: -17px !important;
    }
  </style>

  <div class="latest-news mb-100">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-7" style="margin: 4.5rem 0;">
          <div class="card shadow">
            <div class="card-header d-flex align-items-center justify-content-between">
              <div>
                <p class="h6 text-c-dark text-md">Informasi Akun</p>
                <p class="text-c-muted text-sm">
                  Atur informasi profil dasar Anda
                </p>
              </div>
              <p wire:loading wire:target="image" style="font-size: 0.87rem; font-weight: 600;" class="text-loading">
                Uploading...</p>
              @error('image')
                <p style="font-size: 0.8rem; font-weight: 600;" class="text-danger">
                  {{ $message }}</p>
              @enderror
            </div>
            <div class="card-body">
              <!-- Modal -->
              <div wire:ignore.self class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Password</h5>
                      <button wire:click="resetForm" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form wire:submit="resetPassword">
                      <div class="modal-body">
                        <div class="form-group">
                          <label>Password Baru</label>
                          <input wire:model="new_password" type="password" class="form-control" placeholder="******">
                          @error('new_password')
                            <small class="form-text text-danger">
                              {{ $message }}</small>
                          @enderror
                        </div>
                        <div class="form-group">
                          <label>Konfirmasi Password</label>
                          <input wire:model="new_password_confirmation" type="password" class="form-control"
                            placeholder="******">
                          @error('new_password_confirmation')
                            <small class="form-text text-danger">
                              {{ $message }}</small>
                          @enderror
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Reset Password</button>
                        <button wire:click="resetForm" type="button" class="btn btn-light border"
                          data-dismiss="modal">Batal</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

              <div wire:ignore.self class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Hapus Akun</h5>
                      <button wire:click="resetForm" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form wire:submit="confirmDeleteAccount">
                      <div class="modal-body">
                        <div class="form-group">
                          <label style="cursor: text">ketik "{{ auth()->user()->email }}" untuk konfirmasi hapus
                            akun.</label>
                          <input wire:model.live="check_email" type="text" class="form-control">
                          @error('check_email')
                            <small class="form-text text-danger">
                              {{ $message }}</small>
                          @enderror
                        </div>
                      </div>
                      <style>
                        .disabled {
                          cursor: not-allowed;
                        }
                      </style>
                      <div class="modal-footer">
                        <button @disabled(!$isValidCheck) type="submit"
                          class="btn btn-danger {{ !$isValidCheck ? 'disabled' : '' }}">Selanjutnya</button>
                        <button wire:click="resetForm" type="button" class="btn btn-light border"
                          data-dismiss="modal">Batal</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

              <div wire:ignore.self class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Hapus Akun</h5>
                      <button wire:click="resetForm" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form wire:submit="deleteAccount">
                      <div class="modal-body">
                        Setelah akun terhapus seluruh data tidak dapat dipulihkan. Lanjutkan hapus akun?
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Hapus Akun</button>
                        <button wire:click="resetForm" type="button" class="btn btn-light border"
                          data-dismiss="modal">Batal</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

              <form wire:submit="update">
                <div class="row">
                  <div class="col-lg-12 text-center mt-2">
                    <label for="image" style="position: relative; cursor: pointer;">
                      <img width="130" height="130" style="object-fit: cover; object-position: center;"
                        src="{{ $imgProfil }}" alt="img" class="rounded-circle border">
                      <span class="bg-primary"
                        style="font-size: 0.9rem; position: absolute; bottom: 5px; left: 67%; color: #fff; width: 30px; padding: 2px 5px 2px 5px; border-radius: 50%;">
                        <i class="fas fa-edit"></i>
                      </span>
                    </label>
                    <input class="d-none" type="file" wire:model="image" id="image" accept="image/*">
                  </div>
                  <div class="col-lg-12 mt-4">
                    <div class="mb-4">
                      <h6 class="text-c-dark text-ms">Email</h6>
                      <p class="text-c-muted text-sm">Alamat email yang digunakan untuk login ke dalam akun.</p>
                      <input wire:model="email" type="text" class="form-control py-4"
                        style="margin-top: -10px; font-size: 1rem;">
                      @error('email')
                        <span class="text-danger" style="font-size: 0.85rem;">{{ $message }}</span>
                      @enderror
                    </div>
                    <div class="mb-4">
                      <h6 class="text-c-dark text-ms">Nama lengkap</h6>
                      <p class="text-c-muted text-sm">Nama yang digunakan untuk ditampilkan di sistem,</p>
                      <input wire:model="name" type="text" class="form-control py-4"
                        style="margin-top: -10px; font-size: 1rem;">
                      @error('name')
                        <span class="text-danger" style="font-size: 0.85rem;">{{ $message }}</span>
                      @enderror
                    </div>
                    <div class="d-flex justify-content-end">
                      @if (session('success'))
                        <span style="font-size: 0.87rem; font-weight: 600; transition: 0.3s ease-in;"
                          class="text-success mr-3">
                          {{ session('success') }}
                        </span>
                      @endif
                      <button wire:loading.attr='disabled' wire:target='image' type="submit"
                        class="btn btn-primary btn-sm px-3 py-2 font-weight-bold">Simpan</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="card shadow mt-4">
            <div class="card-body shadow d-flex justify-content-between align-items-center">
              <div>
                <p class="h6 text-c-dark text-md">Password Akun</p>
                <p class="text-c-muted text-sm">
                  Reset atau ubah password
                </p>
              </div>
              @if (session('reset_password'))
                <p style="font-size: 0.8rem; font-weight: 600;" class="text-success">
                  {{ session('reset_password') }}</p>
              @endif
              <button data-toggle="modal" data-target="#exampleModal"
                class="btn btn-outline-dark btn-sm px-3 py-2 font-weight-bold">Atur password</button>
            </div>
          </div>
          <div class="card shadow mt-4">
            <div class="card-body shadow d-flex justify-content-between align-items-center">
              <div>
                <p class="h6 text-c-dark text-md">Hapus Akun</p>
                <p class="text-c-muted text-sm">
                  Ikuti petunjuk jika ingin menghapus akun
                </p>
              </div>
              <button data-toggle="modal" data-target="#exampleModal1"
                class="btn btn-danger btn-sm px-3 py-2 font-weight-bold">Lanjutkan</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

@script
  <script>
    $wire.on('reset_password', (event) => {
      $('#exampleModal').modal('hide')
    });
    $wire.on('valid-email', (event) => {
      $('#exampleModal1').modal('hide')
      setTimeout(() => {
        $('#exampleModal2').modal('show')
      }, 200);
    });
  </script>
@endscript
