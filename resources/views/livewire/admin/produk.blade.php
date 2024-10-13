<div>
    @include('livewire.admin.partials.breadcrumb', [
        'title' => 'List Produk',
        'menus' => [['title' => 'List Produk', 'route' => route('admin.produk')]],
    ])

    <style>
        .btn-disabled {
            pointer-events: none;
            opacity: 0.6;
        }
    </style>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="card-title d-flex">
                        <button class="btn btn-secondary btn-sm border d-flex align-items-center me-2"
                            data-bs-toggle="modal" data-bs-target="#modalForm">
                            <i class="icon-plus"></i>
                            <span class="icon-class ms-2">Tambah Produk</span>
                        </button>
                        <a wire:navigate href="{{ route('admin.produk') }}">
                            <button class="btn btn-dark btn-sm border d-flex align-items-center">
                                <i class="icon-refresh"></i>
                                <span class="icon-class ms-2">Refresh halaman</span>
                            </button>
                        </a>

                        {{-- Modal Form --}}
                        <div wire:ignore.self class="modal fade" id="modalForm" data-bs-backdrop="static"
                            data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEditLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalEditLabel">
                                            Tambah Data</h5>
                                        <button wire:click="resetInputFields" type="button" class="btn-close"
                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form wire:submit="storeItem">
                                        <div x-data="{ uploading: false, progress: 0 }"
                                            x-on:livewire-upload-start="uploading = true; progress = 0"
                                            x-on:livewire-upload-finish="uploading = false"
                                            x-on:livewire-upload-cancel="uploading = false"
                                            x-on:livewire-upload-error="uploading = false"
                                            x-on:livewire-upload-progress="progress = $event.detail.progress">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="nama" class="form-label">Item <span
                                                                    class="text-danger">*</span></label>
                                                            <input wire:model="name" type="text" class="form-control"
                                                                placeholder="Nama item">
                                                            @error('name')
                                                                <small class="text-danger">{{ $message }}</small>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="kategori_id" class="form-label">Kategori <span
                                                                    class="text-danger">*</span></label>
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
                                                            <label for="harga" class="form-label">Harga <span
                                                                    class="text-danger">*</span></label>
                                                            <input wire:model="price" type="number" min="500"
                                                                step="500" placeholder="0" class="form-control">
                                                            @error('price')
                                                                <small class="text-danger">{{ $message }}</small>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="umkm_id" class="form-label">UMKM <span
                                                                    class="text-danger">*</span></label>
                                                            @can('admin')
                                                                <select wire:model="seller_id" class="form-control">
                                                                    <option value="">Pilih UMKM</option>
                                                                    @foreach ($sellers as $umkm)
                                                                        <option selected value="{{ $umkm->id }}">
                                                                            {{ $umkm->user->name }}
                                                                        </option>
                                                                    @endforeach
                                                                </select>
                                                            @endcan
                                                            @can('umkm')
                                                                <select disabled class="form-control">
                                                                    @can('umkm')
                                                                        <option>
                                                                            {{ $sellers->user->name }}
                                                                        </option>
                                                                    @endcan
                                                                </select>
                                                            @endcan
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="gambar" class="form-label">Gambar <span
                                                                    class="text-secondaryy">*</span></label>
                                                            <input wire:model="image" type="file"
                                                                class="form-control gambar-input" accept="image/*">
                                                            @error('image')
                                                                <small
                                                                    class="text-danger d-block mt-2">{{ $message }}</small>
                                                            @enderror
                                                            <small wire:loading wire:target="image" class="loading">
                                                                Uploading...&nbsp;
                                                                <span x-text="progress + '%'"></span>
                                                            </small>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="image" class="form-label">Preview</label>
                                                            @php
                                                                $img = $this->image
                                                                    ? $this->image->temporaryUrl()
                                                                    : asset('img/no-image.jpg');
                                                            @endphp
                                                            <img src="{{ $img }}"
                                                                class="img-fluid d-block rounded border img-preview"
                                                                style="width: 100%; height: auto; aspect-ratio: 16/9; object-fit: cover;"
                                                                alt="img">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer" wire:loading.attr="disabled">
                                                <button wire:loading.attr="disabled" wire:target="image"
                                                    type="submit" class="btn btn-primary">Simpan</button>
                                                <button wire:click="resetInputFields" type="button"
                                                    class="btn btn-light border"
                                                    data-bs-dismiss="modal">Kembali</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        {{-- Modal Delete --}}
                        <div wire:ignore.self class="modal fade" id="modalFormDelete" data-bs-backdrop="static"
                            data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEditLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalEditLabel">
                                            Hapus Data</h5>
                                        <button wire:click="resetInputFields" type="button"
                                            class="btn-close btn-close-delete" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <form wire:submit="deleteItem">
                                        <div class="modal-body h6">
                                            Data produk <b>{{ $this->name }}</b> akan dihapus dari database?
                                        </div>
                                        <div class="modal-footer" wire:loading.attr="disabled">
                                            <button wire:loading.attr="disabled" wire:target="image" type="submit"
                                                class="btn btn-danger">Hapus</button>
                                            <button wire:click="resetInputFields" type="button"
                                                class="btn btn-light border" data-bs-dismiss="modal">Batal</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="card-body">
                    <x-table :data="$items" route="admin.produk">
                        <table class="custom-table">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Gambar</th>
                                    <th scope="col">Nama Item</th>
                                    @can('admin')
                                        <th scope="col">UMKM</th>
                                    @endcan
                                    <th scope="col">Harga</th>
                                    <th scope="col">Harga Koperasi</th>
                                    <th scope="col" class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($items as $index => $item)
                                    <tr>
                                        <td>
                                            {{ $loop->iteration + ($items->currentPage() - 1) * $items->perPage() }}.
                                        </td>
                                        <td>
                                            @if ($item->image)
                                                <img class="img-fluid rounded border"
                                                    src="{{ asset("storage/$item->image") }}"
                                                    style="width: 80px; height: auto; aspect-ratio: 16/9; object-fit: cover;"
                                                    alt="preview">
                                            @else
                                                <img class="img-fluid rounded border"
                                                    src="{{ asset('img/no-image.jpg') }}"
                                                    style="width: 80px; height: auto; aspect-ratio: 16/9; object-fit: cover;"
                                                    alt="preview">
                                            @endif
                                        </td>
                                        <td>{{ $item->name }}</td>
                                        @can('admin')
                                            <td>{{ $item->seller->user->name }}</td>
                                        @endcan
                                        <td class="text-nowrap">{{ formatRupiah($item->real_price) }}</td>
                                        <td class="text-nowrap">
                                            {{ formatRupiah($item->price) }}
                                            <sup data-bs-toggle="tooltip" title="Naik 5% dari harga awal"
                                                class="text-success"
                                                style="font-weight: 900;">+{{ $percentage }}%</sup>
                                        </td>
                                        <td>
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="form-check form-switch text-nowrap p-0">
                                                        <input class="form-check-input p-0" type="checkbox"
                                                            id="produk_unggulan{{ $item->id }}"
                                                            @checked($item->is_featured_product)
                                                            wire:change="changeFeaturedProduct({{ $item->id }}, $event.target.checked)">
                                                        <label style="font-size: .8rem !important;"
                                                            class="form-check-label"
                                                            for="produk_unggulan{{ $item->id }}">Produk
                                                            Unggulan</label>
                                                    </div>
                                                </div>
                                                <div class="col-5 ms-2">
                                                    <div class="text-nowrap">
                                                        <a href="{{ route('admin.produk.edit', $item->id) }}"
                                                            wire:navigate
                                                            class="btn btn-sm btn-primary edit-btn d-inline-flex align-items-center"
                                                            style="padding: 6px 9px;">
                                                            <i class="icon-note" style="font-size: 1.2em;"></i>
                                                        </a>
                                                        <button wire:loading.attr="disabled"
                                                            wire:target="getDeleteItem({{ $item->id }})"
                                                            wire:click="getDeleteItem({{ $item->id }})"
                                                            wire:key="delete-item-{{ $item->id }}"
                                                            class="btn btn-danger btn-sm delete-btn d-inline-flex align-items-center"
                                                            style="padding: 6px 9px">
                                                            <i class="icon-trash" style="font-size: 1.2em;"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="7" class="text-center text-muted">
                                            {{ $this->search ? 'Data yang dicari tidak ditemukan.' : 'Belum ada data item.' }}
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
                var btn = document.querySelector('.btn-close');
                btn.click();

                var btnDelete = document.querySelector(`.btn-close-delete`);
                btnDelete.click();
            });

            $wire.on('item-loaded', (event) => {
                var modalDelete = new bootstrap.Modal(document.getElementById('modalFormDelete'));
                modalDelete.show();
            });
        </script>
    @endscript
</div>
