<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Comidas</title>
</head>
<body>
    <h1>Nueva comida</h1>
    <form method="POST" action="{{ route('comidas.store') }}">
        {{ csrf_field() }}
        <label>Nombre:</label>
        <input type="text" name="txtNombre">
        <label>Precio:</label>
        <input type="text" name="txtPrecio">
        <button type="submit">Agregar comida</button>
    </form>
</body>
</html>