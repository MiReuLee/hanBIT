class Dog:
    def __init__(self, name="이름 없음", age=-1):
        self.name = name
        self.age = age

    def info(self):
        print("이름: {0}, 나이: {1}".format(self.name, self.age))

Dog().info()
Dog("멍멍이", 1).info()