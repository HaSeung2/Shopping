const swiper = new Swiper(".swiperC", {
  loop: true,
  slidesPerView: 1,
  centeredSlides: true,

  pagination: {
    el: ".mainbanner-pagination",
  },
  autoplay: {
    delay: 5000,
  },

  navigation: {
    nextEl: ".mainbanner-button-next",
    prevEl: ".mainbanner-button-prev",
  },
});
/*const swiper2 = new Swiper(".swiper-container", {
	loop: false,
	slidesPerView: 5,
	spaceBetween: 10,
	
});*/