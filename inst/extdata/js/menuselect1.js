frame= document.querySelector("html > frameset > frameset > frame:nth-child(1)");
framedocument=frame.contentDocument;

var el_menu = framedocument.querySelector("#dm0m0i0it");

var event = new MouseEvent('mouseover', {
  'view': window,
  'bubbles': true,
  'cancelable': true
});

el_menu.dispatchEvent(event);
