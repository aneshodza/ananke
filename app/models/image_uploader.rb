# frozen_string_literal: true

class ImageUploader
  attr_accessor :file, :b64file

  def initialize(file, uid = ('a'..'z').to_a.sample(8).join)
    @file = file
    @uid = uid
    @b64file = @file.tempfile.read.dup
  end

  def upload
    s3_client.put_object(
      bucket: s3_bucket_name,
      key: digest,
      body: @b64file,
      content_type: @file.content_type,
      acl: 'public-read'
    )
    "https://#{s3_bucket_name}.s3.#{s3_bucket_region}.amazonaws.com/#{digest}"
  end

  private

  def s3_client
    Aws::S3::Client.new(
      region: s3_bucket_region,
      credentials: s3_credentials
    )
  end

  def s3_credentials
    Aws::Credentials.new(
      ENV.fetch('AWS_ACCESS_KEY_ID', nil),
      ENV.fetch('AWS_SECRET_ACCESS_KEY', nil)
    )
  end

  def s3_bucket_name
    ENV.fetch('AWS_S3_BUCKET', nil)
  end

  def s3_bucket_region
    ENV.fetch('AWS_REGION', nil)
  end

  def digest
    "#{Digest::SHA256.hexdigest(@b64file)}-#{@uid}"
  end
end
