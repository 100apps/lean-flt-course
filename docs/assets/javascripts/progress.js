document$.subscribe(() => {
  const boxes = document.querySelectorAll("input[data-course-step]");
  boxes.forEach((box) => {
    const key = `lean-flt-course:${box.dataset.courseStep}`;
    box.checked = localStorage.getItem(key) === "done";
    box.addEventListener("change", () => {
      if (box.checked) {
        localStorage.setItem(key, "done");
      } else {
        localStorage.removeItem(key);
      }
    });
  });
});

