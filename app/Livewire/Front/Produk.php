<?php

namespace App\Livewire\Front;

use App\Livewire\Admin\Transaksi;
use App\Models\Category;
use App\Models\Item;
use App\Models\Slider;
use App\Models\Transaction;
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

	public function updatedSearch()
	{
		$this->resetPage();
	}

	public function updatedCategory()
	{
		$this->resetPage();
	}

	#[Title('Produk')]
	public function render()
	{
		dd(Transaction::all()->count());
		$items = Item::with('seller.user')
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
		return view('livewire.front.produk', compact('items', 'slider', 'categories', 'title'));
	}
}
