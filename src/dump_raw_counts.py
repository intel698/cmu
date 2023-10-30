import duckdb
#duckdb.sql('SELECT 42').show()

con = duckdb.connect('main.db')

a = con.execute("""select count (*) from bikedata""")

print("ok")
