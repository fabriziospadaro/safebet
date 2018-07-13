// document.addEventListener("click", function(event){
//     console.log(event);
// });

function callback() {




  this.classList.toggle("bet-default");
  this.classList.toggle("bet-active");

  const current_element = this;
  console.log(current_element);

  const div_container = this.parentElement;
  const elements_a = div_container.querySelectorAll("a");
  // console.log(elements_a);

  Array.prototype.forEach.call(elements_a, function(el) {

  if (el !== current_element) {

    el.classList.remove("bet-active");
    el.classList.add("bet-default");
    // current_element.classList.add("bet-active");
  }


});

  // const elements_wrapper = document.querySelectorAll("div.bet-button-wrapper");
  // const buttons_wrapper = elements_wrapper[1].querySelectorAll("div.bet-button-wrapper");


}

const elements_default = document.querySelectorAll("a.bet-default");
// console.log(elements_default);

[].forEach.call(elements_default,function(e)

  {e.addEventListener('click',callback,false)

});
