get '/' do
    journals = all_journals()
    erb :'journals/index', locals: {
      journals: journals
    }
end

get '/journals/new' do
  erb :'journals/new'
end

post '/journals' do 

  location = params['location']
  date = params['date']
  instructor_name = params['instructor_name']
  other_instructor = params['other_instructor']
  new_students = params['new_students']
  injuries = params['injuries']
  drills = params['drills']
  notes = params['notes']
  image_url = params['image_url']

  create_journals(location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url)

  redirect '/'
end