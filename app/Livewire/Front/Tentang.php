<?php

namespace App\Livewire\Front;

use App\Models\Slider;
use Livewire\Attributes\Title;
use Livewire\Component;

class Tentang extends Component
{
    #[Title('Tentang')]
    public function render()
    {
        $title  = 'Tentang';
        $slider = Slider::latest('id')->first();
        return view('livewire.front.tentang', compact('title', 'slider'));
    }
}
