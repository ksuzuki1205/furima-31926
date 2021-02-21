function fee (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const salesFee  = document.getElementById("add-tax-price");
    const salesProfit  = document.getElementById("profit");
    salesFee.innerHTML = Math.floor(itemPrice.value * 0.1).toLocaleString();
    salesProfit.innerHTML = (itemPrice.value - Math.floor(itemPrice.value * 0.1)).toLocaleString();
  });
}

window.addEventListener('load', fee);
