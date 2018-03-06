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
    <form method="POST" action="{{ route('comidas.update',array('comidas'=>$comida->id)) }}">
        {{ csrf_field() }}
        <label>Nombre:</label>
        <input type="text" name="txtNombre" value="{{$comida->nombre}}">
        <label>Precio:</label>
        <input type="text" name="txtPrecio" value="{{$comida->precio}}">
        <button type="submit">Actualizar comida</button>
    </form>
</body>
</html>