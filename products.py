import MySQLdb

conn = MySQLdb.connect("127.0.0.1", "fall18_it30", "m8kSinOD", "fall18_project_it30")

cur = conn.cursor()

dept = input("Enter Department ID: ")


cur.execute("""
SELECT name
FROM departments
WHERE parent_id=%s
""",(dept,))


if cur.rowcount == 0:
    cur.execute("""
    SELECT name
    FROM products
    WHERE department_id=%s
    """, (dept,))

for row in cur:
    print(row)


cur.close()

conn.close()
