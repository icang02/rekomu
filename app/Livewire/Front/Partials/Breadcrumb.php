<?php

namespace App\Livewire\Front\Partials;

use App\Models\Slider;
use Livewire\Component;

class Breadcrumb extends Component
{
    public function render()
    {
        return view('livewire.front.partials.breadcrumb', [
            'slider' => Slider::latest('id')->first()
        ]);
    }
}
