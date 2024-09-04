<?php

namespace App\Livewire\Admin;

use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\WithPagination;

#[Layout('components.layouts.admin')]
class Transaksi extends Component
{
	use WithPagination;

	protected $paginationTheme = 'bootstrap5';

	#[Url('search')]
	public $search;
	#[Url('show')]
	public $show;

	#[Title('Transaksi')]
	public function render()
	{
		$transactions = Transaction::with(['item', 'user'])
			->where('seller_id', Auth::user()->seller->id)
			->where(function ($query) {
				$query->where('shipping_address', 'like', "%$this->search%")
					->orWhereHas('user', function ($query) {
						$query->where('name', 'like', "%$this->search%");
					})
					->orWhere('code', 'like', "%$this->search%");
			})
			->orderBy('transaction_time', 'desc')
			->paginate($this->show > 50 ? 50 : $this->show);

		return view('livewire.admin.transaksi', compact('transactions'));
	}
}
