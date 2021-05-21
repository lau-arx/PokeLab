import Swal from 'sweetalert2';
import Rails from '@rails/ujs';

window.Swal = Swal;

// Behavior after click to confirm button
const confirmed = (element, result) => {
  if (result.value) {
    if (!!element.getAttribute('data-remote')) {
      let reloadAfterSuccess = !!element.getAttribute('data-reload');

      $.ajax({
        method: element.getAttribute('data-method') || 'GET',
        url: element.getAttribute('href'),
        dataType: 'm',
        success: function (result) {
          Swal.fire('Success!', result.message || '', 'success')
          .then((_result) => {
            if (reloadAfterSuccess) {
              window.location.reload(true);
            }
          });
        },
      });

      window.location.reload();
    } else {
      element.removeAttribute('data-confirm-swal');
      element.click();
      // window.location.reload(forcedReload);

    }
  }
};

// Display the confirmation dialog
const showConfirmationDialog = (element) => {
  const message = element.getAttribute('data-confirm-swal');
  const text = element.getAttribute('data-text');

  Swal.fire({
    title: message || 'Are you sure?',
    text: text || '',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes',
    cancelButtonText: 'Cancel',
  }).then(result => confirmed(element, result));
};

const allowAction = (element) => {
  if (element.getAttribute('data-confirm-swal') === null) {
    return true;
  }

  showConfirmationDialog(element);
  return false;
};

function handleConfirm(element) {
  if (!allowAction(this)) {
    Rails.stopEverything(element);
  }
}

Rails.delegate(document, 'a[data-confirm-swal]', 'click', handleConfirm);

