// supplier-script.js

document.addEventListener('DOMContentLoaded', () => {
  // Dashboard logic
  if (document.getElementById('order-count')) {
    document.getElementById('order-count').textContent = '5';
    document.getElementById('material-count').textContent = '12';
  }

  // Manage Raw Materials page
  const form = document.getElementById("materialForm");
  const nameInput = document.getElementById("materialName");
  const typeInput = document.getElementById("materialType");
  const qtyInput = document.getElementById("materialQty");
  const tableBody = document.querySelector("#materialTable tbody");

  if (form && nameInput && typeInput && qtyInput && tableBody) {
    form.addEventListener("submit", function (e) {
      e.preventDefault();

      const name = nameInput.value.trim();
      const type = typeInput.value.trim();
      const qty = qtyInput.value.trim();

      if (name === "" || type === "" || qty === "") {
        alert("Please fill in all fields.");
        return;
      }

      const row = document.createElement("tr");

      row.innerHTML = `
        <td>${name}</td>
        <td>${type}</td>
        <td>${qty}</td>
      `;

      tableBody.appendChild(row);
      form.reset();
    });
  }
});