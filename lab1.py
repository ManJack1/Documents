# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# 定义粒子类


class Particle:
    def __init__(self, dim):
        self.position = np.random.rand(dim) * 20 - 10  # 初始化位置在[-10, 10]范围内
        self.velocity = np.random.rand(dim) - 0.5  # 初始化速度
        self.best_position = self.position.copy()  # 初始化个体最佳位置
        self.best_value = float('inf')  # 初始化个体最佳值

# 适应度函数，求解目标函数值


def fitness_function(x):
    return np.sum(x**2)  # 简单的平方和函数

# 粒子群优化算法


def pso(num_particles, dim, num_iterations):
    particles = [Particle(dim) for _ in range(num_particles)]  # 初始化粒子群
    global_best_position = np.random.rand(dim) * 20 - 10  # 初始化全局最佳位置
    global_best_value = float('inf')  # 初始化全局最佳值
    fitness_values = []  # 用于存储每次迭代的全局最优值

    for _ in range(num_iterations):
        for particle in particles:
            value = fitness_function(particle.position)  # 计算适应度值
            if value < particle.best_value:  # 更新个体最佳值和位置
                particle.best_value = value
                particle.best_position = particle.position.copy()
            if value < global_best_value:  # 更新全局最佳值和位置
                global_best_value = value
                global_best_position = particle.position.copy()

            # 更新速度和位置
            w = 0.5  # 惯性权重
            c1 = c2 = 1.5  # 学习因子
            r1 = r2 = np.random.rand(dim)  # 随机数
            cognitive = c1 * r1 * (particle.best_position - particle.position)
            social = c2 * r2 * (global_best_position - particle.position)
            particle.velocity = w * particle.velocity + cognitive + social
            particle.position += particle.velocity

        fitness_values.append(global_best_value)  # 记录全局最优值

    return global_best_position, global_best_value, fitness_values


# 运行粒子群优化算法
best_position, best_value, fitness_values = pso(
    num_particles=30, dim=2, num_iterations=200)
print(f"Best Position: {best_position}")
print(f"Best Value: {best_value}")

# 绘制适应度变化曲线
plt.figure(figsize=(14, 6))

plt.subplot(1, 2, 1)
plt.plot(fitness_values)
plt.title('适应度变化曲线')
plt.xlabel('迭代次数')
plt.ylabel('适应度值')

# 绘制三维函数图
x = np.linspace(-10, 10, 400)
y = np.linspace(-10, 10, 400)
X, Y = np.meshgrid(x, y)
Z = X**2 + Y**2

ax = plt.subplot(1, 2, 2, projection='3d')
ax.plot_surface(X, Y, Z, cmap='viridis', alpha=0.7)
ax.scatter(best_position[0], best_position[1],
           best_value, color='r', marker='o', s=100)
ax.set_title('三维适应度函数图')
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('适应度值')

plt.show()
