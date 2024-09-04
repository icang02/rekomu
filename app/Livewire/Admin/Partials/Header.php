<?php

namespace App\Livewire\Admin\Partials;

use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\On;
use Livewire\Component;

class Header extends Component
{
	#[On('submitted')]
	public function render()
	{
		$imgProfil = Auth::user()->image
			? 'storage/' . Auth::user()->image
			: (Auth::user()->group_id == 2
				? 'img/default-image.png'
				: 'img/default-umkm.png');

		return view('livewire.admin.partials.header', [
			'imgProfil' => $imgProfil
		]);
	}
}
