<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use Illuminate\Support\Arr;

class AccountFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $user_ids = User::all()->pluck('id')->toArray();
        $currencies = ['UYU','USD','EUR'];

        return [
            'user_id' => Arr::random($user_ids),
            'currency' =>  Arr::random($currencies),
            'address' => $this->faker->address(),
            'balance' => $this->faker->randomFloat(2, 0, 10000)
        ];
    }
}
