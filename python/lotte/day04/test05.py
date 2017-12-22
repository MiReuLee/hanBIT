try:
    f = open("a.txt")
except FileNotFoundError as e:
    print("오류 발생함")
    print(e)
else:
    print(f.read())
    f.close()
