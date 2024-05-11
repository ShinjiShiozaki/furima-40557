ItemPrice.addEventListener("input", () => {
// 金額を入力した数値をpriceInputという変数に格納する
  const ItemPrice = document.getElementById("item-price");
  const AddTaxPrice = document.getElementById("add-tax-price");
  const Profit = document.getElementById("profit");
  const ItemPriceValue = ItemPrice.value;

  // 販売手数料の計算
  const AddTaxPriceValue =  Math.floor(ItemPriceValue / 10);
  const AddTaxPriceValue2 = AddTaxPriceValue.toLocaleString();
  AddTaxPrice.innerHTML = AddTaxPriceValue2;

  // 販売利益の計算
  const ProfitValue = Math.floor(ItemPriceValue - AddTaxPriceValue).toLocaleString();
  const ProfitValue2 = ProfitValue.toLocaleString();
  Profit.innerHTML = ProfitValue2;
})

