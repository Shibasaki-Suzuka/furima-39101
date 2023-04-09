function post (){
  const item_price = document.getElementById("item-price");
  item_price.addEventListener("keyup", () => {
    const taxVal = Math.floor(item_price.value / 10);
    const add_tax_price = document.getElementById("add-tax-price");
    add_tax_price.innerHTML = `${taxVal}`;
    
    const profitVal = Math.floor(item_price.value - taxVal);
    const profit = document.getElementById("profit");
    profit.innerHTML = `${profitVal}`;
  });
};
 
 window.addEventListener('load', post);