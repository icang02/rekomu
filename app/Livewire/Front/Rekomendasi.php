<?php

namespace App\Livewire\Front;

use App\Models\Category;
use App\Models\Item;
use App\Models\Slider;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\WithPagination;

class Rekomendasi extends Component
{
	use WithPagination;

	#[Url('search')]
	public $search;
	#[Url('category')]
	public $category;

	public function userBasedCF()
	{
		// Query Data Tabel Transaksi
		$dataTransaksi = Transaction::where('rating', '!=', 'null')->get();
		$transaksiUserLogin = Transaction::where('rating', '!=', null)->where('user_id', Auth::user()->id)->get();

		// Jika Tidak Ada Data Transaksi
		if ($dataTransaksi->count() == 0 || $transaksiUserLogin->count() == 0)
			return null;

		// USER BASED COLLABORATIVE FILTERING
		// 1. Membuat User Item Matrix
		$userItemMatrix = [];
		foreach ($dataTransaksi as $transaksi) {
			$userItemMatrix[$transaksi->user_id][$transaksi->item_id] = $transaksi->rating;
		}
		// 2. Hitung Rata-Rata Rating Tiap User
		$userMean = [];
		foreach ($userItemMatrix as $user => $items) {
			$userMean[$user] = array_sum($items) / count($items);
		}

		// Simpan Rating Item User Yang Sedang Login
		$itemsRating_u = $userItemMatrix[Auth::user()->id];
		$userSimilarity = [];

		// Filter User-Item-Matrix Yang Bukan ID User Yang Sedang Login
		$userItemMatrix = array_filter($userItemMatrix, function ($key) {
			return $key != Auth::user()->id;
		}, ARRAY_FILTER_USE_KEY);

		// 3. Loop User-Item-Marix Untuk Menghitung Similaritas
		foreach ($userItemMatrix as $idUser_j => $itemsRating_j) {
			$sameRateProduk = array_intersect_key($itemsRating_u, $itemsRating_j);

			$pembilang = 0;
			$penyebut1  = 0;
			$penyebut2 = 0;

			foreach ($sameRateProduk as $key => $_) {
				$pembilang += ($itemsRating_u[$key] - $userMean[Auth::user()->id]) * ($itemsRating_j[$key] - $userMean[$idUser_j]);
				$penyebut1 += pow($itemsRating_u[$key] - $userMean[Auth::user()->id], 2);
				$penyebut2 += pow($itemsRating_j[$key] - $userMean[$idUser_j], 2);
			}
			if ($pembilang != 0 && sqrt($penyebut1) != 0 && sqrt($penyebut2) != 0) {
				$result = $pembilang / (sqrt($penyebut1) * sqrt($penyebut2));
			} else {
				$result = 0;
			}
			$userSimilarity[$idUser_j] = !is_nan($result) ? $result : 0;
		}

		// Batasi Hanya User Dengan Similaritas Tertinggi Yang Diambil
		$userSimilarity = array_filter($userSimilarity, function ($value) {
			return floatval($value) >= 0.7;
		});

		// Jika Tidak Ada Similaritas Yang Cocok Return Nilai Kosong
		if (empty($userSimilarity))
			return null;

		$predicItem = [];
		foreach (array_keys($userSimilarity) as $item)
			array_push($predicItem, $userItemMatrix[$item]);

		$willBeRecommItem = [];
		foreach ($predicItem as $items_j) {
			foreach ($items_j as $idProduk_j => $_) {
				if (!in_array($idProduk_j, array_keys($itemsRating_u))) {
					array_push($willBeRecommItem, $idProduk_j);
				}
			}
		}
		$willBeRecommItem = array_unique($willBeRecommItem);

		// 4. Hitung Nilai Prediksi Item
		$userBasedPredictedRatings = [];
		foreach ($willBeRecommItem as $idItem) {
			$sumPembilang = 0;
			$sumPenyebut  = 0;
			foreach ($userSimilarity as $idUser_j => $similarity_j) {
				$sumPembilang += (($userItemMatrix[$idUser_j][$idItem] ?? 0) - $userMean[$idUser_j]) * $similarity_j;
				$sumPenyebut  += $similarity_j;
			}

			if ($sumPembilang != 0 && $sumPenyebut != 0) {
				$userBasedPredictedRatings[$idItem] = $userMean[Auth::user()->id] + ($sumPembilang / $sumPenyebut);
			} else {
				$userBasedPredictedRatings[$idItem] = $userMean[Auth::user()->id];
			}
		}

		// Filter dan Batasi Nilai Prediksi
		$userBasedPredictedRatings = array_filter($userBasedPredictedRatings, function ($predictRating) {
			return $predictRating >= 3;
		});

		// Urutkan Berdasarkan Nilai Prediksi Tertinggi
		arsort($userBasedPredictedRatings);

		// Return Id Item & prediction value
		return $userBasedPredictedRatings;
	}

	public function render()
	{
		$resultUserBased = $this->userBasedCF();
		if (empty($resultUserBased)) {
			$items = new \Illuminate\Pagination\LengthAwarePaginator([], 0, 11, 1, [
				'path' => \Illuminate\Pagination\Paginator::resolveCurrentPath(),
			]);
		} else {
			$recommendedItemID = array_keys($resultUserBased);

			$items = Item::with('seller.user')
				->whereIn('id', $recommendedItemID)
				->where(function ($query) {
					$query->where('name', 'like', '%' . $this->search . '%')
						->orWhereHas('seller.user', function ($query) {
							$query->where('name', 'like', '%' . $this->search . '%');
						});
				})
				->when($this->category, function ($query) {
					$query->whereHas('category', function ($query) {
						$query->where('slug', $this->category);
					});
				})
				->paginate(11);

			// Tambahkan kolom predict_rating
			$items->getCollection()->transform(function ($item) use ($resultUserBased) {
				$item->predict_rating = $resultUserBased[$item->id] ?? null;
				return $item;
			});

			// Urutkan berdasarkan predict_rating secara descending
			$sortedItems = $items->getCollection()->sortByDesc('predict_rating');
			// Buat ulang paginator dengan koleksi yang sudah diurutkan
			$items = $items->setCollection($sortedItems);
		}
		$title      = 'Rekomendasi Produk';
		$slider     = Slider::latest('id')->first();
		$categories = Category::orderBy('name')->get();


		return view('livewire.front.rekomendasi', compact('slider', 'title', 'items', 'categories'));
	}
}
