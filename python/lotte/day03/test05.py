def my_copy(a, b):
    f = open(b, "w", encoding="utf-8").write(open(a, encoding="utf-8").read())

my_copy("test01.txt", "test05.txt")