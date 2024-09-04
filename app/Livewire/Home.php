<?php

namespace App\Livewire;

use App\Models\Slider;
use Livewire\Attributes\Title;
use Livewire\Component;

class Home extends Component
{
    public $sliders;

    public function mount()
    {
        $this->sliders = Slider::all();
    }

    #[Title('Home')]
    public function render()
    {
        return view('livewire.home');
    }
}
