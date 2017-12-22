# pip install pymysql
import pymysql

# 연결 형성
conn = pymysql.connect(host='localhost', user='hanbit',
                        password='hanbit', db='hanbit', charset='utf8')

# 연결 후 SQL 실행을 위한 객체: Cursor
cursor = conn.cursor()

# SQL 작성

# 다중 입력
data = (
    ("파이썬1", "파이썬 1", "파이썬 1"),
    ("파이썬2", "파이썬 2", "파이썬 2"),
    ("파이썬3", "파이썬 3", "파이썬 3")
)

sql = "insert into tb_board(writer, title, content) values(%s, %s, %s)"

# SQL 실행
# cursor.execute(sql, ("파이썬", "파이썬", "파이썬"))
cursor.executemany(sql, data)

conn.commit()

print("SQL 처리 성공")