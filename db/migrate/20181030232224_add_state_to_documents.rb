class AddStateToDocuments < ActiveRecord::Migration[5.2]
  def change
  	add_column :documents, :state, :string
  end
end
