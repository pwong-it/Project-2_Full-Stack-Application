def all_journals
    run_sql('SELECT * FROM journals ORDER BY id')
end