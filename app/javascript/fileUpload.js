
import 'uppy/dist/uppy.min.css'

import {
  Core,
  FileInput,
  Informer,
  ProgressBar,
  ThumbnailGenerator,
  AwsS3Multipart // for multipart
  // AwsS3 // for regular s3
} from 'uppy'

function fileUpload(fileInput) {
  const hiddenInput = document.querySelector('.upload-data'),
        imagePreview = document.querySelector('.upload-preview img'),
        imagePreviewArea = document.querySelector('.upload-preview'),
        formGroup = fileInput.parentNode,
        progress = document.querySelector('.progress-indicator')

  // remove our file input in favour of Uppy's
  formGroup.removeChild(fileInput)

  const uppy = Core({
      autoProceed: true,
    })
    .use(FileInput, {
      target: formGroup,
    })
    .use(Informer, {
      target: formGroup,
    })
    .use(ProgressBar, {
      target: progress,
    })
    .use(ThumbnailGenerator, {
      thumbnailWidth: 600,
    })
    .use(AwsS3Multipart, {
      companionUrl: '/',
    })
    //.use(AwsS3, {
    //  companionUrl: '/', // will call the presign endpoint on `/s3/params`
    //})

  uppy.on('thumbnail:generated', (file, preview) => {
    // show preview of the image using URL from thumbnail generator
    if (imagePreview) {
      imagePreview.src = preview
    } else {
      imagePreviewArea.innerHTML = '';
      let img = document.createElement('img')
      img.src = preview
      img.style.width = "280px"
      imagePreviewArea.appendChild(img)
    }
  })

  uppy.on('upload-success', (file, response) => {
    // construct uploaded file data in the format that Shrine expects
    const uploadedFileData = {
      // id: file.meta['key'].match(/^cache\/(.+)/)[1], // object key without prefix -- THIS IS FOR REGULAR UPPY
      id: response.uploadURL.match(/\/cache\/([^\?]+)/)[1], // extract key without prefix -- THIS IS FOR MULTIPART
      storage: 'cache',
      metadata: {
        size: file.size,
        filename: file.name,
        mime_type: file.type,
      }
    }

    // set hidden field value to the uploaded file data so that it's submitted
    // with the form as the attachment
    hiddenInput.value = JSON.stringify(uploadedFileData)
  })
}

export default fileUpload