window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
priceInput.addEventListener('input', () => {
  const inputValue = priceInput.value;
  
  const addTaxDom = document.getElementById("add-tax-price");
  const value_result = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = value_result;

  const salesProfit = document.getElementById("profit");
  salesProfit.innerHTML = (inputValue - value_result);
});
});