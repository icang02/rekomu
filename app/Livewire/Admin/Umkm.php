<?php

namespace App\Livewire\Admin;

use App\Models\Seller;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\Features\SupportFileUploads\WithFileUploads;
use Livewire\WithPagination;

#[Layout('components.layouts.admin')]
class Umkm extends Component
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
		'address'  => ['required'],
		'location' => ['nullable', 'url'],
		'image'    => ['nullable', 'mimes:png,jpg,jpeg', 'max:2048']
	];

	protected $messages = [
		'name.required'    => 'Nama UMKM tidak boleh kosong.',
		'email.required'   => 'Email tidak boleh kosong.',
		'address.required' => 'Alamat tidak boleh kosong.',
		'location.url'     => 'Link tidak valid.',
		'image.mimes'      => 'Format file harus png, jpg, atau jpeg.',
		'image.max'        => 'Ukuran file maksimal 2Mb.'
	];

	public function store()
	{
		$this->validate();
		$user = User::create([
			'group_id' => 3,
			'name'     => ucwords($this->name),
			'email'    => $this->email,
			'image'    => $this->image ? $this->image->store('user') : null,
			'password' => Hash::make('umkm_123')
		]);
		Seller::create([
			'user_id'  => $user->id,
			'slug'     => generateSlug($user->name),
			'address'  => ucwords($this->address),
			'location' => $this->location,
		]);
		$this->reset();
		$this->dispatch('submitted', type: 'success', message: "Data berhasil ditambahkan.");
	}

	public function update()
	{
		$this->validate();
		$seller = User::findOrFail($this->id);
		if ($this->image) {
			if ($seller->image && Storage::exists($seller->image))
				Storage::delete($seller->image);
			$img = $this->image->store('user');
		}
		$seller->update([
			'name'     => ucwords($this->name),
			'email'    => $this->email,
			'image'    => $img ?? $this->imageData,
		]);
		$seller->seller->update([
			'slug'     => generateSlug($this->name),
			'address'  => ucwords($this->address),
			'location' => $this->location,
		]);
		$this->resetForm();
		$this->dispatch('submitted', type: 'success', message: "Data berhasil diupdate.");
	}

	public function destroy()
	{
		$seller = User::findOrFail($this->id);
		if ($seller->image && Storage::exists($seller->image))
			Storage::delete($seller->image);
		$seller->delete();

		$this->resetForm();
		$this->dispatch('submitted', type: 'info', message: "Data berhasil dihapus.");
	}

	public function getEditItem($id)
	{
		$seller           = User::findOrFail($id);
		$this->id         = $seller->id;
		$this->name       = $seller->name;
		$this->email      = $seller->email;
		$this->imageData  = $seller->image;
		$this->address    = $seller->seller->address;
		$this->location   = $seller->seller->location;
		$this->updateMode = true;
		$this->dispatch('data-edit-loaded');
	}

	public function getDeleteItem($id)
	{
		$seller           = User::findOrFail($id);
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

	#[Title('UMKM')]
	public function render()
	{
		$sellers = User::with('seller')
			->where('group_id', 3)
			->where('name', 'like', "%$this->search%")
			->orWhereHas('seller', function ($query) {
				$query->where('address', 'like', "%$this->search%");
			})
			->orderBy('name')
			->paginate($this->show > 50 ? 50 : $this->show);

		return view('livewire.admin.umkm', compact('sellers'));
	}
}
