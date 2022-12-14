get '/' do
    journals = all_journals()
    erb :'journals/index', locals: {
      journals: journals
    }
end

get '/journals/new' do
  if !logged_in?
    redirect '/'
  end

  erb :'journals/new'
end

post '/journals' do 
  if !logged_in?
    redirect '/'
  end

  location = params['location']
  date = params['date']
  instructor_name = params['instructor_name']
  other_instructor = params['other_instructor']
  new_students = params['new_students']
  injuries = params['injuries']
  drills = params['drills']
  notes = params['notes']
  image_url = params['image_url']

  create_journal(location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url)

  redirect '/'
end

get '/journals/:id/edit' do
  if !logged_in?
    redirect '/'
  end
  
  id = params['id']
  journal = get_journal(id)

  erb :'journals/edit', locals: {
    journal: journal
  }
end

put '/journals/:id' do
  if !logged_in?
    redirect '/'
  end
  
  id = params['id']
  location = params['location']
  date = params['date']
  instructor_name = params['instructor_name']
  other_instructor = params['other_instructor']
  new_students = params['new_students']
  injuries = params['injuries']
  drills = params['drills']
  notes = params['notes']
  image_url = params['image_url']

  update_journal(id, location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url)

  redirect '/'
end

delete '/journals/:id' do
  if !logged_in?
    redirect '/'
  end
  
  id = params['id']
  
  delete_journal(id)
  redirect '/'
end

post '/journals/:id/likes' do
  journal_id = params['id']
  user_id = session['user_id']

  post_like(user_id, journal_id)
  redirect '/'
end