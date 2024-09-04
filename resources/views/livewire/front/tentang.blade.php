<div>
  @include('livewire.front.partials.breadcrumb', ['title' => $title])

  <div class="cart-section mt-100 mb-150">
    <div class="container">
      <div class="row">
        <div class="col-12 text-center">
          <div class="error-text">
            <h1>rekomU</h1>
            <p>Sistem Rekomendasi Produk UMKM Berbasis Web Menggunakan Metode USER-BASED COLLABORATIVE FILTERING.</p>
            <a href="{{ route('front.produk') }}" wire:navigate class="boxed-btn">Cari Produk</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
