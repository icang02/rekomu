<div>
  @include('livewire.admin.partials.breadcrumb', [
      'title' => 'Transaksi',
      'menus' => [['title' => 'Transaksi', 'route' => route('admin.transaksi')]],
  ])

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-flex">
            <a wire:navigate href="{{ route('admin.transaksi') }}">
              <button class="btn btn-dark btn-sm border d-flex align-items-center">
                <i class="icon-refresh"></i>
                <span class="icon-class ms-2">Refresh halaman</span>
              </button>
            </a>
          </div>
        </div>
        <div class="card-body">
          <x-table :data="$transactions" route="admin.transaksi">
            <table class="custom-table">
              <thead>
                <tr>
                  <th scope="col">No</th>
                  <th scope="col">Aksi</th>
                  <th scope="col">Kode Transaksi</th>
                  <th scope="col">Waktu Transaksi</th>
                  <th scope="col">Pembeli</th>
                  <th scope="col">Alamat Pengiriman</th>
                  <th scope="col">Kontak</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($transactions as $item)
                  <tr>
                    <td>
                      {{ $loop->iteration + ($transactions->currentPage() - 1) * $transactions->perPage() }}.
                    </td>
                    <td class="text-nowrap">
                      <button class="btn btn-sm btn-primary edit-btn d-inline-flex align-items-center"
                        style="padding: 6px 9px;" data-bs-toggle="modal" data-bs-target="#modalEdit{{ $item->id }}">
                        <i class="icon-eye" style="font-size: 1.2em;"></i>
                      </button>
                    </td>
                    <td class="text-nowrap">{{ $item->code }}</td>
                    <td>{{ Carbon\Carbon::parse($item->transaction_time)->translatedFormat('d M Y H:i:s') }}</td>
                    <td>{{ $item->user->name }}</td>
                    <td>{{ $item->shipping_address }}</td>
                    <td class="text-nowrap">{{ $item->recipient_contact }}
                      <a href="https://wa.me/{{ $item->recipient_contact }}" target="_blank" class="ml-2 text-success">
                        <i class="fa fa-phone"></i>
                      </a>
                    </td>
                  </tr>

                  {{-- Modal Detail Transaksi --}}
                  <div class="modal fade" id="modalEdit{{ $item->id }}" data-bs-backdrop="static"
                    data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEditLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="modalEditLabel">Detail Transaki</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <div class="row">
                            <div class="col-lg-4">
                              <img class="rounded border"
                                style="width: 100%; height: auto; aspect-ratio: 1/1; object-fit: cover;"
                                src="{{ asset('storage/' . $item->item->image) }}" alt="item">
                              <hr>
                            </div>
                            <div class="col-lg-8">
                              <h5 style="font-weight: 700;">{{ $item->item->name }}</h5>
                              <small>Kode &nbsp;: &nbsp;</small>
                              <div class="card-sub py-1 px-3 border d-inline-flex"
                                style="width: fit-content; font-size: 1rem;">
                                <code class="highlighter-rouge">{{ $item->code }}</code>
                              </div>
                              <hr>
                              <div class="row">
                                <div class="col-lg-6">
                                  Nama pembeli
                                </div>
                                <div class="col-lg-6">
                                  {{ $item->user->name }}
                                </div>
                                <div class="col-lg-6">
                                  Waktu transaksi
                                </div>
                                <div class="col-lg-6">
                                  {{ Carbon\Carbon::parse($item->transaction_time)->translatedFormat('d M Y H:i:s') }}
                                </div>
                                <div class="col-lg-6">
                                  Alamat pengiriman
                                </div>
                                <div class="col-lg-6">
                                  {{ $item->shipping_address }}
                                </div>
                                <div class="col-lg-6">
                                  Kontak penerima
                                </div>
                                <div class="col-lg-6">
                                  {{ $item->recipient_contact }}
                                </div>
                              </div>
                              <hr>
                              <div class="row">
                                <div class="col-lg-6">
                                  Jumlah
                                </div>
                                <div class="col-lg-6">
                                  {{ $item->quantity }} qty
                                </div>
                                <div class="col-lg-6">
                                  Harga
                                </div>
                                <div class="col-lg-6">
                                  {{ formatRupiah($item->item->price) }}
                                </div>
                              </div>
                              <div class="row mt-2" style="font-weight: 700; font-size: 1.1rem;">
                                <div class="col-lg-6">
                                  Subtotal transaksi
                                </div>
                                <div class="col-lg-6">
                                  {{ formatRupiah($item->item->price * $item->quantity) }}
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-light border" data-bs-dismiss="modal">Kembali</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  {{-- End Modal Detail Trsansaksi --}}
                @empty
                  <tr>
                    <td colspan="7" class="text-center text-muted">
                      {{ $this->search ? 'Data yang dicari tidak ditemukan.' : 'Belum ada data.' }}</td>
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
