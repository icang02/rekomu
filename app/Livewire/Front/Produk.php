<?php

namespace App\Livewire\Front;

use App\Models\Category;
use App\Models\Item;
use App\Models\Slider;
use App\Models\User;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\WithPagination;

class Produk extends Component
{
	use WithPagination;

	protected $paginationTheme = 'bootstrap';

	#[Url('search')]
	public $search;
	#[Url('category')]
	public $category;
	#[Url('is_featured_product')]
	public $isFeaturedProduct;
	#[Url('umkm')]
	public $umkm;

	public function updatedSearch()
	{
		$this->resetPage();
	}

	public function updatedCategory()
	{
		$this->resetPage();
	}

	public function changeFeaturedProduct($name, $checked)
	{
		if ($checked) {
			$this->isFeaturedProduct = true;
		} else {
			$this->isFeaturedProduct = false;
			$this->umkm = null;
		}
	}

	#[Title('Produk')]
	public function render()
	{
		$items = Item::with('seller.user')
			->where(function ($query) {
				$query->when($this->isFeaturedProduct, function ($query) {
					$query->where('average_rating', '>=', 4)
						->orWhere('is_featured_product', 1);
				});
			})
			->when($this->umkm, function ($query) {
				$query->where('seller_id', $this->umkm);
			})
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
			->orderBy('name')
			->paginate(11);

		$items2 = Item::with('seller.user')
			->where(function ($query) {
				$query->when($this->isFeaturedProduct, function ($query) {
					$query->where('average_rating', '>=', 4)
						->orWhere('is_featured_product', 1);
				});
			})
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
			->orderBy('name')
			->paginate(11);

		$slider     = Slider::latest('id')->first();
		$categories = Category::orderBy('name')->get();
		$title      = 'List Produk';

		$ids = $items2->unique('seller_id')->pluck('seller.user_id');
		$umkmFeatured = User::where('group_id', 3)
			->whereIn('id', $ids)
			->orderBy('name')
			->get();

		return view('livewire.front.produk', compact('items', 'slider', 'categories', 'title', 'umkmFeatured'));
	}
}
