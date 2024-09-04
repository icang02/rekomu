<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
	/**
	 * Run the database seeds.
	 */
	public function run(): void
	{
		$dataKategori = [
			['name' => 'Kuliner', 'slug' => str()->slug('Kuliner')],
			['name' => 'Kerajinan Tangan', 'slug' => str()->slug('Kerajinan Tangan')],
			['name' => 'Fashion', 'slug' => str()->slug('Fashion')],
		];

		Category::insert($dataKategori);
	}
}
