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
class UlasanShow extends Component
{
  use WithPagination;

  protected $paginationTheme = 'bootstrap5';
  public $id;

  public function mount($id)
  {
    $this->id = $id;
  }

  #[Url('search')]
  public $search;
  #[Url('show')]
  public $show;

  #[Title('Ulasan Item')]
  public function render()
  {
    $item = Item::findOrFail($this->id);
    $reviews = Transaction::with('user')
      ->where('seller_id', Auth::user()->seller->id)
      ->where('item_id', $this->id)
      ->whereHas('user', function ($query) {
        $query->where('name', 'like', "%$this->search%");
      })
      ->orderBy('rating_time', 'desc')
      ->paginate($this->show > 50 ? 50 : $this->show);

    return view('livewire.admin.ulasan-show', compact('item', 'reviews'));
  }
}
