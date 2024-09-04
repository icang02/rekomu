<div>
  @include('livewire.front.partials.breadcrumb')

  <div class="cart-section mt-100 mb-150">
    <div class="container">
      @if (!$transactions->isEmpty())
        <div class="row justify-content-center">
          <div class="col-lg-9">
            @push('style')
              <style>
                .cart-table-wrap.custom tbody tr td {
                  padding: 5px 20px;
                }
              </style>
            @endpush
            <div class="cart-table-wrap custom">
              <table class="cart-table">
                <thead class="cart-table-head">
                  <tr class="table-head-row">
                    <th class="product-remove">#</th>
                    <th class="product-image">Gambar Produk</th>
                    <th class="product-name">Nama</th>
                    <th class="product-price">Kode</th>
                    <th class="product-quantity">Waktu Transaksi</th>
                    <th class="product-quantity">Rating</th>
                    <th class="product-quantity">Aksi</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($transactions as $transaction)
                    <div class="modal fade" id="staticBackdrop{{ $transaction->id }}" data-backdrop="static"
                      data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Detail Transaksi</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <div class="container">
                              <div class="row">
                                <div class="col-lg-5">
                                  <img src="{{ asset('storage/' . $transaction->item->image) }}" alt="img"
                                    class="img-fluid">
                                </div>
                                <div class="col-lg-7">
                                  <h5>{{ $transaction->item->name }}</h5>
                                  <div class="d-flex align-items-center">
                                    <span class="mr-5">{{ $transaction->seller->user->name }}</span>
                                    <div class="d-flex align-items-center">
                                      <svg style="margin-right: 1px;" height="12px" width="12px" version="1.1"
                                        id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 47.94 47.94"
                                        xml:space="preserve">
                                        <path style="fill:#ED8A19;" d="M26.285,2.486l5.407,10.956c0.376,0.762,1.103,1.29,1.944,1.412l12.091,1.757
                                        c2.118,0.308,2.963,2.91,1.431,4.403l-8.749,8.528c-0.608,0.593-0.886,1.448-0.742,2.285l2.065,12.042
                                        c0.362,2.109-1.852,3.717-3.746,2.722l-10.814-5.685c-0.752-0.395-1.651-0.395-2.403,0l-10.814,5.685
                                        c-1.894,0.996-4.108-0.613-3.746-2.722l2.065-12.042c0.144-0.837-0.134-1.692-0.742-2.285l-8.749-8.528
                                        c-1.532-1.494-0.687-4.096,1.431-4.403l12.091-1.757c0.841-0.122,1.568-0.65,1.944-1.412l5.407-10.956
                                        C22.602,0.567,25.338,0.567,26.285,2.486z" />
                                      </svg>
                                      <span class="ml-1">
                                        @if ($transaction->rating)
                                          {{ $transaction->rating }}.0 (rating)
                                        @else
                                          <span class="text-muted">Belum dirating (0.0)</span>
                                        @endif
                                      </span>
                                    </div>
                                  </div>
                                  <p class="text-muted">{{ $transaction->code }}</p>
                                  <hr>
                                  <div class="row">
                                    <div class="col-lg-6">
                                      Waktu transaksi
                                    </div>
                                    <div class="col-lg-6">
                                      {{ \Carbon\Carbon::parse($transaction->transaction_time)->translatedFormat('d M Y - H:i:s') }}
                                    </div>
                                    <div class="col-lg-6">
                                      Kontak penerima
                                    </div>
                                    <div class="col-lg-6">
                                      {{ $transaction->recipient_contact }}
                                    </div>
                                    <div class="col-lg-6">
                                      Alamat pengiriman
                                    </div>
                                    <div class="col-lg-6">
                                      {{ $transaction->shipping_address }}
                                    </div>
                                  </div>
                                  <hr>
                                  <div class="row">
                                    <div class="col-lg-6">
                                      Jumlah pesanan
                                    </div>
                                    <div class="col-lg-6">
                                      {{ $transaction->quantity }} qty
                                    </div>
                                    <div class="col-lg-6">
                                      Harga
                                    </div>
                                    <div class="col-lg-6">
                                      {{ formatRupiah($transaction->item->price) }}
                                    </div>
                                  </div>
                                  <div class="row" style="font-size: 1.2rem; font-weight: 700;">
                                    <div class="col-lg-6 mt-2">
                                      Subtotal
                                    </div>
                                    <div class="col-lg-6 mt-2 font">
                                      {{ formatRupiah($transaction->quantity * $transaction->item->price) }}
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          </div>
                        </div>
                      </div>
                    </div>

                    <tr class="table-body-row">
                      <td class="product-remove">
                        {{ $loop->iteration . '.' }}
                      </td>
                      <td>
                        <img class="rounded"
                          style="width: 60px; height: 50px; object-fit: cover; object-position: center;"
                          src="{{ asset('storage/' . $transaction->item->image) }}" alt="produk">
                      </td>
                      <td class="product-name text-left">{{ $transaction->item->name }}</td>
                      <td class="product-price">{{ $transaction->code }}</td>
                      <td class="product-quantity text-left">
                        {{ \Carbon\Carbon::parse($transaction->transaction_time)->translatedFormat('d M Y') }}<br>
                        {{ \Carbon\Carbon::parse($transaction->transaction_time)->translatedFormat('H:i:s') }}
                      </td>
                      <td class="product-quantity">
                        @if ($transaction->rating)
                          <div class="d-flex align-items-center justify-content-center">
                            @for ($i = 1; $i <= 5; $i++)
                              @if ($i <= $transaction->rating)
                                <svg style="margin-right: 1px;" height="12px" width="12px" version="1.1"
                                  id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                  xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 47.94 47.94"
                                  xml:space="preserve">
                                  <path style="fill:#ED8A19;" d="M26.285,2.486l5.407,10.956c0.376,0.762,1.103,1.29,1.944,1.412l12.091,1.757
                                c2.118,0.308,2.963,2.91,1.431,4.403l-8.749,8.528c-0.608,0.593-0.886,1.448-0.742,2.285l2.065,12.042
                                c0.362,2.109-1.852,3.717-3.746,2.722l-10.814-5.685c-0.752-0.395-1.651-0.395-2.403,0l-10.814,5.685
                                c-1.894,0.996-4.108-0.613-3.746-2.722l2.065-12.042c0.144-0.837-0.134-1.692-0.742-2.285l-8.749-8.528
                                c-1.532-1.494-0.687-4.096,1.431-4.403l12.091-1.757c0.841-0.122,1.568-0.65,1.944-1.412l5.407-10.956
                                C22.602,0.567,25.338,0.567,26.285,2.486z" />
                                </svg>
                              @else
                                <svg style="margin-right: 1px;" height="12px" width="12px" version="1.1"
                                  id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                  xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 47.94 47.94"
                                  xml:space="preserve">
                                  <path style="fill:#555555;" d="M26.285,2.486l5.407,10.956c0.376,0.762,1.103,1.29,1.944,1.412l12.091,1.757
                                c2.118,0.308,2.963,2.91,1.431,4.403l-8.749,8.528c-0.608,0.593-0.886,1.448-0.742,2.285l2.065,12.042
                                c0.362,2.109-1.852,3.717-3.746,2.722l-10.814-5.685c-0.752-0.395-1.651-0.395-2.403,0l-10.814,5.685
                                c-1.894,0.996-4.108-0.613-3.746-2.722l2.065-12.042c0.144-0.837-0.134-1.692-0.742-2.285l-8.749-8.528
                                c-1.532-1.494-0.687-4.096,1.431-4.403l12.091-1.757c0.841-0.122,1.568-0.65,1.944-1.412l5.407-10.956
                                C22.602,0.567,25.338,0.567,26.285,2.486z" />
                                </svg>
                              @endif
                            @endfor
                          </div>
                        @else
                          <span style="font-size: 0.85rem;" class="text-muted">Belum rate</span>
                        @endif
                      </td>
                      <td class="product-quantity">
                        <button data-toggle="modal" data-target="#staticBackdrop{{ $transaction->id }}"
                          class="btn btn-info badge">Detail</button>
                        <button wire:click="setRatingInput({{ $transaction->id }})" {{-- wire:click="setRatingInput({{ $transaction->id }}, '{{ $transaction->item->name }}', '{{ $transaction->rating }}', '{{ $transaction->review }}')" --}}
                          class="btn btn-secondary badge">Rating</button>
                      </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>

            {{ $transactions->links(data: ['scrollTo' => false]) }}
          </div>

          <div class="col-lg-3">
            <div class="total-section">
              <form wire:submit="saveForm">
                <table class="total-table">
                  <thead class="total-table-head">
                    <tr class="table-total-row">
                      <th>{{ $itemName ?? 'Produk' }}</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="total-data">
                      <td>
                        <div class="mb-3">
                          <strong>Rating</strong>
                          <input min="1" max="5" @readonly(!$itemName) wire:model="ratingInput"
                            value="{{ $ratingInput }}" type="number" class="form-control mt-1 w-100"
                            style="transition: 0.2s" required>
                        </div>
                        <div>
                          <strong>Ulasan</strong>
                          <textarea @readonly(!$itemName) placeholder="{{ !$itemName ? '' : '—' }}" wire:model="reviewInput"
                            class="form-control mt-1" rows="4" style="transition: 0.2s">{{ $reviewInput }}</textarea>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <div class="cart-buttons">
                  <button wire:loading.class="disabled"
                    class="btn-custom mr-2 {{ !$itemName ? 'disabled' : '' }}">Simpan</button>
                  <button wire:loading.class="disabled" type="reset" wire:click="resetForm"
                    class="btn-custom2 {{ !$itemName ? 'disabled' : '' }}">Cancel</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      @else
        <div class="row">
          <div class="col-12 text-center">
            <div class="error-text">
              <h1>Belum ada data.</h1>
              <p>Riwayat transaksi Anda akan muncul di sini.</p>
              <a href="{{ route('front.produk') }}" wire:navigate class="boxed-btn">Cari Produk</a>
            </div>
          </div>
        </div>
      @endif
    </div>
  </div>
</div>
