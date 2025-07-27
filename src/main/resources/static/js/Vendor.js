// -------------------- Add to Cart --------------------

function addToCart(itemName, price, unit, quantity) {
  if (!quantity || isNaN(quantity) || quantity <= 0) {
    return alert("Please enter a valid quantity greater than 0.");
  }

  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  const index = cart.findIndex(i => i.name === itemName);
  if (index !== -1) {
    cart[index].qty += quantity;
  } else {
    cart.push({ name: itemName, price, unit, qty: quantity });
  }

  localStorage.setItem("cart", JSON.stringify(cart));
  alert("${itemName} added to cart.");
}


// -------------------- Load Materials (materials.html) --------------------

function loadMaterials() {
  const materials = [
    { name: "Potatoes", price: 20, unit: "kg" },
    { name: "Tomatoes", price: 25, unit: "kg" },
    { name: "Milk", price: 50, unit: "litre" }
  ];

  const container = document.getElementById("material-list");

  materials.forEach(item => {
    const card = document.createElement("div");
    card.className = "col-md-4";
    card.innerHTML = `
      <div class="card mb-3">
        <div class="card-body">
          <h5 class="card-title">${item.name}</h5>
          <p>₹${item.price} per ${item.unit}</p>
          <input type="number" class="form-control mb-2" id="qty-${item.name}" placeholder="Quantity">
          <button class="btn btn-primary w-100" onclick="addToCart('${item.name}', ${item.price}, '${item.unit}', parseInt(document.getElementById('qty-${item.name}').value))">
            Add to Cart
          </button>
        </div>
      </div>
    `;
    container.appendChild(card);
  });
}

// -------------------- Load Cart (cart.html) --------------------

function loadCart() {
  const cart = JSON.parse(localStorage.getItem("cart")) || [];
  const cartTable = document.getElementById("cart-table");
  const totalDisplay = document.getElementById("total");

  let total = 0;
  cart.forEach(item => {
    const itemTotal = item.qty * item.price;
    total += itemTotal;

    const row = document.createElement("tr");
    row.innerHTML = `
      <td>${item.name}</td>
      <td>${item.qty}</td>
      <td>${item.unit}</td>
      <td>₹${item.price}</td>
      <td>₹${itemTotal}</td>
    `;
    cartTable.appendChild(row);
  });

  totalDisplay.textContent = total;
}

// -------------------- Place Order (Dummy Submit) --------------------

function placeOrder() {
  const cart = JSON.parse(localStorage.getItem("cart")) || [];

  if (cart.length === 0) {
    alert("Cart is empty.");
    return;
  }

  const isCartValid = cart.every(item => item.qty && item.qty > 0 && !isNaN(item.qty));

  if (!isCartValid) {
    alert("One or more items in the cart have invalid quantity.");
    return;
  }

  // TODO: Send cart to backend here
  alert("Order placed successfully!");
  localStorage.removeItem("cart");
  window.location.href = "history.html";
}

function loadOrderHistory() {
  // ✅ Dummy data – you can replace this with fetch from backend later
  const dummyHistory = [
    {
      orderId: "ORD123",
      date: "2025-07-25",
      items: [
        { name: "Potatoes", qty: 5, unit: "kg", price: 20 },
        { name: "Tomatoes", qty: 3, unit: "kg", price: 25 }
      ]
    },
    {
      orderId: "ORD124",
      date: "2025-07-24",
      items: [
        { name: "Milk", qty: 2, unit: "litre", price: 50 }
      ]
    }
  ];

  const container = document.getElementById("order-history");
  container.innerHTML = "";

  dummyHistory.forEach((order, index) => {
    const total = order.items.reduce((sum, item) => sum + item.qty * item.price, 0);

    const itemRows = order.items.map(item => `
      <tr>
        <td>${item.name}</td>
        <td>${item.qty}</td>
        <td>${item.unit}</td>
        <td>₹${item.price}</td>
        <td>₹${item.qty * item.price}</td>
      </tr>
    `).join("");

    const card = document.createElement("div");
    card.className = "accordion-item mb-3";
    card.innerHTML = `
      <h2 class="accordion-header" id="heading${index}">
        <button class="accordion-button ${index !== 0 ? 'collapsed' : ''}" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${index}" aria-expanded="${index === 0}" aria-controls="collapse${index}">
          Order #${order.orderId} - ${order.date}
        </button>
      </h2>
      <div id="collapse${index}" class="accordion-collapse collapse ${index === 0 ? 'show' : ''}" aria-labelledby="heading${index}" data-bs-parent="#order-history">
        <div class="accordion-body">
          <table class="table table-bordered table-sm">
            <thead>
              <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Unit</th>
                <th>Price</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              ${itemRows}
            </tbody>
          </table>
          <div class="text-end fw-bold">Total: ₹${total}</div>
        </div>
      </div>
    `;
    container.appendChild(card);
  });
}