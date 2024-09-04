<?php

namespace App\Livewire\Front;

use App\Models\Slider;
use Livewire\Component;

class CheckoutSuccess extends Component
{
	public function render()
	{
		$slider = Slider::latest('id')->first();
		$title = 'Checkout Success';

		return view('livewire.front.checkout-success', compact('slider', 'title'));
	}
}
