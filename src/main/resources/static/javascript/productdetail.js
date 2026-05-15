//// メイン画像
//const mainImage =
//    document.getElementById("mainImage");
//
//// サムネイル一覧
//const thumbnails =
//    document.querySelectorAll(".thumbnail-image");
//
//thumbnails.forEach(thumbnail => {
//
//    // カーソルを乗せた時
//    thumbnail.addEventListener("mouseover", () => {
//
//        // data-image-path取得
//        const imagePath =
//            thumbnail.dataset.imagePath;
//
//        // メイン画像切り替え
//        mainImage.src = imagePath;
//
//    });
//
//});

document.addEventListener("DOMContentLoaded", () => {
    const mainImage = document.getElementById("mainImage");
    const thumbnails = document.querySelectorAll(".thumbnail-image");

    thumbnails.forEach(thumbnail => {
        thumbnail.addEventListener("mouseover", () => {
            const imagePath = thumbnail.dataset.imagePath;
            mainImage.src = imagePath;
        });
    });
});