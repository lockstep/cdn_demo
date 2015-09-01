class AddZencoderIdToFileUpload < ActiveRecord::Migration
  def change
    add_column :file_uploads, :zencoder_id, :integer
  end
end
