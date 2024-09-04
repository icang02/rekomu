<div>
  <div class="card-sub d-flex justify-content-between align-items-center">
    @php
      $showing = [10, 20, 30, 40, 50];
    @endphp
    <div class="d-flex align-items-center">
      Showing&nbsp;&nbsp;
      <select wire:model.live="show" id="show" name="show" class="form-select">
        @foreach ($showing as $item)
          <option {{ $item == request('show') ? 'selected' : '' }} value={{ $item }}>
            {{ $item }}
          </option>
        @endforeach
      </select>
      &nbsp;&nbsp;entries
    </div>
    {{-- Form Search --}}
    <div>
      <div class="input-group">
        <input wire:model.live="search" type="text" class="form-control" placeholder="Search..." autocomplete="off">
        <button class="btn btn-sm btn-primary" id="button-addon2">
          <i class="fa fa-search search-icon" style="font-size: 0.8rem;"></i>
        </button>
      </div>
    </div>
    {{-- End Form Search --}}
  </div>
  {{-- Tabel Data --}}
  <div class="table-responsive">
    {{ $slot }}
    {{-- {{ $header }} --}}
  </div>
  {{-- End Tabel Data --}}
  {{-- Pagination --}}
  <div class="col-12 mt-4 d-flex justify-content-center">
    {{ $data->links() }}
  </div>
  {{-- End Pagination --}}

</div>
