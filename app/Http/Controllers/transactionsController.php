<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Models\Account;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;


class transactionsController extends Controller
{
    public function convert($currency_from, $currency_to, $amount){

        echo('Convirtiendo las monedas');

        $api_key = ENV('FIXER_API_KEY');

        $response = Http::withHeaders([
         'apikey' => $api_key
        ])->get('https://api.apilayer.com/fixer/convert?to='. $currency_to .'&from='. $currency_from .'&amount='.$amount);

        return $response->json()['result'];
    }

    public function index(Request $request){

        // MIDDLEWARE USER

        if(isset($request->SourceAccountID)){
            $transactions = Transaction::where('account_from',$request->SourceAccountID)->get();
            // dd('cacona');
        }else{
            $transactions = Transaction::all();
        }
        if(isset($request->from)){
            $transactions = $transactions->where('created_at', '>=',$request->from);
        }
        if(isset($request->to)){
            $transactions = $transactions->where('created_at', '<=',$request->to);
        }
        
    
        foreach($transactions as $transaction){
        echo('Transacción realizada desde la cuenta: '.$transaction->account_from . ' hacia la cuenta: ' .$transaction->account_to. ' , con fecha del '. 
                                                                                                                        date('Y-m-d',strtotime($transaction->created_at)));
        echo('   Monto total de la transacción: '.$transaction->amount. ' ' .$transaction->account_to_currency);
        echo("<br>");
        echo("<br>");
        echo("<br>");
        }
       dd(); //RETURNEAR LAS TRANSACTIONS
    }

    public function transfer(Request $request){

        $user = Auth::user();
        $account_from = Account::find($request->input('account_from'));
        $account_to = Account::find($request->input('account_to'));

        //echo($user->accounts[0]->id);
        if(Account::where('user_id',$user->id)->get()->pluck('id')->contains($account_from->id)){

        $validation = $this->validate($request, [
            'account_from' => 'required',
            'account_to' => 'required',
            'amount' => 'required'
        ]);

        if(Account::where('user_id',$user->id)->get()->pluck('id')->contains($account_to->id)){
            $tax = 0.00;
        }else{
            $tax = 0.01;
        }

        $amount_origin = $request->input('amount');
        $taxed_amount = $amount_origin*$tax;

        //PRIMERO CHEQUEAR QUE EL USER TENGA SALDO
        if($account_from->balance >= $amount_origin){

        //CHEQUEAR QUE LAS MONEDAS ENTRA LAS CUENTAS COINCIDAN, SINO HACER LA CONVERSION
        if($account_from->currency == $account_to->currency){
            echo('Ambas cuentas utilizan la misma moneda');
            $amount_to = $amount_origin;
        }else{
            echo('Las monedas son distintas');
           $amount_to = $this->convert($account_from->currency, $account_to->currency, $amount_origin);
        }
     

        $transaction = new Transaction();
        $transaction->account_from = $request->input('account_from');
        $transaction->account_from_currency = $account_from->currency;
        $transaction->account_to = $request->input('account_to');
        $transaction->account_to_currency = $account_to->currency;
        $transaction->amount = $amount_origin;

        //NO HARDCODEAR ESTO, QUE SE CALCULE AUTOMATICAMENTE SEGUN EL ACCOUNT_ID
        
        // $transaction->account_from_currency = $request->input('account_from');
        // $transaction->account_to_currency = $request->input('account_to_currency');

        $account_from->balance-=($transaction->amount + $taxed_amount);
        $account_to->balance+=$amount_to;
        
        $account_from->save();
        $account_to->save();
        $transaction->save();

        $transaction->accounts()->attach($account_from);
        $transaction->accounts()->attach($account_to);
        //$account_to->save();
        }else{
            return 'Usted no posee suficiente saldo en la cuenta para realizar la transaccion';
        }

        $data =[ 'code' => 200,
                 'account_from' => $account_from,
                 'account_to' => $account_to,
                 'amount' => $transaction->amount
                ];

    }else{
        $data = [
            'code' => 400,
            'message' => 'Usted no es el dueño de la cuenta desde la cual intenta transferir dinero.'
        ];
    }
        return $data;
    }
}
