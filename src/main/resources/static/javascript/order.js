const useYes = document.getElementById("useCouponYes");
const useNo = document.getElementById("useCouponNo");
const couponList = document.getElementById("couponList");
const couponRadios = document.querySelectorAll(".coupon-radio");
const displayTotalPrice = document.getElementById("displayTotalPrice");

// 最初に現在のオリジナル金額を保持しておく
const originalPrice = displayTotalPrice.getAttribute("data-original-price");

function toggleCoupon() {
    if (useYes.checked) {
        couponList.style.display = "block";
        couponRadios.forEach(r => {
            r.disabled = false;
        });
    } else {
        couponList.style.display = "none";
        couponRadios.forEach(r => {
            r.checked = false;
            r.disabled = true;
        });
        // クーポンを使わない場合は、元の金額に戻す
        updatePriceDisplay(originalPrice);
    }
}

// 数字を 3桁カンマ区切り（1,000円）の形式にする便利関数
function formatPrice(price) {
    return Number(price).toLocaleString() + "円 (税込)";
}

// 画面の金額表示を書き換える関数
function updatePriceDisplay(price) {
    displayTotalPrice.textContent = formatPrice(price);
}

// ★ここが Ajax (Fetch API) の処理です！
function fetchDiscountedPrice(couponId) {
    // サーバーの窓口に「このクーポンIDだといくらになる？」と聞く
    const params = new URLSearchParams();
    if (couponId) {
        params.append("couponId", couponId);
    }

    fetch("/order/calculate-discount", {
        method: "POST",
        body: params,
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        }
    })
        .then(response => response.text())
        .then(discountedPrice => {
            // 戻ってきた割引後の金額で画面を書き換える！
            updatePriceDisplay(discountedPrice);
        })
        .catch(error => console.error("金額の計算に失敗しました:", error));
}

// イベントリスナーの設定
useYes.addEventListener("change", toggleCoupon);
useNo.addEventListener("change", toggleCoupon);

// クーポンのラジオボタンが選ばれたらAjaxを発動する
couponRadios.forEach(radio => {
    radio.addEventListener("change", () => {
        if (radio.checked) {
            fetchDiscountedPrice(radio.value);
        }
    });
});

// 初期化
toggleCoupon();