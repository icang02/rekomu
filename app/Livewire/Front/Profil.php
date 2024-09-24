<?php

namespace App\Livewire\Front;

use App\Models\User;
use Illuminate\Contracts\Cache\Store;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\Features\SupportFileUploads\WithFileUploads;

class Profil extends Component
{
	use WithFileUploads;

	public $name, $email, $imageData, $contact, $address;
	public $image, $oldEmail;
	public $new_password, $new_password_confirmation;
	public $check_email, $isValidCheck = false;

	public function mount()
	{
		$this->name      = Auth::user()->name;
		$this->email     = Auth::user()->email;
		$this->oldEmail  = Auth::user()->email;
		$this->imageData = Auth::user()->image;
		$this->contact   = Auth::user()->contact;
		$this->address   = Auth::user()->address;
	}

	protected $rules = [
		'name'    => ['required'],
		'email'   => ['required', 'unique:users'],
		'image'   => ['nullable', 'mimes:png,jpg,jpeg', 'max:2048'],
		'contact' => ['nullable', 'numeric']
	];

	protected $messages = [
		'name.required' => 'Nama tidak boleh kosong.',
		'email.required' => 'Email tidak boleh kosong.',
		'email.unique' => 'Email sudah pernah digunakan.',
		'image.mimes' => 'Format file harus png, jpg, atau jpeg.',
		'image.max' => 'Maksimal ukuran file 2Mb.',
		'contact.numeric' => 'Harus berupa angka.',
	];

	public function updatedCheckEmail()
	{
		if ($this->check_email == Auth::user()->email) {
			$this->isValidCheck = true;
		} else {
			$this->isValidCheck = false;
		}
	}

	public function update()
	{
		if ($this->email == $this->oldEmail) {
			unset($this->rules['email'][1]);
		}
		$this->validate();

		$id = Auth::user()->id;
		$user = User::findOrFail($id);
		if ($this->image) {
			if ($user->image && Storage::exists($user->image))
				Storage::delete($user->image);
			$img = $this->image->store('user');
		}
		$user->update([
			'name'    => ucwords($this->name),
			'email'   => $this->email,
			'image'   => $img ?? $this->imageData,
			'contact' => $this->contact,
			'address' => trim(ucfirst($this->address)) == '' ? null : trim(ucfirst($this->address)),
		]);

		$this->name    = $user->name;
		$this->email   = $user->email;
		$this->contact = $user->contact;
		$this->address = ucfirst($user->address);
		session()->flash('success', 'Data profil diupdate.');
	}

	public function resetPassword()
	{
		$this->validate([
			'new_password' => ['required', 'min:6', 'confirmed:new_password_confirmation'],
		], [
			'new_password.required'  => 'Kolom tidak boleh kosong.',
			'new_password.confirmed' => 'Konfirmasi password tidak sesuai.',
			'new_password.min'       => 'Password minimal 6 karakter.'
		]);

		$user = User::findOrFail(Auth::user()->id);
		$user->update([
			'password' => Hash::make($this->new_password)
		]);
		$this->reset();
		$this->dispatch('reset_password');
		session()->flash('reset_password', 'Password berhasil direset.');
	}

	public function confirmDeleteAccount()
	{
		$this->dispatch('valid-email');
		$this->reset('check_email', 'isValidCheck');
	}

	public function deleteAccount()
	{
		$user = User::findOrFail(Auth::user()->id);
		if ($user->image && Storage::exists($user->image))
			Storage::delete($user->image);
		$this->redirectRoute('logout');
		$user->delete();
	}

	public function resetForm()
	{
		$this->reset('new_password', 'new_password_confirmation');
		$this->resetValidation();
	}

	#[Title('Profil')]
	public function render()
	{
		return view('livewire.front.profil');
	}
}
