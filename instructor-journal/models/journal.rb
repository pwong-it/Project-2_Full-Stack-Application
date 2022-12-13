def all_journals
    run_sql('SELECT * FROM journals ORDER BY id')
end

def create_journals(location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url)
    run_sql("INSERT INTO journals(location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9)", [location, date, instructor_name, other_instructor, new_students, injuries, drills, notes, image_url])
end