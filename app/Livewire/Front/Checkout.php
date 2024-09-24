<?php

namespace App\Livewire\Front;

use App\Models\Cart;
use App\Models\Slider;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Title;
use Livewire\Component;

class Checkout extends Component
{
	public $shipping_address, $recipient_contact;

	public function mount()
	{
		if (!Auth::user()->contact || !Auth::user()->address)
			return redirect()->route('front.keranjang');
	}

	public function processCheckout()
	{
		// $this->validate([
		// 	'shipping_address'  => ['required'],
		// 	'recipient_contact' => ['required', 'regex:/^628[1-9][0-9]{7,12}$/'],
		// ], [
		// 	'shipping_address.required'  => 'Masukkan detail alamat pengiriman.',
		// 	'recipient_contact.required' => 'Masukkan nomor kontak penerima.',
		// 	'recipient_contact.regex' => 'Nomor telpon diawali dengan 628xxx.'
		// ]);
		$this->dispatch('valid-checkout');
	}

	public function storeCheckout()
	{
		$carts = Cart::with(['item.seller'])->where('user_id', Auth::user()->id)->get();
		foreach ($carts as $cart) {
			Transaction::create([
				'user_id'           => Auth::user()->id,
				'item_id'           => $cart->item_id,
				'seller_id'         => $cart->item->seller->id,
				'code'              => generateCodeTransaction(Carbon::now()),
				'quantity'          => $cart->quantity,
				'transaction_time'  => Carbon::now(),
				'shipping_address'  => Auth::user()->address,
				'recipient_contact' => Auth::user()->contact,
			]);
		}
		Cart::where('user_id', Auth::user()->id)->delete();
		$this->dispatch('cartUpdated');

		return $this->redirectRoute('front.checkout-success');
	}

	#[Title('Checkout')]
	public function render()
	{
		$slider       = Slider::latest('id')->first();
		$itemCheckout = Cart::with('item')->where('user_id', Auth::user()->id)->get();
		$title = 'Checkout';

		if ($itemCheckout->count() == 0) redirect()->route('front.keranjang');

		return view('livewire.front.checkout', compact('slider', 'itemCheckout', 'title'));
	}
}
