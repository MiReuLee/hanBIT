import tensorflow as tf

xData = [1, 2, 3, 4, 5, 6, 7]
yData = [25000, 55000, 75000, 110000, 128000, 155000, 180000]

W = tf.Variable(tf.random_uniform([1]))
b = tf.Variable(tf.random_uniform([1]))
X = tf.placeholder(tf.float32)
Y = tf.placeholder(tf.float32)
H = W * X + b

cost = tf.reduce_mean(tf.square(H - Y))

a = tf.Variable(0.01)
optimizer = tf.train.GradientDescentOptimizer(a)
train = optimizer.minimize(cost)
init = tf.global_variables_initializer()

sess = tf.Session()
sess.run(init)

for i in range(3001):
    sess.run(train, feed_dict={X: xData, Y: yData})
    if i % 500 == False:
        print(i, sess.run(cost, feed_dict={X: xData, Y: yData}))
        print("가중치: "+str(sess.run(W)), "바이어스: "+str(sess.run(b)))
        print("-" * 30)

print(sess.run(H, feed_dict={X: [1]})[0])
print(type(int(sess.run(H, feed_dict={X: [1]})[0])))

import matplotlib.pyplot as plt

plt.plot([
    int(sess.run(H, feed_dict={X: [0]})[0]),
    int(sess.run(H, feed_dict={X: [1]})[0]),
    int(sess.run(H, feed_dict={X: [2]})[0]),
    int(sess.run(H, feed_dict={X: [3]})[0])
])
plt.show()
