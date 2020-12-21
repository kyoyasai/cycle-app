window.addEventListener("load", ()=>{
  const pullDownButton = document.getElementById("bar");
  const indicateButton = document.getElementById("pull-down");

  pullDownButton.addEventListener("click", ()=>{
    if (indicateButton.getAttribute("style") == "display: block;") {
      indicateButton.removeAttribute("style", "display: block;");
    } else {
      indicateButton.setAttribute("style", "display: block;");
    }
  });
});