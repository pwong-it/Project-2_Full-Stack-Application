def all_journals
    run_sql('SELECT * FROM journals ORDER BY date DESC LIMIT 4')
end

def create_journal(location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url)
    run_sql("INSERT INTO journals(location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9)", [location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url])
end

def get_journal(id)
    run_sql('SELECT * FROM journals WHERE id = $1', [id])[0]
end

def update_journal(id, location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url)
    run_sql("UPDATE journals SET location = $2, date = $3, instructor_name = $4, other_instructor = $5, new_students = $6, injuries = $7, drills = $8, notes = $9, image_url = $10 WHERE id = $1", [id, location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url])
end

def delete_journal(id)
    run_sql("DELETE FROM journals WHERE id = $1", [id])
end

def post_like(user_id, journal_id)
    run_sql("INSERT INTO likes(user_id, journal_id) VALUES($1, $2)", [user_id, journal_id])
end