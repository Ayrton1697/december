<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Account;

class Transaction extends Model
{
    use HasFactory;

    protected $fillable = ['account_from', 'account_to', 'amount', 'account_from_currency', 'account_to_currency'];

    public function accounts(){
        return $this->belongsToMany(Account::class);
    }
}
