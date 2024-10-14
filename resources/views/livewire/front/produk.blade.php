<div>
    @include('livewire.front.partials.breadcrumb', ['title' => $title])

    <!-- latest news -->
    <div class="latest-news mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-12" style="margin: 4.5rem 0;">
                    <style>
                        .form-control:focus {
                            border: 1px solid #F28123;
                            box-shadow: 0 0 0 0.2rem rgba(242, 129, 35, 0.25);
                        }
                    </style>
                    <div class="input-group mx-auto" style="max-width: 500px;">
                        <input wire:model.live="search" type="text" class="form-control py-4"
                            placeholder="Cari produk...">
                        <div class="input-group-append">
                            <button class="btn btn-light text-white" type="button" style="background: #F28123">
                                Search
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-9">
                    <div class="row">
                        @forelse ($items as $item)
                            <div class="col-lg-4">
                                <div class="single-latest-news">
                                    <a href="{{ route('front.produk-detail', $item->slug) }}" wire:navigate>
                                        <div class="latest-news-bg"
                                            style="background-image: url('{{ asset("storage/$item->image") }}'); background-size: cover; background-position: center;">
                                        </div>
                                    </a>
                                    <div class="news-text-box">
                                        <h3 style="font-size: 1.15rem; opacity: 0.8;">
                                            <a href="{{ route('front.produk-detail', $item->slug) }}" wire:navigate>
                                                {{ $item->name }}
                                            </a>
                                        </h3>
                                        <div class="text-muted" style="font-size: 0.9rem; margin-top: -19px;">
                                            {{ $item->seller->user->name }}
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="text-secondary" style="font-weight: 600; font-size: 1.3rem;">
                                                {{ formatRupiah($item->price) }}</div>
                                            <div class="text-muted" style="font-size: 0.9rem;">
                                                <i class="fa fa-eye"></i> {{ $item->count_view }}x dilihat
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center mt-1">
                                            <div class="d-flex align-items-center">
                                                @php
                                                    $average_rating = $item->average_rating
                                                        ? round($item->average_rating, 1)
                                                        : 0;
                                                @endphp
                                                @for ($i = 1; $i <= 5; $i++)
                                                    @if ($i <= $average_rating)
                                                        <svg style="margin-right: 1px;" height="12px" width="12px"
                                                            version="1.1" id="Capa_1"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                            viewBox="0 0 47.94 47.94" xml:space="preserve">
                                                            <path style="fill:#ED8A19;" d="M26.285,2.486l5.407,10.956c0.376,0.762,1.103,1.29,1.944,1.412l12.091,1.757
                                c2.118,0.308,2.963,2.91,1.431,4.403l-8.749,8.528c-0.608,0.593-0.886,1.448-0.742,2.285l2.065,12.042
                                c0.362,2.109-1.852,3.717-3.746,2.722l-10.814-5.685c-0.752-0.395-1.651-0.395-2.403,0l-10.814,5.685
                                c-1.894,0.996-4.108-0.613-3.746-2.722l2.065-12.042c0.144-0.837-0.134-1.692-0.742-2.285l-8.749-8.528
                                c-1.532-1.494-0.687-4.096,1.431-4.403l12.091-1.757c0.841-0.122,1.568-0.65,1.944-1.412l5.407-10.956
                                C22.602,0.567,25.338,0.567,26.285,2.486z" />
                                                        </svg>
                                                    @else
                                                        <svg style="margin-right: 1px;" height="12px" width="12px"
                                                            version="1.1" id="Capa_1"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                            viewBox="0 0 47.94 47.94" xml:space="preserve">
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
                                            <small>
                                                &nbsp; ({{ $average_rating }} / 5)
                                            </small>
                                        </div>
                                        <a href="{{ route('front.produk-detail', $item->slug) }}" wire:navigate
                                            class="read-more-btn">selengkapnya <i class="fas fa-angle-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <div class="col-12">
                                <div class="h6 text-muted">
                                    {{ $this->search ? 'Data yang dicari tidak ditemukan.' : 'Belum ada data produk.' }}
                                </div>
                            </div>
                        @endforelse
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="card">
                        <div class="card-header">
                            <span class="h5">Kategori</span>
                        </div>
                        <style>
                            .list-group-item {
                                transition: 0.2s;
                                cursor: pointer;
                            }

                            .list-group-item:hover {
                                color: #F28123;
                            }
                        </style>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item" style="color: {{ !$this->category ? '#F28123' : '' }};"
                                wire:click="$set('category', '')">
                                Semua
                            </li>
                            @foreach ($categories as $category)
                                <li class="list-group-item"
                                    style="color: {{ $this->category == $category->slug ? '#F28123' : '' }};"
                                    wire:click="$set('category', '{{ $category->slug }}')">
                                    {{ $category->name }}
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <hr class="my-4">
                    <div class="card">
                        <div class="card-header">
                            <span class="h5">Filter</span>
                        </div>
                        <ul class="list-group list-group-flush">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <input
                                            wire:change="changeFeaturedProduct($event.target.id, $event.target.checked)"
                                            @checked($isFeaturedProduct) type="checkbox" id="is_featured_product">
                                    </div>
                                </div>
                                <label for="is_featured_product" class="form-control">Produk Unggulan</label>
                            </div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputGroupSelect01">UMKM</label>
                                </div>
                                <select class="custom-select" wire:model.live="umkm">
                                    <option value="">Pilih</option>
                                    @if ($isFeaturedProduct)
                                        @foreach ($umkmFeatured as $item)
                                            <option value="{{ $item->seller->id }}">
                                                {{ $item->name }}
                                            </option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="container text-center">
                    {{ $items->links() }}
                </div>
            </div>
        </div>
    </div>
    <!-- end latest news -->

</div>
