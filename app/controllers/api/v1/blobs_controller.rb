class Api::V1::BlobsController < ApplicationController
  def show
    blob_name = params[:blob_name]
    blob, content = Azure::Storage::Blob::BlobService.create(
      blob_name: blob_name,
      container: Rails.application.config.storage_container
    ).get_blob(Rails.application.config.storage_container, blob_name)

    send_data content, type: blob.properties[:content_type], disposition: 'inline'
  end
end
