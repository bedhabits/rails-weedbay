// const counter = document.querySelector("#cart-count");

// // document.body.addEventListener('ajax:success', function(event) {
// //   counter.innerText = (event.detail[0]);
// // });

const cart = document.querySelector(".cart");
const cartDropdown = document.querySelector("#cart-dropdown");


cart.addEventListener('click', (event) => {
  if (cartDropdown.style.display === "none") {
    cartDropdown.style.display = "block";
  } else {
    cartDropdown.style.display = "none";
  }
});

