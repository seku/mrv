require 'sinatra/partial'
require 'sinatra/base'
require 'haml'
require 'rubygems'
require 'pony'
require 'xml-sitemap'

class App < Sinatra::Base
  register Sinatra::Partial

  configure :production do
    require 'newrelic_rpm'
  end
  # enable :sessions
  #   use Rack::Flash, :sweep => true

  set :views, "app/views"
  set :haml, { :format => :html5 }

  enable :partial_underscores

  helpers do
    # def flash_types
    #     [:success, :notice, :warning, :error]
    #   end
    def content_for(key, &block)
      @content ||= {}
      @content[key] = capture_haml(&block)
    end
    def content(key)
      @content && @content[key]
    end
  end

  get '/' do
    haml :index
  end

  get '/products' do
    haml :_products
  end

  get '/special_series' do
    haml :_special_series
  end

  get '/racing_team' do
    haml :_racing_team
  end

  get '/contact' do
    haml :_contact
  end

  get '/distributors' do
    haml :_distributors
  end

  get '/fitment' do
    haml :_fitment
  end

  get '/' do
    erb :layout
  end

  get '/sitemap.xml' do
    map = ::XmlSitemap::Map.new('olbark.pl') do |m|
      m.add(:url => '/')
      m.add(:url => '/onas')
      m.add(:url => '/oferta')
      m.add(:url => '/kontakt')
    end

    headers['Content-Type'] = 'text/xml'
    map.render
  end

  post '/' do
    Pony.mail({
      :to => 'arkadiusz.olborski.olbark@gmail.com',
      :body => "Wiadomosc od: #{params[:email]}, o tresci: #{params[:body]}. Telefon: #{params[:phone]}",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'arkadiusz.olborski.olbark@gmail.com',
        :password             => ENV['PASSWORD'],
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      }
    })
    redirect '/'
  end
end
