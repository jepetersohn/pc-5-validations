get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :create_event
end

post '/events' do
  @new_event = Event.new(title: params[:title], organizer_name: params[:organizer_name], organizer_email: params[:organizer_email], date: params[:date])
  if @new_event.valid?
    @new_event.save
    redirect "events/#{@new_event.id}/show"
  else
    @errors = @new_event.errors.values
    erb :errors
  end
end
