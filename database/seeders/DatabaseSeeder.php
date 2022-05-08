<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Account;
use App\Models\Transaction;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::factory(10)->create();
        \App\Models\Account::factory(10)->create();
        \App\Models\Transaction::factory(10)->create();


        $account = Account::all();
        Transaction::all()->each(function($transaction) use ($account){
            $transaction->accounts()->attach(
                $transaction->account_from
            );
            $transaction->accounts()->attach(
                $transaction->account_to
            );
        });
    }
}
