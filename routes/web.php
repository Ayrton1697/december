<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Http\Controllers\transactionsController;


// dd($response['rates']);

Route::get('/transactions/{from?}{to?}{SourceAccountID?}', [transactionsController::class, 'index'] )->whereNumber('SourceAccountID')
                                                                                                    ->whereAlpha('from')
                                                                                                    ->whereAlpha('to');

Route::post('/transfer', [transactionsController::class, 'transfer'])->middleware(['auth']);

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';
