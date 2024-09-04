<?php

namespace App\Livewire\Front;

use App\Models\Cart as ModelsCart;
use App\Models\Slider;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Title;
use Livewire\Component;

class Cart extends Component
{
	public $quantities = [];

	public function mount()
	{
		$carts = ModelsCart::with('item')->where('user_id', Auth::user()->id)->get();
		$this->quantities = $carts->pluck('quantity', 'id')->toArray();
	}

	public function updatedQuantities($value, $key)
	{
		if ($value != "0" && $value != "") {
			$cart = ModelsCart::findOrFail($key);
			$cart->update(['quantity' => $value]);
		}
	}

	public function deleteCartItem($cartId)
	{
		$cart = ModelsCart::findOrFail($cartId);
		$cart->delete();
		$this->dispatch('cartUpdated');
	}

	#[Title('Keranjang')]
	public function render()
	{
		$slider = Slider::latest('id')->first();
		$carts  = ModelsCart::with('item')->where('user_id', Auth::user()->id)->get();
		$title  = 'Keranjang';

		return view('livewire.front.cart', compact('slider', 'title', 'carts'));
	}
}
