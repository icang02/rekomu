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
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;


#[Layout('components.layouts.admin')]
class Produk extends Component
{
  use WithPagination, WithFileUploads;
  protected $paginationTheme = 'bootstrap5';

  public $id, $name, $price, $image, $category_id, $seller_id;
  public $imageItem;
  public $percentage;


  #[Url('show')]
  public $show = 10;
  #[Url('search')]
  public $search;


  protected $rules = [
    'name'        => ['required'],
    'price'       => ['required'],
    'category_id' => ['required'],
    'seller_id'   => ['required'],
    'image'       => ['nullable', 'mimes:png,jpg,jpeg', 'max:2048']
  ];

  protected $messages = [
    'name.required'  => 'Nama produk tidak boleh kosong.',
    'price.required' => 'Harga produk tidak boleh kosong.',
    'category_id'    => 'Kategori produk tidak boleh kosong.',
    'seller_id'      => 'Pilih UMKM terlebih dahulu.',
    'image.mimes'    => 'Format file harus png, jpg, atau jpeg.',
    'image.max'      => 'Ukuran file maksimal 2Mb.'
  ];

  public function mount()
  {
    $this->percentage = Setting::findOrFail(1)->value;
  }

  public function changeFeaturedProduct($id)
  {
    $item = Item::findOrFail($id);
    $item->update([
      'is_featured_product' => !$item->is_featured_product
    ]);
  
    $msg = $item->is_featured_product == false ? 'dihapus' : 'ditambahkan';
    $message = "Produk unggulan $msg : "  .  "$item->name ";

    $this->dispatch('submitted', type: $item->is_featured_product ? 'success' : 'danger', message: $message);
  }

  public function updatedSearch()
  {
    $this->resetPage();
  }

  public function getDeleteItem($id)
  {
    $item            = Item::findOrFail($id);
    $this->id        = $item->id;
    $this->name      = $item->name;
    $this->imageItem = $item->image;
    $this->dispatch('item-loaded');
  }

  public function resetInputFields()
  {
    $this->id          = null;
    $this->name        = null;
    $this->price       = null;
    $this->image       = null;
    $this->category_id = null;
    $this->seller_id   = null;
    $this->resetValidation();
  }

  public function storeItem()
  {
    $this->validate();
    $imageName = $this->image ? $this->image->store('item') : null;
    $item = Item::create([
      'name'        => ucwords($this->name),
      'slug'        => generateSlug($this->name),
      'price'       => $this->price * (((int) $this->percentage / 100) + 1),
      'real_price'  => $this->price,
      'image'       => $imageName,
      'category_id' => $this->category_id,
      'seller_id'   => $this->seller_id,
    ]);

    $this->dispatch('submitted', type: 'success', message: "Produk $item->name berhasil ditambahkan.");
  }

  public function deleteItem()
  {
    $item     = Item::findOrFail($this->id);
    $itemName = $item->name;
    if ($item->image && Storage::exists($item->image))
      Storage::delete($item->image);
    $item->delete();

    $this->dispatch('submitted', type: 'info', message: "Produk $itemName berhasil dihapus.");
  }

  public function UpdateProdukUnggulan($id)
  {
    dd($id);
  }

  #[Title('Produk')]
  public function render()
  {
    if (Auth::user()->group_id == 1) {
      $items = Item::orderBy('is_featured_product', 'desc')->orderBy('name')
        ->with('seller.user', 'category')
        ->where(function ($query) {
          $query->where('name', 'like', "%$this->search%")
            ->orWhereHas('seller.user', function ($query) {
              $query->where('name', 'like', "%{$this->search}%");
            })
            ->orWhereHas('category', function ($query) {
              $query->where('name', 'like', "%{$this->search}%");
            });
        })
        ->paginate($this->show > 50 ? 50 : $this->show);
      $sellers    = Seller::with('user')
        ->whereHas('user', function ($query) {
          $query->orderBy('name');
        })->get();
    } else if (Auth::user()->group_id == 3) {
      $items = Item::orderBy('name')
        ->with('seller.user', 'category')
        ->where('seller_id', Auth::user()->seller->id)
        ->where(function ($query) {
          $query->where('name', 'like', "%$this->search%")
            ->orWhereHas('seller.user', function ($query) {
              $query->where('name', 'like', "%{$this->search}%");
            })
            ->orWhereHas('category', function ($query) {
              $query->where('name', 'like', "%{$this->search}%");
            });
        })
        ->paginate($this->show > 50 ? 50 : $this->show);
      $sellers    = Seller::with('user')
        ->where('user_id', Auth::user()->id)
        ->first();
      $this->seller_id = $sellers->id;
    }
    $categories = Category::orderBy('name')->get();
    $percentage = Setting::findOrFail(1)->value;

    return view('livewire.admin.produk', compact(
      'items',
      'categories',
      'sellers',
      'percentage'
    ));
  }
}
