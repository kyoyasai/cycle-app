window.addEventListener("load", ()=>{
  const pullDownButton = document.querySelectorAll(".bar-btn");
  const indicateButton = document.querySelectorAll(".bar-contents");

  for ( let i = 0; i < pullDownButton.length; i++) {
    pullDownButton[i].addEventListener("click", () => {
      if (indicateButton[i].getAttribute("style") == "display: block;") {
        indicateButton[i].removeAttribute("style", "display: block;");
      } else {
        indicateButton[i].setAttribute("style", "display: block;");
      }
    });
  }
});