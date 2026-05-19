document.addEventListener("DOMContentLoaded", () => {

    // メイン画像切り替え
    const mainImage = document.getElementById("mainImage");

    const thumbnails =
        document.querySelectorAll(".thumbnail-image");

    thumbnails.forEach(thumbnail => {

        thumbnail.addEventListener("mouseover", () => {

            const imagePath =
                thumbnail.dataset.imagePath;

            mainImage.src = imagePath;
        });
    });

    // 星レビュー
    const starElements =
        document.querySelectorAll(".stars");

    starElements.forEach(starElement => {

        const rating =
            parseFloat(starElement.dataset.rating);

        let html = "";

        for (let i = 1;i <= 5;i++) {

            if (rating >= i) {

                html +=
                    '<i class="fa-solid fa-star"></i>';

            } else if (rating >= i - 0.5) {

                html +=
                    '<i class="fa-solid fa-star-half-stroke"></i>';

            } else {

                html +=
                    '<i class="fa-regular fa-star"></i>';
            }
        }

        starElement.innerHTML = html;
    });
});

document.getElementById("cartForm")
    .addEventListener("submit", async function(e) {

        e.preventDefault();

        const formData = new FormData(this);

        const response = await fetch("/cart/add", {
            method: "POST",
            body: formData
        });

        const result = await response.text();

        if (result === "ok") {

            showToast();

        } else {

            alert("追加に失敗しました");
        }

    });



function showToast() {

    const toast =
        document.getElementById("toast");

    toast.classList.add("show");

    setTimeout(() => {
        toast.classList.remove("show");
    }, 2000);
}