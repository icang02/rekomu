<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use App\Models\Item;
use App\Models\Seller;
use App\Models\Setting;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\Features\SupportFileUploads\WithFileUploads;

#[Layout('components.layouts.admin')]
class EditProduk extends Component
{
  use WithFileUploads;

  public $id, $name, $price, $real_price, $category_id, $seller_id, $imageItem;
  public $image;

  public $percentage;

  public function mount($id)
  {
    $item              = Item::findOrFail($id);
    $this->id          = $item->id;
    $this->name        = $item->name;
    $this->price       = $item->price;
    $this->real_price  = $item->real_price;
    $this->imageItem   = $item->image;
    $this->category_id = $item->category_id;
    $this->seller_id   = $item->seller_id;

    $this->percentage = Setting::findOrFail(1)->value;
  }

  public function updatedRealPrice()
  {
    // dd($this->real_price);
    if ($this->real_price !== "") {
      $this->price = $this->real_price * (((int) $this->percentage / 100) + 1);
    }
  }

  public function resetInputFields()
  {
    $item              = Item::findOrFail($this->id);
    $this->id          = $item->id;
    $this->name        = $item->name;
    $this->price       = $item->price;
    $this->real_price  = $item->real_price;
    $this->image       = null;
    $this->imageItem   = $item->image;
    $this->category_id = $item->category_id;
    $this->seller_id   = $item->seller_id;
    $this->resetValidation();
  }

  public function updateItem()
  {
    $item = Item::findOrFail($this->id);
    $img  = $item->image;
    if ($this->image) {
      if ($this->imageItem && Storage::delete($this->imageItem))
        Storage::delete($this->imageItem);
      $img = $this->image->store('item');
    }

    $item->update([
      'name' => ucwords($this->name),
      'slug' => generateSlug($this->name),
      'price' => $this->real_price * (((int) $this->percentage / 100) + 1),
      'real_price' => $this->real_price,
      'image' => $img,
      'category_id' => $this->category_id,
      'seller_id' => $this->seller_id
    ]);

    $this->resetInputFields();
    $this->dispatch('submitted', type: 'success', message: "Data produk berhasil diudate.");
  }

  #[Title('Edit Produk')]
  public function render()
  {
    $categories = Category::orderBy('name')->get();
    if (Auth::user()->group_id == 1) {
      $sellers    = Seller::with('user')
        ->whereHas('user', function ($query) {
          $query->orderBy('name');
        })->get();
    } else if (Auth::user()->group_id == 3) {
      $sellers = Seller::with('user')
        ->where('user_id', Auth::user()->id)
        ->first();
      $this->seller_id = $sellers->id;
    }


    return view('livewire.admin.edit-produk', compact('categories', 'sellers'));
  }
}
