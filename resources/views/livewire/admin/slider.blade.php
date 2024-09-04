<div>
  @include('livewire.admin.partials.breadcrumb', [
      'title' => 'Slider',
      'menus' => [['title' => 'Slider', 'route' => route('admin.slider')]],
  ])

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-flex">
            <button class="btn btn-secondary btn-sm border d-flex align-items-center me-2" data-bs-toggle="modal"
              data-bs-target="#modalForm">
              <i class="icon-plus"></i>
              <span class="icon-class ms-2">Tambah Slider</span>
            </button>
            <a wire:navigate href="{{ route('admin.slider') }}">
              <button class="btn btn-dark btn-sm border d-flex align-items-center">
                <i class="icon-refresh"></i>
                <span class="icon-class ms-2">Refresh halaman</span>
              </button>
            </a>

            {{-- Modal Form --}}
            <div wire:ignore.self class="modal fade" id="modalForm" data-bs-backdrop="static" data-bs-keyboard="false"
              tabindex="-1" aria-labelledby="modalEditLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="modalEditLabel">{{ $updateMode ? 'Edit' : 'Tambah' }} Data</h5>
                    <button wire:click="resetFormCreate" type="button" class="btn-close" data-bs-dismiss="modal"
                      aria-label="Close"></button>
                  </div>
                  <form wire:submit="{{ $updateMode ? 'update' : 'store' }}">
                    <div class="modal-body">
                      <div class="mb-2">
                        <label class="form-label">Judul Slider <span class="text-danger">*</span></label>
                        <input wire:model="name" type="text" class="form-control">
                        @error('name')
                          <small class="text-danger">{{ $message }}</small>
                        @enderror
                      </div>
                      <div class="mb-2">
                        <label class="form-label">
                          Gambar <span class="text-danger">*</span>&nbsp;&nbsp;
                          <span wire:loading wire:target="image" class="text-loading">Uploading...</span>
                        </label>
                        <input wire:model="image" type="file" class="form-control">
                        @error('image')
                          <small class="text-danger">{{ $message }}</small>
                        @enderror
                        <img class="mt-3 img-fluid border rounded"
                          style="height: auto; aspect-ratio: 16/9; object-fit: cover; object-position: center;"
                          src="{{ $image ? $image->temporaryUrl() : ($this->imageData ? asset("storage/$this->imageData") : asset('img/no-image.jpg')) }}"
                          alt="img">
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button wire:loading.attr="disabled" wire:target="image" type="submit"
                        class="btn btn-primary">{{ $updateMode ? 'Ubah' : 'Simpan' }}</button>
                      <button wire:click="resetFormCreate" id="btnClose" type="button" class="btn btn-light border"
                        data-bs-dismiss="modal">Kembali</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>

            {{-- ModalDelete --}}
            <div wire:ignore.self class="modal fade" id="modalFormDelete" data-bs-backdrop="static"
              data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEditLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="modalEditLabel">
                      Hapus Data</h5>
                    <button wire:click="resetFormCreate" type="button" class="btn-close btn-close-delete"
                      data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form wire:submit="destroy">
                    <div class="modal-body h6">
                      Hapus slider : <b>{{ $this->name }}</b>?
                    </div>
                    <div class="modal-footer" wire:loading.attr="disabled">
                      <button wire:loading.attr="disabled" wire:target="image" type="submit"
                        class="btn btn-danger">Hapus</button>
                      <button wire:click="resetFormCreate" type="button" class="btn btn-light border"
                        data-bs-dismiss="modal">Batal</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="card-body">
          <x-table :data="$sliders" route="admin.kategori">
            <table class="custom-table">
              <thead>
                <tr>
                  <th scope="col">No</th>
                  <th scope="col">Judul Slider</th>
                  <th scope="col">Aksi</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($sliders as $slider)
                  <tr>
                    <td>
                      {{ $loop->iteration + ($sliders->currentPage() - 1) * $sliders->perPage() }}.</td>
                    </td>
                    <td>{{ $slider->name }}</td>
                    <td>
                      <button wire:click="getEditItem({{ $slider->id }})" wire:loading.attr="disabled"
                        wire:target="getEditItem({{ $slider->id }})" wire:key="slider-edit-({{ $slider->id }})"
                        class="btn btn-sm btn-primary edit-btn d-inline-flex align-items-center"
                        style="padding: 6px 9px;">
                        <i class="icon-note" style="font-size: 1.2em;"></i>
                      </button>
                      <button wire:click="getDeleteItem({{ $slider->id }})" wire:loading.attr="disabled"
                        wire:target="getDeleteItem({{ $slider->id }})"
                        wire:key="slider-delete-({{ $slider->id }})"
                        class="btn btn-danger btn-sm delete-btn d-inline-flex align-items-center"
                        style="padding: 6px 9px">
                        <i class="icon-trash" style="font-size: 1.2em;"></i>
                      </button>
                    </td>
                  </tr>
                @empty
                  <tr>
                    <td colspan="3" class="text-center text-muted">
                      {{ $this->search ? 'Data yang dicari tidak ditemukan.' : 'Belum ada data slider.' }}</td>
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
        let btn = document.getElementById('btnClose');
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
