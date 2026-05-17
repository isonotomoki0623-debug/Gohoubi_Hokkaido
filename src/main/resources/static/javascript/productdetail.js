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