const selectedContents = document.querySelectorAll(".content");

console.log(selectedContents)

const selectedTabs = document.querySelectorAll(".tab");

const changeTabs = () => {
  selectedTabs.forEach((tab) => {
    tab.addEventListener('click', (event) => {
      if (event.currentTarget.classList.contains('tab-active') === false) {
        hideActive()
        contentHidden()
        event.currentTarget.classList.add('tab-active');
        // console.log(event.currentTarget.attributes.id.value[4])

        selectedContents.forEach((content) => {
          // console.log(content.attributes.id.value[8])
          if (content.attributes.id.value[8] === event.currentTarget.attributes.id.value[4]) {
            content.classList.add('displayed');
            content.classList.remove('hidden');
          };
        });
      };
    });
  });
};

const hideActive = () => {
  selectedTabs.forEach((tab) => {
    tab.classList.remove('tab-active');
  })
}

const contentHidden = () => {
  selectedContents.forEach((content) => {
    content.classList.remove('displayed');
    content.classList.add('hidden');
  })
}

export { changeTabs };
