class MarkdownUtilsController < ApplicationController
  def upload
    raise unless params[:file].content_type.start_with?('image/')
    if Rails.env.test?
      render json: { link: test_image_url }
      return
    end
  
    # :nocov:
    # Nocov is okay here, because image uploader has separate tests
    uploader = ImageUploader.new(params[:file])
    render json: { link: uploader.upload }
    # :nocov:
  rescue
    render json: { error: 'Something went wrong. You most likely added something that isn\'t an image' }
  end
end
