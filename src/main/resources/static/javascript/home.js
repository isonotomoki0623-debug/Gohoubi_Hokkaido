document.addEventListener('DOMContentLoaded', function() {
    const swiper = new Swiper('.mySwiper', {
        slidesPerView: 3,       // 画面に3つ表示
        spaceBetween: -10,       // 商品同士のすき間(px)
        loop: true,             // ループさせる

        // 矢印ボタンの設定
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },

        // レスポンシブ（スマホ・タブレット対応）
        breakpoints: {
            320: { slidesPerView: 1, spaceBetween: 10 }, // スマホは1枚
            768: { slidesPerView: 2, spaceBetween: 16 }, // タブレットは2枚
            1024: { slidesPerView: 3, spaceBetween: -8 } // PCは3枚
        }
    });
});
