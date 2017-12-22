class General:
    instance_cnt = 0

    def __init__(self):
        General.instance_cnt += 1

    def view_instance_cnt(cls):
        print("Ins Cnt : ",
        cls.instance_cnt)

    class_view_instance_cnt = classmethod(view_instance_cnt)

g1 = General()
g2 = General()
g3 = General()
General.class_view_instance_cnt()
g1.class_view_instance_cnt()