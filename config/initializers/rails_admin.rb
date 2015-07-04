RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :user
     config.current_user_method(&:current_user)
  end

  RailsAdmin.config do |config|
    config.authorize_with do
      redirect_to main_app.root_path unless warden.user.is_admin
    end
  end



  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
