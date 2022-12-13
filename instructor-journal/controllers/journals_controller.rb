get '/' do
    journals = all_journals()
    erb :'journals/index', locals: {
      journals: journals
    }
end
  