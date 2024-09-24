<div>
    @include('livewire.admin.partials.breadcrumb', [
        'title' => 'Profil',
        'menus' => [['title' => 'Profil', 'route' => route('admin.profil')]],
    ])

    <div class="card p-3">
        <div class="card-header">
            <div style="font-weight: 700; font-size: 1.1rem;">Informasi Akun</div>
            <div class="text-muted">Atur informasi profil dasar Anda</div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-lg-3">
                    <img style="height: auto; object-fit: cover; object-position: cover; aspect-ratio: 1/1;"
                        src="{{ $image ? $image->temporaryUrl() : ($imageData ? asset("storage/$imageData") : asset('img/default-umkm.png')) }}"
                        alt="img" class="img-fluid border rounded">
                    <hr>
                    <label class="btn btn-light border border-secondary w-100" for="image">Upload Image</label>
                </div>
                <div class="col-lg-9">
                    <form wire:submit="updateProfil">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label mb-2">Nama <span class="text-danger">*</span></label>
                                    <input wire:model="name" type="text" class="form-control">
                                    @error('name')
                                        <div class="form-text text-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label mb-2">Username / Email <span
                                            class="text-danger">*</span></label>
                                    <input wire:model="email" type="text" class="form-control">
                                    @error('email')
                                        <div class="form-text text-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            @if (Auth::user()->group_id === 3)
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label mb-2">Alamat <span class="text-dark">*</span></label>
                                        <textarea wire:model="address" class="form-control" placeholder="Jl. Badewi"></textarea>
                                        @error('address')
                                            <div class="form-text text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="mb-3">
                                        <label class="form-label mb-2">Link Maps <span
                                                class="text-dark">*</span></label>
                                        <input wire:model="location" type="text" class="form-control"
                                            placeholder="https://maps.app.goo.gl">
                                        @error('location')
                                            <div class="form-text text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            @endif

                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label mb-2">Password Baru <span
                                            class="text-danger">*</span></label>
                                    <input placeholder="******" wire:model="new_password" type="text"
                                        class="form-control">
                                    @error('new_password')
                                        <div class="form-text text-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-3">
                                    <label class="form-label mb-2">Konfirmasi Password <span
                                            class="text-danger">*</span></label>
                                    <input placeholder="******" wire:model="new_password_confirmation" type="text"
                                        class="form-control">
                                    @error('new_password_confirmation')
                                        <div class="form-text text-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <input id="image" wire:model="image" type="file" class="d-none" accept="image/*">
                            <button wire:loading.attr="disabled" wire:target="image" type="submit"
                                class="btn btn-primary">Simpan</button>
                            &nbsp;&nbsp;&nbsp;
                            @error('image')
                                <span class="form-text text-danger">{{ $message }}</span>&nbsp;&nbsp;
                            @enderror
                            <span wire:loading wire:target="image" class="text-loading">Uploading</span>
                        </div>
                    </form>

                    @if (Auth::user()->group_id === 1)
                        <div class="col-lg-12">
                            <hr class="my-4">
                            <form wire:submit="changePercentagePrice">
                                <div class="mb-3">
                                    <label class="form-label mb-2">Kenaikan harga produk <span
                                            class="text-dark">(%)</span>
                                    </label>
                                    <div class="d-flex align-items-center">
                                        <input placeholder="5%" wire:model="percentage" inputmode="numeric"
                                            type="text" min="1" max="20" class="form-control"
                                            style="width: fit-content">
                                        <button wire:loading.attr="disabled" wire:target="image" type="submit"
                                            class="btn btn-warning">Update</button>
                                    </div>
                                    @error('percentage')
                                        <span class="form-text text-danger">{{ $message }}</span>&nbsp;&nbsp;
                                    @enderror
                                </div>
                            </form>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
