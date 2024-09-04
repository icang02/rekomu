<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use App\Models\Item;
use App\Models\Seller;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

#[Layout('components.layouts.admin')]
class Dashboard extends Component
{
  #[Title('Dashboard')]
  public function render()
  {
    if (Auth::user()->group_id == 1) {
      $countUser      = User::where('group_id', 2)->count();
      $countUmkm      = User::where('group_id', 3)->count();
      $countItem      = Item::all()->count();
      $countKategori  = Category::all()->count();

      return view('livewire.admin.dashboard', compact(
        'countUser',
        'countUmkm',
        'countItem',
        'countKategori'
      ));
    } else {
      $umkmId         = Seller::where('user_id', Auth::user()->id)->first();
      $countItem      = Item::where('seller_id', $umkmId->id)->count();
      $countTransaksi = Transaction::where('seller_id', $umkmId->id)->count();
      $countUlasan    = Transaction::where('seller_id', $umkmId->id)
        ->where('rating', '!=', null)
        ->count();

      return view('livewire.admin.dashboard', compact(
        'countItem',
        'countTransaksi',
        'countUlasan'
      ));
    }
  }
}
