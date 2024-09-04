<?php

namespace Database\Seeders;

use App\Models\Slider;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SliderSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    $sliders = [
      [
        'name' => 'Sistem Rekomendasi Produk UMKM (rekomU)',
        'image' => 'slider/slider1.png',
      ],
      [
        'name' => 'Dinas Koperasi dan UKM Kabupaten Kolaka',
        'image' => 'slider/slider2.png',
      ],
    ];
    Slider::insert($sliders);
  }
}
