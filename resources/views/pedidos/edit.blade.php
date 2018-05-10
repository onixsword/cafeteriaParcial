@extends('layouts.default')
@section('content')
    <h1>Editar comida</h1>
    <a href="{{route('pedidos.index')}}"><h3>Volver a pedidos</h3></a>

    <h1>Actualizar pedido</h1>
        <form method="POST" action="{{route('pedidos.store')}}">
            {{csrf_field()}}
            <div class="form-group">
                
                <div class="row">
                    <div class="col-md-12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Usuario</th>
                                <th>Cantidad</th>
                                <th>Comida</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($elementosPedidos as $elementoPedido)
                                <tr>
                                    <td>{{$cuentaCliente->email}}</td>
                                    <td>{{$elementoPedido->cantidad}}</td>
                                    <td>{{$comidas[$pedido->idComida]->nombre}}</td>
                                    <td>
                                        <select>
                                            @foreach($estadosPedidos as $estadoPedido)
                                                <option value="{{$estadoPedido->id}}" @if($pedido->idEstadoPedido == $estadoPedido->id) {{'selected'}} @endif>
                                                    {{$estadoPedido->descripcion}}
                                                </option>
                                            @endforeach
                                        </select>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                        <input type="hidden" name="hdTotal" id="hdTotal" value="0">
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Enviar pedido</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    

    <!--
    <form method="POST" action="{{ route('comidas.update',array('comidas'=>$comida->id)) }}">
        {{ csrf_field() }}
        <input type="hidden" name="_method" value="PUT">
        <div class="form-group">
            <label class="form-label">Nombre:</label>
            <input class="form-control" type="text" name="txtNombre" value="{{$comida->nombre}}">
        </div>
        <div class="form-group">
            <label class="form-label">Precio:</label>
            <input class="form-control" type="text" name="txtPrecio" value="{{$comida->precio}}">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Actualizar comida</button>
        </div>
    </form>
    <form method="POST" action="{{route('comidas.destroy',array('comidas'=>$comida->id))}}">
        {{ csrf_field() }}
        <input type="hidden" name="_method" value="DELETE">
        <button type="submit" class="btn btn-danger">Borrar comida</button>
    </form>-->
@endsection
