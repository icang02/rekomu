<div>
  @include('livewire.admin.partials.breadcrumb', [
      'title' => 'List UMKM',
      'menus' => [['title' => 'List UMKM', 'route' => route('admin.umkm')]],
  ])

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-flex">
            <button class="btn btn-secondary btn-sm border d-flex align-items-center me-2" data-bs-toggle="modal"
              data-bs-target="#modalForm">
              <i class="icon-plus"></i>
              <span class="icon-class ms-2">Tambah Data</span>
            </button>
            <a wire:navigate href="{{ route('admin.umkm') }}">
              <button class="btn btn-dark btn-sm border d-flex align-items-center">
                <i class="icon-refresh"></i>
                <span class="icon-class ms-2">Refresh halaman</span>
              </button>
            </a>

            {{-- Modal Form --}}
            <div wire:ignore.self class="modal fade" id="modalForm" data-bs-backdrop="static" data-bs-keyboard="false"
              tabindex="-1" aria-labelledby="modalEditLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="modalEditLabel">{{ $updateMode ? 'Edit' : 'Tambah' }} Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form wire:submit="{{ $updateMode ? 'update' : 'store' }}">
                    <div class="modal-body">
                      <div class="row">
                        <div class="col-lg-6">
                          <div class="mb-3">
                            <label class="form-label">UMKM <span class="text-danger">*</span></label>
                            <input wire:model="name" type="text" class="form-control" placeholder="Nama UMKM">
                            @error('name')
                              <small class="text-danger">{{ $message }}</small>
                            @enderror
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="mb-3">
                            <label class="form-label">Email <span class="text-danger">*</span></label>
                            <input wire:model="email" type="text" class="form-control" placeholder="email@gmail.com">
                            @error('email')
                              <small class="text-danger">{{ $message }}</small>
                            @enderror
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="mb-3">
                            <label class="form-label">Alamat <span class="text-danger">*</span></label>
                            <Textarea wire:model="address" placeholder="Jl. Badewi" rows="3" class="form-control"></Textarea>
                            @error('address')
                              <small class="text-danger">{{ $message }}</small>
                            @enderror
                          </div>
                          <div class="mb-3">
                            <label class="form-label">
                              Gambar <span class="text-dark">*</span>&nbsp;&nbsp;
                              <span wire:loading wire:target="image" class="text-loading">Uploading...</span>
                            </label>
                            <input wire:model="image" type="file" class="form-control gambar-input" accept="image/*">
                            @error('image')
                              <small class="text-danger">{{ $message }}</small>
                            @enderror
                          </div>
                          @if (!$updateMode)
                            <div class="mb-3">
                              <label class="form-label">Default password <span class="text-dark">*</span></label>
                              <div class="card-sub border">
                                <code class="highlighter-rouge" style="font-size: 1rem;">umkm_123</code>
                              </div>
                            </div>
                          @endif
                        </div>
                        <div class="col-lg-6">
                          <div class="mb-3">
                            <label class="form-label">Link Maps <span class="text-dark">*</span></label>
                            <input wire:model="location" type="text" class="form-control"
                              placeholder="https://maps.app.goo.gl">
                            @error('location')
                              <small class="text-danger">{{ $message }}</small>
                            @enderror
                          </div>
                          <div class="mb-3">
                            <label for="gambar" class="form-label">Preview</label>
                            <img class="img-fluid d-block rounded border img-preview"
                              src="{{ $image ? $image->temporaryUrl() : ($imageData ? asset("storage/$imageData") : asset('img/default-umkm.png')) }}"
                              style="width: 100%; height: auto; aspect-ratio: 16/9; object-fit: cover;" alt="img">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button wire:loading.attr="disabled" wire:target="image" type="submit"
                        class="btn btn-primary">{{ $updateMode ? 'Ubah' : 'Simpan' }}</button>
                      <button wire:click="resetForm" type="button" class="btn btn-light border"
                        data-bs-dismiss="modal">Kembali</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>

            {{-- Modal Delete --}}
            <div wire:ignore.self class="modal fade" id="modalFormDelete" data-bs-backdrop="static"
              data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEditLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="modalEditLabel">
                      Hapus Data</h5>
                    <button wire:click="resetForm" type="button" class="btn-close btn-close-delete"
                      data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form wire:submit="destroy">
                    <div class="modal-body h6">
                      Hapus UMKM <b>"{{ $name }}"</b>? Seluruh data yang berhubungan dengan UMKM ini akan ikut
                      terhapus!
                    </div>
                    <div class="modal-footer" wire:loading.attr="disabled">
                      <button wire:loading.attr="disabled" wire:target="image" type="submit"
                        class="btn btn-danger">Hapus</button>
                      <button wire:click="resetForm" type="button" class="btn btn-light border"
                        data-bs-dismiss="modal">Batal</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="card-body">
          <x-table :data="$sellers" route="admin.kategori">
            <table class="custom-table">
              <thead>
                <tr>
                  <th scope="col">No</th>
                  <th scope="col">Gambar</th>
                  <th scope="col">Nama UMKM</th>
                  <th scope="col">Alamat</th>
                  <th scope="col">Lokasi</th>
                  <th scope="col">Aksi</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($sellers as $item)
                  <tr>
                    <td>
                      {{ $loop->iteration + ($sellers->currentPage() - 1) * $sellers->perPage() }}.</td>
                    </td>
                    <td>
                      <img class="img-fluid rounded-circle border"
                        src="{{ asset($item->image ? "storage/$item->image" : 'img/default-umkm.png') }}"
                        style="width: 40px; height: auto; aspect-ratio: 1/1; object-fit: cover;" alt="img">
                    </td>
                    <td>{{ $item->name }}</td>
                    <td>{{ $item->seller->address }}</td>
                    <td>
                      <a href="{{ $item->seller->location ?? '#' }}"
                        @if ($item->seller->location) target="_blank" @endif
                        class="{{ $item->seller->location ? '' : 'disabled' }} btn btn-light border border-secondary btn-sm d-inline-flex align-items-center">
                        <img width="10" class="me-1" src="{{ asset('img/maps-icon.svg') }}" alt="maps">
                        Lihat Maps
                      </a>
                    </td>
                    <td>
                      <button wire:click="getEditItem({{ $item->id }})" wire:loading.attr="disabled"
                        wire:target="getEditItem({{ $item->id }})" wire:key="item-edit-({{ $item->id }})"
                        class="btn btn-sm btn-primary edit-btn d-inline-flex align-items-center"
                        style="padding: 6px 9px;">
                        <i class="icon-note" style="font-size: 1.2em;"></i>
                      </button>
                      <button wire:click="getDeleteItem({{ $item->id }})" wire:loading.attr="disabled"
                        wire:target="getDeleteItem({{ $item->id }})"
                        wire:key="item-delete-({{ $item->id }})"
                        class="btn btn-danger btn-sm delete-btn d-inline-flex align-items-center"
                        style="padding: 6px 9px">
                        <i class="icon-trash" style="font-size: 1.2em;"></i>
                      </button>
                    </td>
                  </tr>
                @empty
                  <tr>
                    <td colspan="6" class="text-center text-muted">
                      {{ $search ? 'Data yang dicari tidak ditemukan.' : 'Belum ada data.' }}</td>
                    </td>
                  </tr>
                @endforelse
              </tbody>
            </table>
          </x-table>
        </div>
      </div>
    </div>
  </div>

  @script
    <script>
      $wire.on('submitted', (event) => {
        let btn = document.querySelector('.btn-close');
        btn.click();
        let btnDelete = document.querySelector('.btn-close-delete');
        btnDelete.click();
      });

      $wire.on('data-edit-loaded', (event) => {
        let modalForm = new bootstrap.Modal(document.querySelector('#modalForm'));
        modalForm.show();
      });

      $wire.on('data-delete-loaded', (event) => {
        var modalDelete = new bootstrap.Modal(document.getElementById('modalFormDelete'));
        modalDelete.show();
      });
    </script>
  @endscript
</div>
