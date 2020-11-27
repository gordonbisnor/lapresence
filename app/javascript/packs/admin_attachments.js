import fileUpload from 'fileUpload'

// listen on 'turbolinks:load' instead of 'DOMContentLoaded' if using Turbolinks
document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.upload-file').forEach(fileInput => {
    fileUpload(fileInput)
  })
})