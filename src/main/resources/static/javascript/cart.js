document.querySelectorAll(".add-form").forEach(form => {

    form.addEventListener("submit", async function(e) {

        e.preventDefault();

        const formData = new FormData(form);

        await fetch("/cart/add", {
            method: "POST",
            body: formData
        });

        updateView(formData.get("productId"), 1);
    });

});

document.querySelectorAll(".subtract-form").forEach(form => {

    form.addEventListener("submit", async function(e) {

        e.preventDefault();

        const formData = new FormData(form);

        await fetch("/cart/subtract", {
            method: "POST",
            body: formData
        });

        updateView(formData.get("productId"), -1);
    });

});

function updateView(productId, change) {

    const qtyElement =
        document.getElementById("qty-" + productId);

    let qty = parseInt(qtyElement.innerText);

    qty += change;

    if (qty <= 0) {
        location.reload();
        return;
    }

    qtyElement.innerText = qty;

    // +ボタン取得
    const addButton =
        document.querySelector(
            `.add-form input[value="${productId}"]`
        ).parentElement.querySelector(".add-btn");

    // 在庫取得
    const stock =
        parseInt(addButton.dataset.stock);

    // ボタン制御
    addButton.disabled = qty >= stock;

    // 小計更新
    const subtotalElement =
        document.getElementById("subtotal-" + productId);

    const price =
        parseInt(subtotalElement.dataset.price);

    subtotalElement.innerText =
        (price * qty).toLocaleString() + "円";

    // 合計更新
    recalcTotal();
}

function recalcTotal() {

    let total = 0;

    document.querySelectorAll("[id^='subtotal-']")
        .forEach(el => {

            total += parseInt(
                el.innerText.replace(/[^0-9]/g, "")
            );
        });

    document.getElementById("total-price")
        .innerHTML =
        "<strong>合計：" +
        total.toLocaleString() +
        "円</strong>";
}