<?php

namespace App\Livewire\Partials;

use App\Models\Cart;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\On;
use Livewire\Component;

class CartCount extends Component
{
    public $cartCount;

    public function mount()
    {
        $this->cartCount = Cart::where('user_id', Auth::user()->id)->count();
    }

    #[On('cartUpdated')]
    public function updateCartCount()
    {
        $this->cartCount = Cart::where('user_id', Auth::user()->id)->count();
    }

    public function render()
    {
        return view('livewire.partials.cart-count');
    }
}
