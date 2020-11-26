namespace :s3 do
    
  desc "move assets"
  task :move => :environment do
    s3 = Aws::S3::Resource.new(access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'], region: "ca-central-1")
    # get local attachments
    Attachment.all.each do |a|
      path = a.attachment.path
      if !File.file?(path)
        puts "NOT A FILE! #{path}".red
        next 
      end
      bucket = s3.bucket(ENV['S3_BUCKET'])
      puts bucket.inspect
      s3_path = "attachments" + path.split('attachments')[1]
      obj = bucket.object(s3_path)
      obj.put({acl: "public-read", body: path})
    end
  end

end
