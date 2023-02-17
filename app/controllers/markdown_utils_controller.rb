class MarkdownUtilsController < ApplicationController
  def upload
    raise unless params[:file].content_type.start_with?('image/')

    uploader = ImageUploader.new(params[:file])
    render json: { link: uploader.upload }
  rescue
    render json: { error: 'Something went wrong. You most likely added something that isn\'t an image' }
  end
end
