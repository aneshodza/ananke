class MarkdownImageUploadController < ApplicationController
  def upload
    uploader = ImageUploader.new(params[:file])
    render json: { link: uploader.upload }
  rescue
    render json: { error: 'Something went wrong' }
  end
end
