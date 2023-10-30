import duckdb


con = duckdb.connect('main.db')

df = con.execute('DESCRIBE').df().name.to_list()

with open('raw_counts.txt', 'w') as file:
    for table in df:
        sql_q = f'SELECT COUNT(*) FROM {table}' 
        a = con.execute(sql_q).df().iloc[0,0]
        print(table, a)
        file.write(table +' ' + str(a) + '\n')


file.close()


