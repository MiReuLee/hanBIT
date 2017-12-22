class Parent:
    """부모 클래스"""
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def view_info(self):
        print("Name : {0}, Age : {1}".format(self.name, self.age))

    def character(self):
        print("smooth")


class Child(Parent):
    """자식 클래스"""
    def __init__(self, name, age, subject, st_id):
        Parent.__init__(self, name, age)
        self.subject = subject
        self.st_id = st_id

    def character(self):
        print("엄격하다")


p = Parent("홍판서", 33)
c = Child("홍길동", 22, "도술", 123456)
print("Parent-p : {0}".format(p.__dict__))
print("Child-p : {0}".format(c.__dict__))
p.view_info()
p.character()
c.view_info()
c.character()