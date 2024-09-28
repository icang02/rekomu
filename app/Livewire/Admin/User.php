<?php

namespace App\Livewire\Admin;

use App\Models\Seller;
use App\Models\User as ModelsUser;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\Features\SupportFileUploads\WithFileUploads;
use Livewire\WithPagination;

#[Layout('components.layouts.admin')]
class User extends Component
{
  use WithFileUploads, WithPagination;

  protected $paginationTheme = 'bootstrap5';
  public $updateMode = false;
  public $id, $name, $email, $address, $location, $imageData;
  public $image;

  #[Url('search')]
  public $search;
  #[Url('show')]
  public $show;

  protected $rules = [
    'name'     => ['required'],
    'email'    => ['required'],
    'image'    => ['nullable', 'mimes:png,jpg,jpeg', 'max:2048']
  ];

  protected $messages = [
    'name.required'    => 'Nama user tidak boleh kosong.',
    'email.required'   => 'Email tidak boleh kosong.',
    'image.mimes'      => 'Format file harus png, jpg, atau jpeg.',
    'image.max'        => 'Ukuran file maksimal 2Mb.'
  ];

  public function store()
  {
    $this->validate();
    ModelsUser::create([
      'group_id' => 2,
      'name'     => ucwords($this->name),
      'email'    => $this->email,
      'image'    => $this->image ? $this->image->store('user') : null,
      'password' => Hash::make('user_123')
    ]);
    $this->reset();
    $this->dispatch('submitted', type: 'success', message: "Data berhasil ditambahkan.");
  }

  public function update()
  {
    $this->validate();
    $user = ModelsUser::findOrFail($this->id);
    if ($this->image) {
      if ($user->image && Storage::exists($user->image))
        Storage::delete($user->image);
      $img = $this->image->store('user');
    }
    $user->update([
      'name'     => ucwords($this->name),
      'email'    => $this->email,
      'image'    => $img ?? $this->imageData,
    ]);
    $this->resetForm();
    $this->dispatch('submitted', type: 'success', message: "Data berhasil diupdate.");
  }

  public function destroy()
  {
    $seller = ModelsUser::findOrFail($this->id);
    if ($seller->image && Storage::exists($seller->image))
      Storage::delete($seller->image);
    $seller->delete();

    $this->resetForm();
    $this->dispatch('submitted', type: 'info', message: "Data berhasil dihapus.");
  }

  public function getEditItem($id)
  {
    $seller           = ModelsUser::findOrFail($id);
    $this->id         = $seller->id;
    $this->name       = $seller->name;
    $this->email      = $seller->email;
    $this->imageData  = $seller->image;
    $this->updateMode = true;
    $this->dispatch('data-edit-loaded');
  }

  public function getDeleteItem($id)
  {
    $seller           = ModelsUser::findOrFail($id);
    $this->id         = $seller->id;
    $this->name       = $seller->name;
    $this->dispatch('data-delete-loaded');
  }

  public function resetForm()
  {
    $this->reset();
    $this->resetValidation();
    $this->updateMode = false;
  }

  #[Title('User')]
  public function render()
  {
    $users = ModelsUser::where('group_id', 2)
      ->where('name', 'like', "%$this->search%")
      ->orderBy('name')
      ->paginate($this->show > 50 ? 50 : $this->show);

    return view('livewire.admin.user', compact('users'));
  }
}
