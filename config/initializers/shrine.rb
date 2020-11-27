require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"
 
s3_options = { 
  bucket:            ENV['S3_BUCKET'],
  region:            ENV['S3_REGION'],
  access_key_id:     ENV['S3_KEY'],
  secret_access_key: ENV['S3_SECRET']
}
 
Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", public: true, **s3_options), # temporary 
  store: Shrine::Storage::S3.new(public: true, **s3_options),                  # permanent 
}

Shrine.plugin :activerecord # or :activerecord 
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays 
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file 
Shrine.plugin :determine_mime_type, analyzer: :marcel
Shrine.plugin :store_dimensions
Shrine.plugin :pretty_location
Shrine.plugin :uppy_s3_multipart

Shrine.plugin :presign_endpoint, presign_options: -> (request) {
  # Uppy will send the "filename" and "type" query parameters
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition:    ContentDisposition.inline(filename), # set download filename
    content_type:           type,                                # set content type (defaults to "application/octet-stream")
    content_length_range:   0..(10*1024*1024),                   # limit upload size to 10 MB
  }
}


