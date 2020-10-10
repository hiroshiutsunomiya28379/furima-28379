function price (){
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("input", () => {
    const inputValue = document.getElementById("item-price").value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${Math.floor(inputValue * 0.1)}円`;
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = `${Math.floor(inputValue * 0.9)}円`;
  });
}

window.addEventListener('load', price);