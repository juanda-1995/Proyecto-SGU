function cargarInfoUsuario() {
    $.ajax({
        type: "POST",
        url: "index.aspx/ObtenerInfoUsuario",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            const usuarios = JSON.parse(response.d);
            const contenedor = document.getElementById("usuariosInfo");
            contenedor.innerHTML = ''; // Limpiar el contenido anterior

            if (usuarios && usuarios.length > 0) {
                usuarios.forEach(usuario => {
                    const card = document.createElement("div");
                    card.className = "card mb-3";
                    card.innerHTML = `
                        <div class="usuario-info">
                            <p>Id: ${usuario.Id_usuario}</p>
                            <p>Nombre: ${usuario.Nombre}</p>
                            <p>Correo: ${usuario.Correo}</p>
                            <p>Direccion: ${usuario.Direccion}</p>
                            <p>Telefono: ${usuario.Telefono}</p>
                            <p>Edad: ${usuario.Edad}</p>
                            <button onclick="editarUsuario(${usuario.Id_usuario})">Editar</button>
                            <button onclick="eliminarUsuario(${usuario.Id_usuario})">Eliminar</button>
                        </div>`;
                    contenedor.appendChild(card);
                });
                contenedor.style.display = "block";
            } else {
                contenedor.innerHTML = "<p>No se encontraron usuarios.</p>";
                contenedor.style.display = "block";
            }
        },
        error: function (error) {
            console.log("Error al obtener la información del usuario:", error);
        }
    });
}

function cargarCalificaciones() {
    $.ajax({
        type: "POST",
        url: "index.aspx/ObtenerCalificaciones",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log("Datos recibidos:", response); // Para verificar la respuesta en la consola
            const calificaciones = JSON.parse(response.d);
            const contenedor = document.getElementById("calificacionesInfo");
            contenedor.innerHTML = ''; // Limpiar el contenido anterior

            if (calificaciones && calificaciones.length > 0) {
                calificaciones.forEach(calificacion => {
                    const card = document.createElement("div");
                    card.className = "card mb-3";
                    card.innerHTML = `
                        <div class="col-md-4">
                            <div class="card-body">
                                <h5 class="card-title">Calificación ID: ${calificacion.Id_calificacion}</h5>
                                <p class="card-text"><strong>ID Servicio:</strong> ${calificacion.Id_servicio}</p>
                                <p class="card-text"><strong>ID Usuario:</strong> ${calificacion.Id_usuario}</p>
                                <p class="card-text"><strong>Calificación:</strong> ${calificacion.Calificacion}</p>
                            </div>
                        </div>`;

                    contenedor.appendChild(card);
                });
                contenedor.style.display = "block";
            }
        },
        error: function (error) {
            console.log("Error al obtener las calificaciones:", error);
        }
    });
}





function editarUsuario() {
    // Lógica para editar usuario
    alert("Función para editar usuario.");
}

function eliminarUsuario() {
    // Lógica para eliminar usuario
    alert("Función para eliminar usuario.");
}