<?php

namespace App\Livewire\Auth;

use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

#[Layout('components.layouts.auth')]
class Login extends Component
{
  public $email, $password;

  public function authenticate()
  {
    $this->validate([
      'email'     => 'required',
      'password'  => 'required'
    ], [
      'email.required' => 'Email tidak boleh kosong.',
      'password.required' => 'Password tidak boleh kosong.'
    ]);

    if (Auth::attempt(['email' => $this->email, 'password' => $this->password])) {
      return Auth::user()->group_id == 2 ?
        $this->redirectRoute('front.beranda') :
        $this->redirectRoute('admin.dashboard');
    }

    session()->flash('error', 'Username atau email tidak valid.');
    $this->reset('password');
    return back();
  }

  #[Title('Login')]
  public function render()
  {
    return view('livewire.auth.login');
  }
}
