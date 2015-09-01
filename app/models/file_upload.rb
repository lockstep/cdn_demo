class FileUpload < ActiveRecord::Base
  do_not_validate_attachment_file_type :secure_file
  has_attached_file :secure_file,
    url: ":s3_domain_url",
    path: 'secure_files/:id/:style_:basename_:hash.:extension',
    storage: :s3,
    bucket: ENV['S3_BUCKET'],
    s3_credentials: {
      access_key_id: ENV['S3_KEY'],
      secret_access_key: ENV['S3_SECRET']
    },
    s3_protocol: "https",
    hash_secret: 'semiuniquehash',
    s3_permissions: :private


  def encode!
    format = File.extname(secure_file_file_name)
    response = Zencoder::Job.create({
      input: self.secure_file.expiring_url,
      output: [{
        label: 'transcoded',
        url: self.secure_file.url(:transcoded)
      }]
    })
    update(zencoder_id: response.body['id'])
  end
end
