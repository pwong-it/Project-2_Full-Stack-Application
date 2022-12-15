def recent_journals
    run_sql('SELECT * FROM journals ORDER BY date DESC LIMIT 6')
end

def all_journals
    run_sql('SELECT * FROM journals ORDER BY date DESC')
end

def create_journal(location, date, other_instructor, new_students, injuries, drills, notes, image_url, user_id)
    run_sql("INSERT INTO journals(location, date, other_instructor, new_students, injuries, drills, notes, image_url, user_id) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9)", [location, date, other_instructor, new_students, injuries, drills, notes, image_url, user_id])
end

def get_journal(id)
    run_sql('SELECT * FROM journals WHERE id = $1', [id])[0]
end

def update_journal(id, location, date, other_instructor, new_students, injuries, drills, notes, image_url)
    run_sql("UPDATE journals SET location = $2, date = $3, other_instructor = $4, new_students = $5, injuries = $6, drills = $7, notes = $8, image_url = $9 WHERE id = $1", [id, location, date, other_instructor, new_students, injuries, drills, notes, image_url])
end

def delete_journal(id)
    run_sql("DELETE FROM journals WHERE id = $1", [id])
end

def toggle_like(user_id, journal_id)
    likes = run_sql("SELECT * FROM likes WHERE user_id = $1 AND journal_id = $2", [user_id, journal_id])
    
    if likes.to_a.count > 0
        run_sql("DELETE FROM likes WHERE user_id = $1 AND journal_id = $2", [user_id, journal_id])
    else
        run_sql("INSERT INTO likes(user_id, journal_id) VALUES($1, $2)", [user_id, journal_id]) 
    end  
end

def check_likes(user_id, journal_id)
    likes = run_sql("SELECT * FROM likes WHERE user_id = $1 AND journal_id = $2", [user_id, journal_id])

    if likes.to_a.count > 0
        true
    else
        false
    end
end



