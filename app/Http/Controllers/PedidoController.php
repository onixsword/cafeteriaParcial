<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests;

class PedidoController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $usuario = $request->user();
        if(Auth::user()->idTipoUsuario == 2){
        $pedidos = 
            \App\Pedido::where('idUsuario','=',$usuario->id)->get();
        }
        if(Auth::user()->idTipoUsuario == 3){
        $pedidos = 
            \App\Pedido::all();
        }
        $estadosPedido = 
            \App\EstadoPedido::all()->pluck('descripcion','id');
        $argumentos = array();
        $argumentos["pedidos"] = $pedidos;
        $argumentos["estadosPedido"] = $estadosPedido;
        return view('pedidos.index', $argumentos);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $comidas = \App\Comida::all();
        $argumentos = array();
        $argumentos['comidas'] = $comidas;
        return view('pedidos.create', $argumentos);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $nuevoPedido = new \App\Pedido;
        $usuario = $request->user();
        $nuevoPedido->idUsuario = $usuario->id;
        $nuevoPedido->idEstadoPedido = 1;
        $nuevoPedido->total = $request->input("hdTotal");

        if ($nuevoPedido->save()) {
            $cantidades = $request->input("cantidades");
            $nombres = $request->input("nombres");
            $precios = $request->input("precios");
            $subtotales = $request->input("subtotales");
            $ids = $request->input("ids");
            $indice = 0;
            foreach($cantidades as $cantidad) {
                $nuevoElementoPedido = new \App\ElementoPedido;
                $nuevoElementoPedido->idPedido =
                    $nuevoPedido->id;
                $nuevoElementoPedido->idComida =
                    $ids[$indice];
                $nuevoElementoPedido->nombreComida =
                    $nombres[$indice];
                $nuevoElementoPedido->precioComida =
                    $precios[$indice];
                $nuevoElementoPedido->cantidad = 
                    $cantidades[$indice];
                $nuevoElementoPedido->subtotal =
                    $subtotales[$indice];
                    
                $nuevoElementoPedido->save();
                $indice++;
            }
        } else {
            //armar un mensaje de error para decirle al
            //usuario que no se pudo grabar
        }
        return redirect()->route('pedidos.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pedido = \App\Pedido::find($id);
        $cuentaCliente = \App\User::where('id','=',$pedido->idUsuario)->get();
        $comidas = \App\Comida::all()->pluck('id','nombre');
        $estadosPedidos = \App\EstadoPedido::all();
        $elementosPedidos = \App\ElementoPedido::where('idPedido','=', $pedido->id)->get();
        
        $argumentos = array();
        
        $argumentos['pedido'] = $pedido;

        $argumentos['cuentaCliente'] = $cuentaCliente;
        $argumentos['comidas'] = $comidas;
        $argumentos['estadosPedidos'] = $estadosPedidos;
        $argumentos['elementosPedidos'] = $elementosPedidos;


        return view('pedidos.edit',$argumentos);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
