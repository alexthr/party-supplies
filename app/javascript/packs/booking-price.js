let startDateInput = document.getElementById("booking_start_date");
let endDateInput = document.getElementById("booking_end_date");
let days = 0;
let total = document.getElementById("js-booking-total");
let price = total.dataset.price;

startDateInput.addEventListener("change", (e) => {
  let startDate = Date.parse(startDateInput.value);
  let endDate = Date.parse(endDateInput.value);
  days = calculateDays(startDate, endDate);
  let totalPrice = price * days;
  if (isNaN(totalPrice) || startDate > endDate) {
    total.innerHTML = "Please select correct dates";
  } else {
    total.innerHTML = `Total: ${totalPrice}€`;
  }
});

endDateInput.addEventListener("change", (e) => {
  let startDate = Date.parse(startDateInput.value);
  let endDate = Date.parse(endDateInput.value);
  days = calculateDays(startDate, endDate);
  let totalPrice = price * days;
  if (isNaN(totalPrice) || startDate > endDate) {
    total.innerHTML = "Please select correct dates";
  } else {
    total.innerHTML = `Total: ${totalPrice}€`;
  }
});

function calculateDays(start, end) {
  const diff = end - start;
  return diff / (1000 * 60 * 60 * 24);
}


