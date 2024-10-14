<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use App\Models\Item;
use App\Models\Seller;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
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
      $totalQuantities = DB::table('transactions')
        ->join('items', 'transactions.item_id', '=', 'items.id') // Join tabel items berdasarkan item_id
        ->select('items.name', DB::raw('SUM(transactions.quantity) as total_qty'))
        ->groupBy('transactions.item_id', 'items.name')
        ->orderBy('total_qty', 'desc') // Urutkan berdasarkan total_qty terbesar
        ->limit(10) // Ambil 10 qty terbanyak
        ->get();

      // dd($totalQuantities->pluck('total_qty'));

      return view('livewire.admin.dashboard', compact(
        'countUser',
        'countUmkm',
        'countItem',
        'countKategori',
        'totalQuantities'
      ));
    } else {
      $umkmId         = Seller::where('user_id', Auth::user()->id)->first();
      $countItem      = Item::where('seller_id', $umkmId->id)->count();
      $countTransaksi = Transaction::where('seller_id', $umkmId->id)->count();
      $countUlasan    = Transaction::where('seller_id', $umkmId->id)
        ->where('rating', '!=', null)
        ->count();
      $totalQuantities = DB::table('transactions')
        ->join('items', 'transactions.item_id', '=', 'items.id') // Join tabel items berdasarkan item_id
        ->select('items.name', DB::raw('SUM(transactions.quantity) as total_qty'))
        ->groupBy('transactions.item_id', 'items.name')
        ->orderBy('total_qty', 'desc') // Urutkan berdasarkan total_qty terbesar
        ->limit(10) // Ambil 10 qty terbanyak
        ->get();

      return view('livewire.admin.dashboard', compact(
        'countItem',
        'countTransaksi',
        'countUlasan',
        'totalQuantities'
      ));
    }
  }
}
