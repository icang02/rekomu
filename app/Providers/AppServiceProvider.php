<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Gate::define('admin', function (User $user) {
            return $user->group_id === 1;
        });
        Gate::define('user', function (User $user) {
            return $user->group_id === 2;
        });
        Gate::define('umkm', function (User $user) {
            return $user->group_id === 3;
        });

        Gate::define('admin-umkm', function (User $user) {
            return $user->group_id === 1 || $user->group_id === 3;
        });
    }
}
