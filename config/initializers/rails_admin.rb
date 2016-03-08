RailsAdmin.config do |config|

  config.authorize_with do
    authenticate_or_request_with_http_basic('Admin Panel') do |username, password|
      username == 'mrv' && password == 'mrv'
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
  end
end
