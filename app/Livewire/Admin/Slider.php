<?php

namespace App\Livewire\Admin;

use App\Models\Slider as ModelsSlider;
use Illuminate\Support\Facades\Storage;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;
use Livewire\Features\SupportFileUploads\WithFileUploads;
use Livewire\WithPagination;

#[Layout('components.layouts.admin')]
class Slider extends Component
{
  use WithFileUploads, WithPagination;

  protected $paginationTheme = 'bootstrap5';

  #[Url('search')]
  public $search;
  #[Url('show')]
  public $show;

  public $updateMode = false;
  public $id, $name, $image;
  public $imageData;

  public function resetFormCreate()
  {
    $this->name = null;
    $this->reset();
    $this->resetValidation();
  }

  public function getEditItem($id)
  {
    $slider           = ModelsSlider::find($id);
    $this->id         = $slider->id;
    $this->name       = $slider->name;
    $this->imageData  = $slider->image;
    $this->updateMode = true;
    $this->dispatch('data-edit-loaded');
  }
  public function getDeleteItem($sliderId)
  {
    $slider           = ModelsSlider::find($sliderId);
    $this->id         = $slider->id;
    $this->name       = $slider->name;
    $this->updateMode = true;
    $this->dispatch('data-delete-loaded');
  }

  protected $rules = [
    'name'  => ['required'],
    'image' => ['required', 'mimes:png,jpg,jpeg', 'max:2048']
  ];

  protected $messages = [
    'name.required'  => 'Judul tidak boleh kosong.',
    'image.required' => 'Gambar tidak boleh kosong',
    'image.mimes'    => 'File harus berformat png, jpg, atau jpeg.',
    'image.max'      => 'Ukuran file maksimal 2Mb.'
  ];

  public function store()
  {
    $this->validate();
    ModelsSlider::create([
      'name'  => ucwords($this->name),
      'image' => $this->image->store('slider')
    ]);

    $this->dispatch('submitted', type: 'success', message: "Data berhasil ditambahkan.");
  }

  public function update()
  {
    if (!$this->image)
      unset($this->rules['image']);
    $this->validate();

    $slider = ModelsSlider::findOrFail($this->id);
    if ($this->image) {
      if ($slider->image && Storage::exists($slider->image))
        Storage::delete($slider->image);
      $img = $this->image->store('slider');
    }

    $slider->update([
      'name'  => ucwords($this->name),
      'image' => $img ?? $this->imageData
    ]);

    $this->dispatch('submitted', type: 'success', message: "Data berhasil diupdate.");
  }

  public function destroy()
  {
    $slider = ModelsSlider::findOrFail($this->id);
    if (Storage::exists($slider->image))
      Storage::delete($slider->image);
    $slider->delete();

    $this->dispatch('submitted', type: 'info', message: "Data berhasil dihapus.");
  }

  #[Title('Slider')]
  public function render()
  {
    $sliders = ModelsSlider::orderBy('name')->paginate($this->show > 50 ? 50 : $this->show);
    return view('livewire.admin.slider', compact('sliders'));
  }
}
