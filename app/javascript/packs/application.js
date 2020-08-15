// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

const Rails = require("@rails/ujs");
Rails.start();
require("turbolinks").start();
// require("@rails/activestorage").start()
// require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
document.addEventListener("change", (e) => {
  const target = e.target;
  if (
    target instanceof HTMLInputElement &&
    target.getAttribute("data-autosubmit") &&
    target.form
  ) {
    Rails.fire(target.form, "submit");
  }
});

document.addEventListener("dblclick", (e) => {
  const target = e.target;
  if (target.getAttribute("data-toggleedit")) {
    const li = target.closest("li");
    li.classList.add("editing");
    li.querySelector("input[type=text]").focus();
  }
});

document.addEventListener("blur", (e) => {
  console.log("blur");
  const target = e.relatedTarget;
  console.log(e.target, e.relatedTarget);
  if (target && target.getAttribute("data-toggleview")) {
    target.closest("li").classList.remove("editing");
  }
});
