const pay = () => {
  const form = document.getElementById("charge-form");
  Payjp.setPublicKey("pk_test_265374d86ede432d93d074ce"); 
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    // console.log("フォーム送信時にイベント発火")
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_connection[hoge]"),
      cvc: formData.get("order_connection[hoge]"),
      exp_month: formData.get("order_connection[hoge]"),
      exp_year: `20${formData.get("order_connection[hoge]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
    
  });
};

window.addEventListener("load", pay);