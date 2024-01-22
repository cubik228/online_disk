# spec/controllers/uploaded_files_controller_spec.rb

require 'rails_helper'

RSpec.describe UploadedFilesController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new uploaded file' do
        file_params = {
          name: 'example_file',
          attachment: 'test/tt'
        }

        expect {
          post :create, params: { uploaded_file: file_params }
        }.to change(UploadedFile, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end
  end
end