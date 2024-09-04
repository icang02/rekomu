<div>
  @include('livewire.front.partials.breadcrumb')

  <div class="cart-section mt-100 mb-150">
    <div class="container">
      <div class="row">
        <div class="col-12 text-center">
          <div class="error-text">
            <h1>Pesananmu berhasil diproses.</h1>
            <p>Terima kasih telah berbelanja.</p>
            <a href="{{ route('front.riwayat') }}" wire:navigate class="boxed-btn">Riwayat Pesanan</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
