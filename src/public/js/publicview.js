document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.btn-efecto').forEach(function(btn) {
    btn.addEventListener('mouseenter', function() {
      btn.classList.add('hovered');
    });
    btn.addEventListener('mouseleave', function() {
      btn.classList.remove('hovered');
    });
  });
});
