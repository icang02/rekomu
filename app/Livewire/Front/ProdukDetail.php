<?php

namespace App\Livewire\Front;

use App\Models\Cart;
use App\Models\Item;
use App\Models\Slider;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Attributes\On;
use Livewire\Attributes\Title;
use Livewire\Component;

class ProdukDetail extends Component
{
	use LivewireAlert;

	public $slug;
	public $quantity;

	public function mount($slug)
	{
		$this->slug = $slug;
	}

	public function addToCart($itemId)
	{
		try {
			$this->validate([
				'quantity' => 'required',
			], [
				'quantity.required' => 'Masukkan jumlah pesanan dulu',
			]);

			$item = Cart::where('item_id', $itemId)
				->where('user_id', Auth::user()->id)
				->count();
			if ($item != 0) {
				return $this->alert('info', 'Produk sudah ada dikeranjang', [
					'position' => 'top-start',
					'timer'    => 3000,
					'toast'    => true,
					// 'width'    => '380',
				]);
			}

			Cart::create([
				'item_id' => $itemId,
				'user_id' => Auth::user()->id,
				'quantity' => $this->quantity
			]);

			$this->quantity = null;
			$this->dispatch('cartUpdated');
			return $this->alert('success', 'Produk ditambahkan ke keranjang', [
				'position' => 'top-start',
				'timer'    => 3000,
				'toast'    => true,
				'width'    => '380',
			]);
		} catch (ValidationException $e) {
			$errors = $e->validator->errors()->all();
			return $this->alert('info', implode(' ', $errors), [
				'position' => 'top-start',
				'timer'    => 3000,
				'toast'    => true,
				// 'width'    => '380',
			]);
		}
	}

	#[On('incrementViewCount')]
	public function updateIncrementViewCount($itemId)
	{
		$item = Item::find($itemId);
		if ($item)
			$item->increment('count_view');
	}

	#[Title('Detail')]
	public function render()
	{
		$item         = Item::with('category')->where('slug', $this->slug)->first();
		abort_if(empty($item), 404);
		$slider       = Slider::latest('id')->first();
		$transactions = Transaction::with('user')
			->where('item_id', $item->id)
			->where('rating', '!=', null)
			->orderBy('transaction_time', 'desc')
			->get();
		$title        = 'Detail Produk';

		return view('livewire.front.produk-detail', compact('item', 'slider', 'transactions', 'title'));
	}
}
