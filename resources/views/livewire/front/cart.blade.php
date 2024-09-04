<div>
  @include('livewire.front.partials.breadcrumb', ['title' => $title])

  <div class="cart-section mt-100 mb-150">
    <div class="container">
      @if ($carts->count() != 0)
        <div class="row">
          <div class="col-lg-8 col-md-12">
            <div class="cart-table-wrap">
              <table class="cart-table">
                <thead class="cart-table-head">
                  <tr class="table-head-row">
                    <th class="product-remove"></th>
                    <th class="product-image">Gambar Produk</th>
                    <th class="product-name">Nama</th>
                    <th class="product-price">Harga</th>
                    <th class="product-quantity">Jumlah</th>
                    <th class="product-total">Total</th>
                  </tr>
                </thead>
                <tbody>
                  @php
                    $subTotal = 0;
                  @endphp
                  @foreach ($carts as $cart)
                    <tr class="table-body-row">
                      <td class="product-remove">
                        <button wire:click="deleteCartItem({{ $cart->id }})" wire:loading.attr="disabled"
                          wire:target="deleteCartItem({{ $cart->id }})" wire:key="cart-delete-({{ $cart->id }})"
                          class="btn btn-danger badge">
                          <i class="far fa-window-close"></i>
                      </td>
                      <td>
                        <img class="rounded"
                          style="width: 60px; height: 50px; object-fit: cover; object-position: center;"
                          src="{{ asset('storage/' . $cart->item->image) }}" alt="produk">
                      </td>
                      <td class="product-name">{{ $cart->item->name }}</td>
                      <td class="product-price">{{ formatRupiah($cart->item->price) }}</td>
                      <td class="product-quantity">
                        <input wire:model.live="quantities.{{ $cart->id }}" wire:key="quantity-{{ $cart->id }}"
                          style="outline: none;" min="1" type="number" placeholder="0">
                      </td>
                      <td class="product-total">
                        {{ formatRupiah($cart->item->price * $cart->quantity) }}
                      </td>
                    </tr>
                    @php
                      $subTotal += $cart->item->price * $cart->quantity;
                    @endphp
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="total-section">
              <table class="total-table">
                <thead class="total-table-head">
                  <tr class="table-total-row">
                    <th>Total</th>
                    <th>Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="total-data">
                    <td><strong>Subtotal: </strong></td>
                    <td>{{ formatRupiah($subTotal) }}</td>
                  </tr>
                  <tr class="total-data">
                    <td><strong>Biaya layanan: </strong></td>
                    <td>Rp 0</td>
                  </tr>
                  <tr class="total-data">
                    <td><strong>Total: </strong></td>
                    <td>{{ formatRupiah($subTotal) }}</td>
                  </tr>
                </tbody>
              </table>
              <div class="cart-buttons">
                <button href="{{ route('front.checkout') }}" wire:navigate class="btn-custom">Check Out</button>
              </div>
            </div>
          </div>
        </div>
      @else
        <div class="row">
          <div class="col-12 text-center">
            <div class="error-text">
              <h1>Belum ada data.</h1>
              <p>Keranjang Anda masih kosong.</p>
              <a href="{{ route('front.produk') }}" wire:navigate class="boxed-btn">Cari Produk</a>
            </div>
          </div>
        </div>
      @endif
    </div>
  </div>
</div>
