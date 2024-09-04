<div>
  @include('livewire.admin.partials.breadcrumb', [
      'title' => 'Ulasan',
      'menus' => [
          ['title' => 'Ulasan', 'route' => route('admin.ulasan')],
          ['title' => $item->name, 'route' => route('admin.ulasan.detail', $item->id)],
      ],
  ])

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-flex">
            <a wire:navigate href="{{ route('admin.ulasan.detail', $item->id) }}">
              <button class="btn btn-dark btn-sm border d-flex align-items-center">
                <i class="icon-refresh"></i>
                <span class="icon-class ms-2">Refresh halaman</span>
              </button>
            </a>
          </div>
        </div>
        <div class="card-body">
          <x-table :data="$reviews" route="admin.ulasan.detail">
            <table class="custom-table">
              <thead>
                <tr>
                  <th scope="col">No</th>
                  <th scope="col">Nama</th>
                  <th scope="col">Rating</th>
                  <th scope="col">Waktu Rating</th>
                  <th scope="col">Ulasan</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($reviews as $item)
                  <tr>
                    <td>
                      {{ $loop->iteration + ($reviews->currentPage() - 1) * $reviews->perPage() }}.
                    </td>
                    <td class="text-nowrap">{{ $item->user->name }}</td>
                    <td>
                      @for ($i = 1; $i <= 5; $i++)
                        @if ($i <= floor($item->rating))
                          <svg style="width: 11px; fill: #fca72a;" viewBox="0 0 576 512">
                            <path
                              d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z" />
                          </svg>
                        @else
                          <svg style="width: 11px;" viewBox="0 0 576 512">
                            <path
                              d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z" />
                          </svg>
                        @endif
                      @endfor
                    </td>
                    <td>{{ Carbon\Carbon::parse($item->transaction_time)->translatedFormat('d M Y H:i:s') }}</td>
                    <td>{{ $item->review ?? '—' }}</td>
                  </tr>
                @empty
                  <tr>
                    <td colspan="7" class="text-center text-muted">
                      {{ $search ? 'Data yang dicari tidak ditemukan.' : 'Belum ada data ulasan.' }}
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

</div>
