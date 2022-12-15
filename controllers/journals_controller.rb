get '/' do
  journals = recent_journals()
  user_id = []
  journals.each do |i|
    user_id.push find_user_by_id(i['user_id'])['first_name']
  end
  erb :'journals/index', locals: {
    journals: journals, 
    user_id: user_id
  }
end

get '/journals/all' do
  journals = all_journals()
  user_id = []
  journals.each do |i|
    user_id.push find_user_by_id(i['user_id'])['first_name']
  end
  erb :'journals/all', locals: {
    journals: journals, 
    user_id: user_id
  }
end

get '/journals/new' do
  # if !logged_in?
  #   redirect '/'
  # end

  erb :'journals/new'
end

post '/journals' do 
  # if !logged_in?
  #   redirect '/'
  # end
  
  location = params['location']
  date = params['date']
  other_instructor = params['other_instructor']
  new_students = params['new_students']
  injuries = params['injuries']
  drills = params['drills']
  notes = params['notes']
  image_url = params['image_url']
  user_id = session['user_id']

  create_journal(location, date, other_instructor, new_students, injuries, drills, notes, image_url, user_id)

  redirect '/'
end

get '/journals/:id/edit' do
  # if !logged_in?
  #   redirect '/'
  # end
  
  id = params['id']
  journal = get_journal(id)
  # journal.each do |i|
  #   puts i
  # end

  erb :'journals/edit', locals: {
    journal: journal
  }
end

put '/journals/:id' do
  # if !logged_in?
  #   redirect '/'
  # end
  
  id = params['id']
  location = params['location']
  date = params['date']
  other_instructor = params['other_instructor']
  new_students = params['new_students']
  injuries = params['injuries']
  drills = params['drills']
  notes = params['notes']
  image_url = params['image_url']

  update_journal(id, location, date, other_instructor, new_students, injuries, drills, notes, image_url)

  redirect '/'
end

delete '/journals/:id' do
  # if !logged_in?
  #   redirect '/'
  # end
  
  id = params['id']
  
  delete_journal(id)
  redirect '/'
end

post '/journals/:id/likes' do
  journal_id = params['id']
  user_id = session['user_id']

  toggle_like(user_id, journal_id)
  redirect '/'
end