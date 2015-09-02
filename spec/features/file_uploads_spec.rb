feature 'File Uploads' do
  scenario 'uploading a secure file' do
    visit root_path
    allow_any_instance_of(Paperclip::Attachment)
      .to receive(:save).and_return(true)
    allow_any_instance_of(FileUpload).to receive(:encode!).and_return(true)
    attach_file 'secure_file', 'spec/fixtures/testupload.png'
    click_button('Upload')
    expect(page).to have_content('File uploaded')
    expect(page).to have_content "Upload #{FileUpload.first.id}"
  end
  scenario 'downloading a secure file' do
    file_upload = create(:file_upload)
    file_double = double
    allow(file_upload).to receive(:secure_file).and_return(file_double)
    expect(file_double).to receive(:expiring_url).and_return('secure.com')
    expect(FileUpload).to receive(:find).with(file_upload.id.to_s)
      .and_return(file_upload)
    visit root_path
    click_link 'Download'
  end
end
