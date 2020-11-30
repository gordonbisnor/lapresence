import fileUpload from 'fileUpload'
import $ from 'jquery'
import tippy from 'tippy.js'
import 'tippy.js/dist/tippy.css'

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.upload-file').forEach(fileInput => {
    fileUpload(fileInput)
  })
})

$('.copy-to-clipboard').on('click', function () {
  copyToClipboard(this);  
})
async function copyToClipboard(el) {
  let copyText = $(el)[0].nextElementSibling.value;
  let tip = tippy($(el)[0], {
    showOnCreate: true,
    content: 'Copied URL to clipboard!'
  });
  try {
    await navigator.clipboard.writeText(copyText);
  } catch (error) {
    console.error(error);
  }
}


