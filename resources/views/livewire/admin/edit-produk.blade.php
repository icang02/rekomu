<div>
  @include('livewire.admin.partials.breadcrumb', [
      'title' => 'List Produk',
      'menus' => [
          ['title' => 'List Produk', 'route' => route('admin.produk')],
          ['title' => 'Edit'],
          ['title' => $this->name, 'route' => route('admin.produk.edit', $this->id)],
      ],
  ])

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-flex">
            <a wire:navigate href="{{ route('admin.produk') }}">
              <button class="btn btn-dark btn-sm border d-flex align-items-center">
                <i class="icon-refresh"></i>
                <span class="icon-class ms-2">Kembali</span>
              </button>
            </a>
          </div>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-lg-8">
              <form wire:submit="updateItem">
                <div x-data="{ uploading: false, progress: 0 }" x-on:livewire-upload-start="uploading = true; progress = 0"
                  x-on:livewire-upload-finish="uploading = false" x-on:livewire-upload-cancel="uploading = false"
                  x-on:livewire-upload-error="uploading = false"
                  x-on:livewire-upload-progress="progress = $event.detail.progress">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="mb-3">
                        <label for="nama" class="form-label">Item <span class="text-danger">*</span></label>
                        <input wire:model="name" type="text" class="form-control" placeholder="Nama item">
                        @error('name')
                          <small class="text-danger">{{ $message }}</small>
                        @enderror
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-3">
                        <label for="kategori_id" class="form-label">Kategori <span class="text-danger">*</span></label>
                        <select wire:model="category_id" class="form-control">
                          <option value="">Pilih kategori</option>
                          @foreach ($categories as $kategori)
                            <option value="{{ $kategori->id }}">
                              {{ $kategori->name }}
                            </option>
                          @endforeach
                        </select>
                        @error('category_id')
                          <small class="text-danger">{{ $message }}</small>
                        @enderror
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-3">
                        <label for="harga" class="form-label">Harga<span class="text-danger">*</span></label>
                        <input wire:model.live="real_price" type="number" min="500" placeholder="0" step="500"
                          class="form-control">
                        @error('real_price')
                          <small class="text-danger">{{ $message }}</small>
                        @enderror
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-3">
                        <label for="harga" class="form-label">Harga Koperasi</label>
                        <input style="pointer-events: none;" wire:model="price" type="number" min="500"
                          placeholder="0" class="form-control">
                        @error('price')
                          <small class="text-danger">{{ $message }}</small>
                        @enderror
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-3">
                        <label for="umkm_id" class="form-label">UMKM <span class="text-danger">*</span></label>
                        @can('admin')
                          <select wire:model="seller_id" class="form-control">
                            <option value="">Pilih UMKM</option>
                            @foreach ($sellers as $umkm)
                              <option value="{{ $umkm->id }}">
                                {{ $umkm->user->name }}
                              </option>
                            @endforeach
                          </select>
                        @endcan
                        @can('umkm')
                          <select disabled wire:model="seller_id" class="form-control">
                            <option>
                              {{ $sellers->user->name }}
                            </option>
                          </select>
                        @endcan
                        @error('seller_id')
                          <small class="text-danger">{{ $message }}</small>
                        @enderror
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="mb-3">
                        <label for="gambar" class="form-label">
                          Gambar <span class="text-secondaryy">*</span>
                        </label>
                        <input wire:model="image" type="file" class="form-control gambar-input" accept="image/*">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <button wire:loading.attr="disabled" wire:target="image" type="submit"
                        class="btn btn-primary">Simpan</button>
                      <button wire:click="resetInputFields" type="button" class="btn btn-light border"
                        data-bs-dismiss="modal">Reset</button>
                    </div>
                    <div class="col-lg-6">
                      <small wire:loading wire:target="image" class="loading mt-2">
                        Uploading...&nbsp;
                        <span x-text="progress + '%'"></span>
                      </small>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="col-lg-4">
              @php
                $img = $this->image
                    ? $this->image->temporaryUrl()
                    : ($this->imageItem
                        ? asset("storage/$this->imageItem")
                        : asset('img/no-image.jpg'));
              @endphp
              <img class="img-fluid border rounded" src="{{ $img }}" alt="item"
                style="height: auto; aspect-ratio: 1/1; object-fit: cover;">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>
