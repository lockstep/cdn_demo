class FileUploadsController < ApplicationController
  def show
    @file = FileUpload.find(params[:id])
    response = Zencoder::Job.progress(@file.zencoder_id)
    @status = response.body['state']
  end

  def create
    @file = FileUpload.create(file_upload_params)
    @file.encode!

    redirect_to root_path, notice: 'File uploaded'
  end

  def download
    @file_upload = FileUpload.find(params[:id])
    # Redirect here if user is not permitted to download. Otherwise redirect
    # the client to a signed, expiring url.
    # EXAMPLE: redirect_to :back && return unless can? :view, @file_upload
    redirect_to @file_upload.secure_file.expiring_url(10)
  end

  private

  def file_upload_params
    params.permit(:secure_file)
  end
end
