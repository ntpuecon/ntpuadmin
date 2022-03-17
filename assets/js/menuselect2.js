frame2 = document.querySelector("html > frameset > frameset > frame:nth-child(2)");
frame2document=frame2.contentDocument;
el_menu_grades = frame2document.querySelector("#dm0m1i0it");
var event = new MouseEvent('mouseover', {
  'view': window,
  'bubbles': true,
  'cancelable': true
});
el_menu_grades.dispatchEvent(event);
