const API_URL = "http://127.0.0.1:8000";

// ==========================
//     VERIFICAR SESIÓN
// ==========================
const usuarioGuardado = JSON.parse(localStorage.getItem("usuario"));
if (usuarioGuardado) {
  const nombreElemento = document.getElementById("nombreUsuario");
  if (nombreElemento) {
    nombreElemento.textContent = usuarioGuardado.nombre;
  }
}

// ==========================
//         LOGIN
// ==========================
document.getElementById("loginForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const correo = document.getElementById("correo").value;
  const contrasena = document.getElementById("contrasena").value;

  try {
    const res = await fetch(`${API_URL}/login`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ correo, contrasena }),
    });

    const data = await res.json();

    if (!res.ok) {
      document.getElementById("loginMensaje").textContent =
        data.detail || "Error al iniciar sesión";
      document.getElementById("loginMensaje").style.color = "red";
      return;
    }

    // Login exitoso
    localStorage.setItem("usuario", JSON.stringify(data.usuario));

    alert("Login exitoso. Bienvenido " + data.usuario.nombre);

    if (data.usuario.tipo === "Administrador") {
      window.location.href = "html/admin.html";
    } else {
      window.location.href = "html/pagina.html";
    }

  } catch (error) {
    document.getElementById("loginMensaje").textContent =
      "No se puede conectar al servidor";
    document.getElementById("loginMensaje").style.color = "red";
    console.error(error);
  }
});

// ==========================
//   MODAL ABRIR / CERRAR
// ==========================
document.getElementById("abrirModal").addEventListener("click", () => {
  document.getElementById("modalCrearCuenta").style.display = "flex";
});

document.getElementById("cerrarModal").addEventListener("click", () => {
  document.getElementById("modalCrearCuenta").style.display = "none";
});

// ==========================
//      CREAR CUENTA
// ==========================
document.getElementById("crearCuentaForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const nuevoUsuario = {
    cedula: document.getElementById("cedulaNueva").value,
    nombre: document.getElementById("nombreNueva").value,
    correo: document.getElementById("correoNueva").value,
    contrasena: document.getElementById("contrasenaNueva").value,
    tipo: document.getElementById("tipoNueva").value,
  };

  try {
    const res = await fetch(`${API_URL}/usuarios`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(nuevoUsuario),
    });

    const data = await res.json();

    if (!res.ok) {
      document.getElementById("mensajeCrearCuenta").textContent =
        data.detail || "Error al crear cuenta";
      document.getElementById("mensajeCrearCuenta").style.color = "red";
      return;
    }

    // Cuenta creada
    document.getElementById("mensajeCrearCuenta").textContent =
      data.mensaje || "Cuenta creada correctamente";
    document.getElementById("mensajeCrearCuenta").style.color = "green";

    setTimeout(() => {
      document.getElementById("crearCuentaForm").reset();
      document.getElementById("modalCrearCuenta").style.display = "none";
      document.getElementById("mensajeCrearCuenta").textContent = "";
    }, 2000);

  } catch (error) {
    document.getElementById("mensajeCrearCuenta").textContent =
      "No se puede conectar al servidor";
    document.getElementById("mensajeCrearCuenta").style.color = "red";
    console.error(error);
  }
});
