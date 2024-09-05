<?php

namespace App\Livewire\Front;

use App\Models\Item;
use App\Models\Slider;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithPagination;

class Riwayat extends Component
{
	use WithPagination, LivewireAlert;

	protected $paginationTheme = 'bootstrap';

	public $transactionId, $itemName, $ratingInput, $reviewInput;

	public function setRatingInput($transationId)
	{
		$transaction         = Transaction::with('item')->find($transationId);
		$this->itemName      = $transaction->item->name;
		$this->transactionId = $transaction->id;
		$this->itemName      = $transaction->item->name;
		$this->ratingInput   = $transaction->rating;
		$this->reviewInput   = $transaction->review;
	}

	public function resetForm()
	{
		$this->itemName = null;
		$this->ratingInput = null;
		$this->reviewInput = null;
	}

	public function saveForm()
	{
		$transaction = Transaction::find($this->transactionId);
		$transaction->update([
			'rating' => $this->ratingInput,
			'review' => strlen($this->reviewInput) == 0 ? null : ucfirst($this->reviewInput)
		]);

		// Update Average Rating
		$calCulateRating = Transaction::where('item_id', $transaction->item_id)->avg('rating');
		Item::find($transaction->item_id)->update([
			'average_rating' => $calCulateRating
		]);

		$this->resetForm();
		$this->alert('success', 'Berhasil melakukan rating', [
			'position' => 'top-start',
			'timer'    => 3000,
			'toast'    => true,
			// 'width'    => '380',
		]);
	}

	#[Title('Riwayat Pesanan')]
	public function render()
	{
		$slider = Slider::latest('id')->first();
		$transactions = Transaction::with(['item', 'seller.user'])
			->where('user_id', Auth::user()->id)
			->orderBy('transaction_time', 'desc')
			->paginate(5);
		$title = 'Riwayat Pesanan';

		return view('livewire.front.riwayat', compact('slider', 'transactions', 'title'));
	}
}
