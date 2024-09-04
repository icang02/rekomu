<?php

namespace App\Livewire;

use App\Models\Category;
use App\Models\Item;
use App\Models\Slider;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\WithPagination;

class About extends Component
{
  use WithPagination;

  protected $paginationTheme = 'bootstrap';

  #[Url]
  public $search = '';
  #[Url]
  public $category = '';

  public function updatedSearch()
  {
    $this->resetPage();
  }

  #[Title('Produk')]
  public function render()
  {
    $items = Item::with('seller.user')->where('name', 'like', '%' . $this->search . '%')
      ->when($this->category, function ($query, $category) {
        return $query->where('category_id', $category);
      })
      ->orderBy('name')
      ->paginate(11);
    $slider     = Slider::latest('id')->first();
    $categories = Category::orderBy('name')->get();
    $title      = 'List Produk';

    return view('livewire.about', compact('items', 'slider', 'categories', 'title'));
  }
}
