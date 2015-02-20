module TrafficSpy
  class Server < Sinatra::Base
    get '/' do
      erb :index
    end

    not_found do
      erb :error
    end

    post '/sources' do

    	user = User.new(params[:sources])
    	case
    	when user.save
    		status 200
    		body 'success'
    	else
    		status 400
    		body "#{user.errors.full_messages.join(', ')}"
    	end
    end

    post '/sources/:identifier/data' do |identifier|
      puts params
      @user = User.find_by(:identifier == identifier)
      puts "user is #{@user}"
      puts "lets make a payload with payload params #{params["payload"]}"
      binding.pry
    	@user.payloads.create(params["payload"])
    end
  end
end
