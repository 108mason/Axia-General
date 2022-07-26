"use strict";

function scrollFunction() {
  20 < document.body.scrollTop || 20 < document.documentElement.scrollTop ? document.querySelector("#myBtn").style.display = "block" : document.querySelector("#myBtn").style.display = "none"
}

function topFunction() {
  document.body.scrollTop = 0, document.documentElement.scrollTop = 0
}
window.onscroll = function() {
  scrollFunction()
};
