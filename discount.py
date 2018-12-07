import MySQLdb

conn = MySQLdb.connect("127.0.0.1", "fall18_it30", "m8kSinOD", "fall18_project_it30")
conn.autocommit(True)
cur = conn.cursor()

prod = input("Enter Product ID: ")

cur.execute("""
SELECT name, discount
FROM products
WHERE id=%s
""",(prod,))

if cur.rowcount == 0:
    print("No such product")
else:
    for row in cur:
        print(row)

    newdisc = input("Enter new discount (empty for no change): ")
    if newdisc != "":
        print("Updated!")
        cur.execute("""
        UPDATE products
        SET discount=%s
        WHERE id=%s
        """, (newdisc,prod))
