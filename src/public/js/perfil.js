document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll(".account.clickable").forEach(function(elem) {
    elem.addEventListener("click", function(event) {
      const url = event.currentTarget.dataset.url;
      if (url) {
        window.location.href = url;
      }
    });
  });
});
