<?php

namespace App\Livewire\Auth;

use App\Livewire\Admin\User;
use App\Models\Group;
use App\Models\Seller;
use App\Models\User as ModelsUser;
use Illuminate\Support\Facades\Hash;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

#[Layout('components.layouts.auth')]
class Register extends Component
{
  public $name, $email, $password, $password_confirmation, $group_id;

  #[Title('Register')]
  public function render()
  {
    $groups = Group::where('name', '!=', 'Admin')->orderBy('name')->get();
    return view('livewire.auth.register', compact('groups'));
  }

  protected $rules = [
    'name'                  => 'required|min:3',
    'email'                 => 'required|unique:users',
    'password'              => 'required|min:6|confirmed',
    'group_id'              => 'required',
  ];

  protected $messages = [
    'name.required'         => 'Nama tidak boleh kosong.',
    'name.min'              => 'Nama minimal 3 karakter.',
    'email.required'        => 'Email tidak boleh kosong.',
    'email.unique'          => 'Alamat email sudah terdaftar.',
    'password.required'     => 'Password tidak boleh kosong',
    'password.min'          => 'Pasword minimal 6 karakter.',
    'password.confirmed'    => 'Konfirmasi password tidak sesuai.',
    'group_id.required'     => 'Tipe akun tidak boleh kosong.'
  ];

  public function register()
  {
    $this->validate();
    $user = ModelsUser::create([
      'name'     => ucwords($this->name),
      'email'    => $this->email,
      'password' => Hash::make($this->password),
      'group_id' => $this->group_id
    ]);
    if ($this->group_id == 3) {
      Seller::create([
        'user_id' => $user->id,
        'slug' => generateSlug($this->name),
      ]);
    }

    $this->redirectRoute('login');
    session()->flash('success', 'Akun berhasil dibuat. Silahkan login.');
  }
}
