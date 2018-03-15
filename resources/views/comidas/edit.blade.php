<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Comidas</title>
</head>
<body>
    <h1>Editar comida</h1>
    <a href="{{route('comidas.index')}}">Volver a comidas</a>
    @if($exito)
        <p>La comida se actualizó</p>
    @endif
    <form method="POST" action="{{ route('comidas.update',array('comidas'=>$comida->id)) }}">
        {{ csrf_field() }}
        <input type="hidden" name="_method" value="PUT">
        <label>Nombre:</label>
        <input type="text" name="txtNombre" value="{{$comida->nombre}}">
        <label>Precio:</label>
        <input type="text" name="txtPrecio" value="{{$comida->precio}}">
        <button type="submit">Actualizar comida</button>
    </form>
    <form method="POST" action="{{route('comidas.destroy',array('comidas'=>$comida->id))}}">
        {{ csrf_field() }}
        <input type="hidden" name="_method" value="DELETE">
        <button type="submit">Borrar comida</button>
    </form>
</body>
</html>