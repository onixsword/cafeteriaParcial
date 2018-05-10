@extends('layouts.default')

@section('content')
    @if(Auth::user()->idTipoUsuario == 2)
        <h1>Pedidos</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Total</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                @foreach($pedidos as $pedido)
                    <tr>
                        <td>{{$pedido->fecha}}</td>
                        <td>{{$pedido->total}}</td>
                        <td>{{$estadosPedido[$pedido->idEstadoPedido]}}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
    @if(Auth::user()->idTipoUsuario == 3)
        <h1>Pedidos</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Total</th>
                    <th>Estado</th>
                    <th>Accion</th>
                </tr>
            </thead>
            <tbody>
                @foreach($pedidos as $pedido)
                    <tr>
                        <td>{{$pedido->fecha}}</td>
                        <td>{{$pedido->total}}</td>
                        <td>{{$estadosPedido[$pedido->idEstadoPedido]}}</td>
                        <td>
                            <a href="{{route('pedidos.edit',$pedido->id)}}">
                                <button class="btn btn-primary">Editar</button>
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
@endsection