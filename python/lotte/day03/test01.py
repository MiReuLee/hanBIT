# f = open("test01.txt", "w", encoding="utf-8")
# f.write("파이썬은 간단하다.\n")
# f.write("Pytho is Simple\n")
# f.close()

# print("-" * 30)
# print("파일 쓰기 성공")

f = open("test01.txt", "r", encoding="utf-8")

print("-" * 30)
# print(f.read())
flist = f.readlines()
print(type(flist))
for s in flist:
    print(s, end="")

f.close()