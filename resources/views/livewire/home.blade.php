<div class="homepage-slider">
  @foreach ($sliders as $item)
    <div class="single-homepage-slider" style="background-image: url('{{ asset("storage/$item->image") }}')">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 offset-lg-1 text-center">
            <div class="hero-text">
              <div class="hero-text-tablecell">
                <p class="subtitle">rekomU</p>
                <h1>{{ $item->name }}</h1>
                <div class="hero-btns">
                  <a href="{{ route('front.produk') }}" wire:navigate class="boxed-btn">Lihat Produk</a>
                  <a href="{{ route('front.tentang') }}" wire:navigate class="bordered-btn">Tentang</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  @endforeach
</div>
