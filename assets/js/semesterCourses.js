frame2 = document.querySelector("html > frameset > frameset > frame:nth-child(2)");
frame2document=frame2.contentDocument;

el_semester = frame2document.querySelector("body > center > table > tbody > tr:nth-child(2) > td:nth-child(2) > a");

return el_semester;
