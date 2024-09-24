<?php

namespace App\Livewire\Admin;

use App\Models\Item;
use App\Models\Setting;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;
use Livewire\WithFileUploads;

#[Layout('components.layouts.admin')]
class Profil extends Component
{
    use WithFileUploads;

    public $name, $email, $imageData;
    public $image, $oldEmail;
    public $address, $location;
    public $new_password, $new_password_confirmation;

    public $percentage;


    protected $rules = [
        'name'         => ['required'],
        'email'        => ['required', 'unique:users'],
        'image'        => ['nullable', 'mimes:png,jpeg,jpg', 'max:2048'],
        'new_password' => ['nullable', 'min:6', 'confirmed:new_password_confirmation'],
        'location'     => ['nullable', 'url']
    ];

    protected $messages = [
        'name.required'          => 'Nama tidak boleh kosong.',
        'email.required'         => 'Email tidak boleh kosong.',
        'email.unique'           => 'Alamat email sudah digunakan.',
        'image.mimes'            => 'Format file harus png, jpg, atau jpeg.',
        'image.max'              => 'Maksimal ukuran file 2Mb.',
        'new_password.confirmed' => 'Konfirmasi password tidak sesuai.',
        'new_password.min'       => 'Password minimal 6 karakter.',
        'location.url'           => 'Link maps tidak valid.'
    ];

    public function mount()
    {
        $this->name      = Auth::user()->name;
        $this->email     = Auth::user()->email;
        $this->imageData = Auth::user()->image;
        $this->oldEmail  = Auth::user()->email;
        if (Auth::user()->group_id == 3) {
            $this->address  = Auth::user()->seller->address;
            $this->location = Auth::user()->seller->location;
        }

        $this->percentage = Setting::findOrFail(1)->value;
    }

    public function updateProfil()
    {
        if ($this->email == $this->oldEmail)
            unset($this->rules['email'][1]);
        $this->validate();

        $user = User::findOrFail(Auth::user()->id);
        if ($this->image) {
            if ($user->image && Storage::exists($user->image))
                Storage::delete($user->image);
            $img = $this->image->store('user');
        }
        $user->update([
            'name'  => ucwords($this->name),
            'email' => $this->email,
            'image' => $img ?? $this->imageData,
            'password' => $this->new_password ? Hash::make($this->new_password) : $user->password
        ]);

        if (Auth::user()->group_id == 3) {
            $user->seller->update([
                'slug' => generateSlug($this->name),
                'address' => ucwords($this->address),
                'location' => $this->location,
            ]);
        }

        $this->imageData = $img ?? $this->imageData;
        $this->reset('image', 'new_password', 'new_password_confirmation');
        $this->dispatch('submitted', type: 'success', title: 'Notifikasi', message: 'Profil diupdate.');
    }

    public function changePercentagePrice()
    {
        if ($this->percentage > 100)
            return $this->dispatch('submitted', type: 'danger', title: 'Notifikasi', message: 'Maksimal 100%.');

        Setting::findOrFail(1)->update([
            'value' => (int) $this->percentage
        ]);

        $percentage = Setting::findOrFail(1)->value;
        $items = Item::all();
        foreach ($items as $item) {
            $item->update([
                'price' => $item->real_price * (((int) $percentage / 100) + 1)
            ]);
        }

        $this->dispatch('submitted', type: 'success', title: 'Notifikasi', message: 'Persentase kenaikan harga produk diupdate.');
    }

    #[Title('Profil')]
    public function render()
    {
        return view('livewire.admin.profil');
    }
}
