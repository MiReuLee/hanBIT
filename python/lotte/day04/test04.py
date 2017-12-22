# pip install pymysql
import pymysql

# 연결 형성
conn = pymysql.connect(host='localhost', user='hanbit',
                        password='hanbit', db='hanbit', charset='utf8')

# 연결 후 SQL 실행을 위한 객체: Cursor
cursor = conn.cursor()

# SQL 작성

sql = """select no, title, writer
            from tb_board
            order by no desc"""

# SQL 실행
cursor.execute(sql)

"""rows = cursor.fetchall()
rows = cursor.fetchmany(3)
rows = cursor.fetchone()

print(rows)"""

for row in cursor:
    print(row)

conn.close()

print("SQL 처리 성공")