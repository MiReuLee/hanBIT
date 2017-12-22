f1 = open("Shape.mp3", "rb")

f2 = open("test03.mp3", "wb")

f2.write(f1.read())

f1.close()
f2.close()