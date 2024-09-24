<?php

namespace App\Livewire\Front;

use App\Models\Cart as ModelsCart;
use App\Models\Slider;
use Illuminate\Support\Facades\Auth;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Attributes\Title;
use Livewire\Component;

class Cart extends Component
{
	use LivewireAlert;

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

	public function checkProfil()
	{
		return $this->alert('info', 'Lengkapi data profil terlebih dulu', [
			'position' => 'top-start',
			'timer'    => 3000,
			'toast'    => true,
			'width'    => '380',
		]);
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
