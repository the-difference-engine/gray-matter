module DocumentHelper

  def delete_document
    document = Document.find_by_id(params[:document_id])
    tab = params[:tab].to_sym
    if document.destroy
      flash[:success] = 'Document Removed'
      redirect_to admins_path(tab: tab)
    else
      flash[:error] = 'Document was NOT Removed'
      render 'edit'
    end
  end

end
