function bspqux
k = 3;  % B样条的度
M = 100;  % 生成曲线的点数
u = [0 0 0 0 1 2 3 4 5 5 5 5];  % 调整后的节点向量

% 选择控制点，用于模拟耐克标志的形状
bx = [-1 -0.5 0 0.5 1 1.5 2];
by = [0 -1 -0.5 1 0.5 -0.5 -1];

% 设置权重，增强曲线的柔顺度
w = [1 1 2 2 2 1 1];

t = linspace(u(k+1), u(length(u)-k), M);
plot(bx, by, '-ok', 'LineWidth', 2);
hold on;

% 应用权重到控制点
bx = bx .* w;
by = by .* w;

yT = bytj(u, k, t);
rD = [bx; by] * yT ./ ([w * yT; w * yT]);

% 绘制加权B样条曲线
plot(rD(1, :), rD(2, :), 'b', 'LineWidth', 2);
axis equal;
hold off;

  function y = bytj(u, k, t)
    % 计算B样条基函数
    m = length(u);
    n = length(t);
    N = zeros(k + 1, n, m - 1);
    for i = 1:m - 1
      for j = 1:n
        if (t(j) - u(i)) >= 0 && (t(j) - u(i + 1)) < 0
          N(1, j, i) = 1;
        end
      end
    end
    if isequal(union(u(m - k:m), t(n)), t(n))
      N(1, n, m - k - 1) = 1;
    end
    for j = 2:k + 1
      for i = 1:m - j
        delt1 = u(i + j - 1) - u(i);
        delt2 = u(i + j) - u(i + 1);
        feizi1 = (t - u(i)) .* N(j - 1, 1:n, i);
        feizi2 = (u(i + j) - t) .* N(j - 1, 1:n, i + 1);
        N(j, 1:n, i) = (delt1 ~= 0) * feizi1 / delt1 + (delt2 ~= 0) * feizi2 / delt2;
      end
    end
    y = zeros(m - k - 1, n);
    for i = 1:m - k - 1
      y(i, :) = N(k + 1, 1:n, i);
    end
  end
end
