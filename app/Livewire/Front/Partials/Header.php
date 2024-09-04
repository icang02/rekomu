<?php

namespace App\Livewire\Front\Partials;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class Header extends Component
{
	public $search;

	public function searching()
	{
		$this->redirectRoute('front.produk', ['search' => $this->search]);
	}

	public function render()
	{
		return view('livewire.front.partials.header');
	}
}
