const pay = () => {
    Payjp.setPublicKey("pk_test_29cfe2b95344123fecfe3c9d");
    const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyer_address[number]"),
      exp_month: formData.get("buyer_address[exp_month]"),
      exp_year: `20${formData.get("buyer_address[exp_year]")}`,
      cvc: formData.get("buyer_address[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden"> `;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
      document.getElementById("buyer_address_number").removeAttribute("name");
      document.getElementById("buyer_address_cvc").removeAttribute("name");
      document.getElementById("buyer_address_exp_month").removeAttribute("name");
      document.getElementById("buyer_address_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      });
    });
  };
  
  window.addEventListener("load", pay);