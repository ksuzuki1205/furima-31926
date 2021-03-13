const pay = () => {
  const form = document.getElementById("charge-form");
  Payjp.setPublicKey("pk_test_265374d86ede432d93d074ce"); // PAY.JPテスト公開鍵
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);