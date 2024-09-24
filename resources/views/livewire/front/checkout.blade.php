<div>
    @include('livewire.front.partials.breadcrumb')

    <div class="checkout-section mt-100 mb-150">
        <div class="container">
            <form wire:submit="processCheckout">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="checkout-accordion-wrap">
                            <div class="accordion" id="accordionExample">
                                <div class="card single-accordion">
                                    <div class="card-header" id="headingOne">
                                        <h5 class="mb-0">
                                            <button class="btn btn-link" type="button" data-toggle="collapse"
                                                data-target="#collapseOne" aria-expanded="true"
                                                aria-controls="collapseOne">
                                                Informasi Pengiriman
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                        data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="billing-address-form">
                                                <span class="text-muted">Nomor Telepon :</span><br>
                                                <ul style="margin-top: 0px;">
                                                    <li>
                                                        <span>{{ '62' . Auth::user()->contact }}</span>
                                                    </li>
                                                </ul>

                                                <hr>

                                                <span class="text-muted">Alamat Pengiriman :</span><br>
                                                <ul style="margin-top: 0px;">
                                                    <li>
                                                        <span>{{ Auth::user()->address }}</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="order-details-wrap">
                            <table class="order-details">
                                <thead>
                                    <tr>
                                        <th>Detail Pesanan</th>
                                        <th>Jumlah</th>
                                        <th>Harga</th>
                                    </tr>
                                </thead>
                                <tbody class="order-details-body">
                                    @php
                                        $subTotal = 0;
                                    @endphp
                                    @foreach ($itemCheckout as $item)
                                        <tr>
                                            <td>{{ $item->item->name }}</td>
                                            <td>{{ $item->quantity }}</td>
                                            <td>{{ formatRupiah($item->item->price) }}</td>
                                        </tr>
                                        @php
                                            $subTotal += $item->quantity * $item->item->price;
                                        @endphp
                                    @endforeach
                                </tbody>
                                <tbody class="checkout-details">
                                    <tr style="font-weight: 700;">
                                        <td class="text-center" colspan="2">Total Pembayaran</td>
                                        <td class="text-nowrap">{{ formatRupiah($subTotal) }}</td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="mt-4">
                                <a tabindex="4" href="{{ route('front.keranjang') }}" wire:navigate
                                    class="btn-custom2 py-3">Kembali</a>
                                <button type="submit" id="submit-button" tabindex="3" wire:loading.class="disabled"
                                    class="btn-custom">
                                    Lanjutkan
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div wire:ignore.self class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Informasi Pembayaran</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form wire:submit="storeCheckout">
                    <div class="modal-body">
                        <p>
                            Apakah Anda akan membayar sekarang? Jika ya, silakan transfer ke nomor rekening berikut :
                        </p>
                        <b>Bank Mandiri</b>
                        <ul>
                            <li>Nomor Rekening: <b>14000 9876 5432 1</b></li>
                            <li>Atas Nama: <b>Dinas Koperasi dan UKM Kabupaten Kolaka</b></li>
                        </ul>

                        <p>
                            Setelah melakukan transfer mohon klik tombol bayar sekarang untuk menyelesaikan transaksi.
                        </p>
                        <p>
                            Terima kasih!
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-dark">Bayar Sekarang</button>
                        <button type="button" class="btn btn-light border" data-dismiss="modal">Batal</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    @script
        <script>
            $wire.on('valid-checkout', (event) => {
                $('#exampleModal2').modal('show')
            });
        </script>
    @endscript
</div>
