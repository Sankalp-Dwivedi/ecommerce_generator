RailsAdmin.config do |config|

  config.model 'Product' do
    list do
      include_all_fields
    end

    edit do
      include_all_fields
    end
  end


  config.actions do
    dashboard # mandatory
    index     # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
  end
end
