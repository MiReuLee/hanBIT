with open("test01.txt", encoding="utf-8") as f:
    print(f.read())
    print(f.closed)

print(f.closed)