const pay = () => {
  const form = document.getElementById("charge-form");
  Payjp.setPublicKey("pk_test_265374d86ede432d93d074ce"); 
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    // console.log("フォーム送信時にイベント発火")
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_connection[number]"),
      cvc: formData.get("order_connection[cvc]"),
      exp_month: formData.get("order_connection[exp_month]"),
      exp_year: `20${formData.get("order_connection[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;      }
    });

  });
};

window.addEventListener("load", pay);