// Funcionalidad dropdown activities
const activities_index_init = () => {
  const btnFinalizados = document.querySelector('.btn-finalizados');
  const btnPendientes = document.querySelector('.btn-pendientes');
  const btnTodos = document.querySelector('.btn-todos');
  const divFinalizados = document.querySelector('.div-finalizados');
  const divPendientes = document.querySelector('.div-pendientes');
  const divTodos = document.querySelector('.div-todos');
  btnFinalizados.addEventListener('click', () => {
    divFinalizados.style.display = "block";
    divPendientes.style.display = "none";
    divTodos.style.display = "none";
    console.log("hola");
  });
  btnPendientes.addEventListener('click', () => {
    divPendientes.style.display = "block";
    divFinalizados.style.display = "none";
    divTodos.style.display = "none";
    console.log("hola");
  });
  btnTodos.addEventListener('click', () => {
    divTodos.style.display = "block";
    divPendientes.style.display = "none";
    divFinalizados.style.display = "none";
    console.log("hola");
  });
}

export { activities_index_init }
