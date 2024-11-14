<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Proyecto_ST.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Recursos/CSS/Style.css" rel="stylesheet" />
    <script src="../script.js"></script>

    <title>Inicio</title>
</head>
<body>
    <form id="formulario_index" class="form-control" runat="server">
        <div>
            <asp:Label ID="lblBienvenida" runat="server" Text="" CssClass="h3"></asp:Label>
        </div>
        <div>
            <asp:Button ID="BtnCerrar" runat="server" Text="Cerrar Sesion" CssClass="btn btn-dark" OnClick="BtnCerrar_Click"/>
        </div>
    </form>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Conjunto</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="cargarInfoUsuario()">Usuario</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="cargarCalificaciones()">Calificaciones</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Categoria-servicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Descuento</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Disponibilidad</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Más Opciones
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                        <a class="dropdown-item" href="#">Historial-actividad</a>
                        <a class="dropdown-item" href="#">Mensaje</a>
                        <a class="dropdown-item" href="#">Notificacion</a>
                        <a class="dropdown-item" href="#">Pagos-administracion</a>
                        <a class="dropdown-item" href="#">Preferencia-usuario</a>
                        <a class="dropdown-item" href="#">Rol</a>
                        <a class="dropdown-item" href="#">Servicio</a>
                        <a class="dropdown-item" href="#">Servicios_categoria</a>
                        <a class="dropdown-item" href="#">Solicitudes_servicio</a>
                        <a class="dropdown-item" href="#">Transaccion</a>
                        <a class="dropdown-item" href="#">Usuario-rol</a>
                        <a class="dropdown-item" href="#">Usuario servicio favorito</a>
                    </div>
                </li>
            </ul>
        </div>
       
    </nav>
    
    <div id="usuarioInfo" class="container mt-3" style="display:none;">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Información del Usuario</h5>
                <p><strong>Nombre:</strong> <span id="lblusuario"></span></p>
                <p><strong>Email:</strong> <span id="lblcontrasena"></span></p>
                <!-- Botones de acción -->
                <button class="btn btn-primary" onclick="editarUsuario()">Editar</button>
                <button class="btn btn-danger" onclick="eliminarUsuario()">Eliminar</button>
            </div>
        </div>
    </div>
   <!-- Contenedor para mostrar la lista de usuarios -->
<div id="usuariosInfo" class="container mt-3" style="display:none;">
    <!-- El contenido dinámico se generará aquí -->
</div>

    <div id="calificacionesInfo" class="container mt-3" style="display:none;">
    <!-- Aquí se generará el contenido dinámico -->
</div>


</body>
</html>

