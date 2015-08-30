class FileUploadsController < ApplicationController

  def create
    FileUpload.create(file_upload_params)
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
