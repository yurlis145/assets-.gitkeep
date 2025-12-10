// Obtener el usuario almacenado en localStorage
const usuario = JSON.parse(localStorage.getItem("usuario"));

// Si no hay usuario guardado → redirige al login
if (!usuario) {
  window.location.href = "../index.html";
} else {
  // Si existe, mostrar el nombre en el elemento correspondiente
  const nombreElemento = document.getElementById("nombreUsuario");

  if (nombreElemento) {
    nombreElemento.textContent = usuario.nombre;
  }
}
