<div>
    @include('livewire.front.partials.breadcrumb')

    <!-- single product -->
    <div class="single-product mt-100">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="single-product-img">
                        <img style="width: 100%; heigth: auto; aspect-ratio: 1/1; object-fit: cover; object-position: center;"
                            src="{{ asset("storage/$item->image") }}" alt="image">
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="single-product-content">
                        <h3>{{ $item->name }}</h3>
                        <p class="single-product-pricing">
                            <span>Harga : </span> {{ formatRupiah($item->price) }}
                        </p>

                        @php
                            $average_rating = $item->average_rating ? round($item->average_rating, 1) : 0;
                        @endphp
                        <div class="d-flex align-items-center">
                            <p class="single-product-pricing d-flex align-items-center">
                                <span class="mr-2">Rating :&nbsp;</span>
                                <span class="mr-2 d-flex">
                                    @for ($i = 1; $i <= 5; $i++)
                                        @if ($i <= $average_rating)
                                            <svg style="margin-right: 1px;" height="15px" width="15px" version="1.1"
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
                                            <svg style="margin-right: 1px;" height="15px" width="15px" version="1.1"
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
                                </span>
                                <span>({{ $average_rating }} / 5)</span>
                            </p>
                        </div>
                        <form wire:submit="addToCart({{ $item->id }})" class="mb-3">
                            <div class="single-product-form"
                                @if (!auth()->check() || auth()->user()?->group_id != 2) style="pointer-events: none; opacity: 0.6;" @endif>
                                <div class="d-flex">
                                    <input required min="1" type="number" placeholder="0" wire:model="quantity"
                                        style="outline: none;">
                                    @if (session('alert'))
                                        <div class="ml-5 alert alert-success alert-dismissible fade show"
                                            role="alert">
                                            {!! session('alert') !!}
                                            <button type="button" class="close" data-dismiss="alert"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    @elseif (session('error'))
                                        <div class="ml-5 alert alert-danger alert-dismissible fade show" role="alert">
                                            {!! session('error') !!}
                                            <button type="button" class="close" data-dismiss="alert"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                    @endif
                                </div>
                                <button wire:loading.class="disabled" type="submit" class="btn-custom">
                                    <i class="fas fa-shopping-cart"></i> Add to Cart
                                </button>
                            </div>
                        </form>
                        <p><strong>Kategori: </strong>{{ $item->category->name }}</p>
                        <h4>Share:</h4>
                        <ul class="product-share">
                            <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href=""><i class="fab fa-twitter"></i></a></li>
                            <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                            <li><a href=""><i class="fab fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end single product -->

    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-article-section">
                    <div class="comments-list-wrap">
                        <h3 class="comment-count-title">
                            @if ($transactions->count() != 0)
                                {{ $transactions->count() }} Ulasan
                            @else
                                Belum ada ulasan
                            @endif
                        </h3>
                        <div class="comment-list">
                            @forelse ($transactions as $transaction)
                                <div class="single-comment-body">
                                    <div class="comment-user-avater">
                                        @php
                                            $img = $transaction->user->image
                                                ? 'storage/' . $transaction->user->image
                                                : 'img/default-user.png';
                                        @endphp
                                        <img style="width: 60px; height: 60px; object-fit: cover; object-position: center;"
                                            src="{{ asset($img) }}" alt="img" class="border">
                                    </div>
                                    <div class="comment-text-body mb-4">
                                        <h4>
                                            @auth
                                                {{ $transaction->user->email == auth()->user()->email ? 'Anda' : $transaction->user->name }}
                                            @else
                                                {{ $transaction->user->name }}
                                            @endauth
                                            <span class="comment-date">
                                                {{ \Carbon\Carbon::parse($transaction->transaction_time)->diffForHumans() }}
                                            </span>
                                        </h4>
                                        <div class="d-flex align-items-center" style="margin: -12px 0 10px 0;">
                                            @php
                                                $rating = $transaction->rating ? round($transaction->rating, 1) : 0;
                                            @endphp
                                            @for ($i = 1; $i <= 5; $i++)
                                                @if ($i <= $rating)
                                                    <svg style="margin-right: 1px;" height="12px" width="12px"
                                                        version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
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
                                        <p>{{ $transaction->review ?? '—' }}</p>
                                    </div>
                                </div>
                            @empty
                                <div style="margin-top: -20px;">
                                    <h6 class="text-muted">Belum ada ulasan pada produk ini.</h6>
                                </div>
                            @endforelse
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @script
        <script>
            setTimeout(() => {
                $wire.dispatch('incrementViewCount', {
                    itemId: {{ $item->id }}
                });
            }, 5 * 1000);
        </script>
    @endscript
</div>
