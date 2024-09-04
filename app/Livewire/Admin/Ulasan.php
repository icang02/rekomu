<?php

namespace App\Livewire\Admin;

use App\Models\Item;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\WithPagination;

#[Layout('components.layouts.admin')]
class Ulasan extends Component
{
  use WithPagination;

  protected $paginationTheme = 'bootstrap5';

  #[Url('search')]
  public $search;
  #[Url('show')]
  public $show;

  #[Title('Ulasan')]
  public function render()
  {
    $transactions = Transaction::where('seller_id', Auth::user()->seller->id)->distinct()->pluck('item_id')->toArray();
    $items = Item::whereIn('id', $transactions)
      ->where('name', 'like', "%$this->search%")
      ->orderBy('name')
      ->paginate($this->show > 50 ? 50 : $this->show);

    return view('livewire.admin.ulasan', compact('items'));
  }
}
