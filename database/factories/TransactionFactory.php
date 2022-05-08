<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Arr;
use App\Models\Account;

class TransactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {

        $accounts_1 = Arr::random(Account::orderBy('id', 'asc')->take(5)->pluck('id')->toArray());
        $accounts_2 = Arr::random(Account::orderBy('id', 'desc')->take(5)->take(5)->pluck('id')->toArray());

        $accounts_1_currency = Account::find($accounts_1)->currency;
        $accounts_2_currency = Account::find($accounts_2)->currency;

        return [
            
            'amount' => $this->faker->randomFloat(2, 0, 10000),
            'description' => $this->faker->sentence(),
            'account_from' => $accounts_1,
            'account_to' => $accounts_2,
            'account_from_currency' => $accounts_1_currency,
            'account_to_currency' => $accounts_2_currency,

        ];
    }
}
