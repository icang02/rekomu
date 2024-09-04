@php
  $slider = \App\Models\Slider::latest('id')->first();
@endphp

<div class="breadcrumb-section breadcrumb-bg"
  style="background-image: url('{{ asset("storage/$slider->image") }}'); background-size: cover; background-position: bottom;">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2 text-center">
        <div class="breadcrumb-text">
          <p>rekomU</p>
          <h1>{{ $title }}</h1>
        </div>
      </div>
    </div>
  </div>
</div>
