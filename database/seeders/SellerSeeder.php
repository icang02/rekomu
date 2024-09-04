<?php

namespace Database\Seeders;

use App\Models\Seller;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SellerSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    $dataUmkm =  [
      [
        'slug' => str()->slug('manikku'),
        'address' => 'BTN Naral Land Blok A3',
        'user_id' => 2
      ],
      [
        'slug' => str()->slug('bracelet kolaka'),
        'address' => 'Jl. Kasuari No. 6',
        'user_id' => 3
      ],
      [
        'slug' => str()->slug('rumah tenun'),
        'address' => 'Sabilambo',
        'user_id' => 4
      ],
      [
        'slug' => str()->slug('hello gumpy'),
        'address' => 'Lalombaa',
        'user_id' => 5
      ],
      [
        'slug' => str()->slug('bracelet by naral'),
        'address' => 'Jl. Pemuda',
        'user_id' => 6
      ],
      [
        'slug' => str()->slug('toko kopi pakde'),
        'address' => 'Jl. Dr. Sutomo No. 29',
        'user_id' => 7
      ],
      [
        'slug' => str()->slug('mamina booth'),
        'address' => 'Bundaran Tugu Pacul',
        'user_id' => 8
      ],
      [
        'slug' => str()->slug('kedai senja'),
        'address' => 'Jl Puutobo',
        'user_id' => 9
      ],
      [
        'slug' => str()->slug('kedai barokah'),
        'address' => 'Wiskul',
        'user_id' => 10
      ],
      [
        'slug' => str()->slug('kedai yustia'),
        'address' => 'Jl Kali Baru',
        'user_id' => 11
      ],
      [
        'slug' => str()->slug('angkringan mante'),
        'address' => 'Pelataran Rumah Adat',
        'user_id' => 12
      ],
      [
        'slug' => str()->slug('cafe kelapa dua'),
        'address' => 'Jl Pemuda',
        'user_id' => 13
      ],
      [
        'slug' => str()->slug('edd cemilan'),
        'address' => 'BTN Tahoa',
        'user_id' => 14
      ],
      [
        'slug' => str()->slug('dofu donuts'),
        'address' => 'Jl Pemuda',
        'user_id' => 15
      ],
      [
        'slug' => str()->slug('uo kopi'),
        'address' => 'Jl Bypass',
        'user_id' => 16
      ],
      [
        'slug' => str()->slug('ummu haura kitchen'),
        'address' => 'Jl Pasar Raya',
        'user_id' => 17
      ],
      [
        'slug' => str()->slug('my coffee cafe'),
        'address' => 'Jl Bypass Pomalaa',
        'user_id' => 18
      ],
      [
        'slug' => str()->slug('coffe story'),
        'address' => 'Jl Garuda No.15',
        'user_id' => 19
      ],
      [
        'slug' => str()->slug('rm asap'),
        'address' => 'Jl. Samratulangi',
        'user_id' => 20
      ],
      [
        'slug' => str()->slug('hijab store'),
        'address' => 'Jl Ekonomi No. 57',
        'user_id' => 21
      ],
      [
        'slug' => str()->slug('ayy shop'),
        'address' => 'Jl Pramuka No 27',
        'user_id' => 22
      ],
      [
        'slug' => str()->slug('barira butik'),
        'address' => 'Jl. Kharil Anwar No. 25',
        'user_id' => 23
      ],
      [
        'slug' => str()->slug('bahira store'),
        'address' => 'Jl. Poros Pomalaa',
        'user_id' => 24
      ]
    ];

    Seller::insert($dataUmkm);
  }
}
