const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar && window.location.pathname === "/") {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= document.querySelector(".banner").clientHeight) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}
export { initUpdateNavbarOnScroll };
