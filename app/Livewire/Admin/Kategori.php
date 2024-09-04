<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Attributes\Url;
use Livewire\Component;

#[Layout('components.layouts.admin')]
class Kategori extends Component
{
	#[Url('search')]
	public $search;

	public $name;
	public $nameOld;
	public $categoryId;

	#[Url('show')]
	public $show = 10;

	public $updateMode = false;

	protected $rules = [
		'name' => ['required', 'unique:categories']
	];
	protected $messages = [
		'name.required' => 'Kategori tidak boleh kosong.',
		'name.unique'   => 'Nama kategori sudah ada.'
	];

	public function getEditItem($categoryId)
	{
		$category         = Category::find($categoryId);
		$this->categoryId = $category->id;
		$this->name       = $category->name;
		$this->nameOld    = $category->name;
		$this->updateMode = true;
		$this->dispatch('data-edit-loaded');
	}
	public function getDeleteItem($categoryId)
	{
		$category         = Category::find($categoryId);
		$this->categoryId = $category->id;
		$this->name       = $category->name;
		$this->nameOld    = $category->name;
		$this->updateMode = true;
		$this->dispatch('data-delete-loaded');
	}

	public function storeCategory()
	{
		$this->validate();
		Category::create([
			'name' => ucfirst($this->name),
			'slug' => generateSlug($this->name)
		]);

		$this->dispatch('submitted', type: 'success', message: "Kategori baru berhasil ditambahkan.");
	}

	public function updateCategory()
	{
		if ($this->name == $this->nameOld)
			unset($this->rules['name'][1]);
		$this->validate();
		$category = Category::findOrFail($this->categoryId);
		$category->update([
			'name' => ucfirst($this->name),
			'slug' => generateSlug($this->name)
		]);

		$this->dispatch('submitted', type: 'success', message: "Kategori $category->name berhasil diupdate.");
	}

	public function deleteCategory()
	{
		$category = Category::find($this->categoryId);
		$categoryName = $category->name;
		$category->delete();
		$this->dispatch('submitted', type: 'success', message: "Kategori $categoryName berhasil dihapus.");
	}

	public function resetFormCreate()
	{
		$this->nameOld = null;
		$this->reset();
		$this->resetValidation();
	}

	#[Title('Kategori')]
	public function render()
	{
		$categories = Category::orderBy('name')
			->where('name', 'like', "%$this->search%")
			->paginate($this->show);
		return view('livewire.admin.kategori', compact('categories'));
	}
}
