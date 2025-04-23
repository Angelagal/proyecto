document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("searchInput");
  const tableRows = document.querySelectorAll(".custom-table tbody tr");

  // 🔎 Función de búsqueda
  searchInput.addEventListener("keyup", function () {
    const searchText = searchInput.value.toLowerCase();

    tableRows.forEach((row) => {
      const rowText = row.innerText.toLowerCase();
      row.style.display = rowText.includes(searchText) ? "" : "none";
    });
  });

  // 🔄 Ordenar columnas al hacer clic en los encabezados
  document.querySelectorAll(".custom-table th").forEach((header) => {
    header.addEventListener("click", function () {
      const columnIndex = Array.from(header.parentNode.children).indexOf(
        header
      );
      const rowsArray = Array.from(tableRows);

      rowsArray.sort((a, b) => {
        const cellA = a.children[columnIndex].innerText.trim();
        const cellB = b.children[columnIndex].innerText.trim();

        return isNaN(cellA) || isNaN(cellB)
          ? cellA.localeCompare(cellB)
          : cellA - cellB;
      });

      rowsArray.forEach((row) => row.parentNode.appendChild(row));
    });
  });

  // ✨ Animación en hover
  tableRows.forEach((row) => {
    row.addEventListener(
      "mouseover",
      () => (row.style.backgroundColor = "#d0d0d0")
    );
    row.addEventListener("mouseout", () => (row.style.backgroundColor = ""));
  });
});
