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
      obj.put({acl: "public-read", body: File.read(path)})
    end
  end

  desc "others"
    attachment_data = [
      {id: 9,  file: "9.doc",   was: "Dépliant_LE_DEFI_D'ÊTRE_SOI-MËME_-_Nov__2014.doc"},
      {id: 44, file: "010.mp3", was: "010_-_Être_émerveillé.mp3"},
      {id: 45, file: "011.mp3", was: "011_-_Être_et_avoir_-_désidentification.mp3"},
      {id: 46, file: "012.mp3", was: "012_-_Conscience_témoin.mp3"},
      {id: 47, file: "013.mp3", was: "013_-_Apprécier_tout.mp3"},
      {id: 48, file: "014.mp3", was: "014_-_Horizontalité-Verticalité.mp3"},
      {id: 49, file: "015.mp3", was: "015_-_Être_présence.mp3"},
      {id: 50, file: "016.mp3", was: "016_-_Ni_pour_ni_contre.mp3"},
      {id: 53, file: "019.mp3", was: "019_-_S'ouvrir_à_ressentir.mp3"},
      {id: 54, file: "020.mp3", was: "020_-_Aucun_intérêt.mp3"},
      {id: 65, file: "052.mp3", was: "052_-_Baigner_dans_la_lumière.mp3"},
      {id: 69, file: "001.mp3", was: "001_-_Introduction_à_la_méditation.mp3"},
    ]
    ids = attachment_data.collect { |a| a[:id] }
    
    attachment_data.each do |data|
      attachment = Attachment.find data[:id]
      attachment.update(attachment_file_name: data[:file])
    end

    attachments = Attachment.where(id: ids)

    s3 = Aws::S3::Resource.new(access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'], region: "ca-central-1")
    # get local attachments
    attachments.each do |a|
      path = a.attachment.path
      if !File.file?(path)
        puts "NOT A FILE! #{path}".red
        next 
      end
      bucket = s3.bucket(ENV['S3_BUCKET'])
      puts bucket.inspect
      s3_path = "attachments" + path.split('attachments')[1]
      obj = bucket.object(s3_path)
      obj.put({acl: "public-read", body: File.read(path)})
    end
  end


end
