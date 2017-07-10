const selectCurrecy =  (baseCurrency, rates) => {
  return {
    type: "SWITCH_CURRENCY",
    baseCurrency: baseCurrency,
    rates: rates
  };
};

export default selectCurrecy;
