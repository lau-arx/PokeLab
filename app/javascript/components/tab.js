const showTab = (event) => {
  const selectedContents = document.querySelectorAll(".content");
  const selectedTabs = document.querySelectorAll(".tab");
  if (event.currentTarget.classList.contains('tab-active') === false) {
    hideActive(selectedTabs)
    contentHidden(selectedContents)
    event.currentTarget.classList.add('tab-active');
    // event.currentTarget.insertAdjacentHTML('beforeend', '<hr>')
    selectedContents.forEach((content) => {
      if (content.attributes.id.value[8] === event.currentTarget.attributes.id.value[4]) {
        content.classList.add('displayed');
        content.classList.remove('hidden');
      };
    });
  };
}

const eventLog = (e) => {
  console.log(e)
}

const changeTabs = () => {
  const selectedTabs = document.querySelectorAll(".tab");
  if (selectedTabs) {
    selectedTabs.forEach((tab) => {
    tab.addEventListener('click', showTab);
    });
  }
};

const hideActive = (selectedTabs) => {
  selectedTabs.forEach((tab) => {
    tab.classList.remove('tab-active');
  })
}

const contentHidden = (selectedContents) => {
  selectedContents.forEach((content) => {
    content.classList.remove('displayed');
    content.classList.add('hidden');
  })
}

export { changeTabs };
