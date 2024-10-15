%% 初始化
clc;
clear;
close all;
% 以区块为单位

%% 基础数据
tic
numqzxi = 1000;     % 群系数量
maxjuli = 50;       % 群系间距离最值
minjuli = 40;

qzxi = [1, 2, 3, 4, 5, 6];  % 群系编号

maxqzxidaxm = 60;   % 群系大小最值
minqzxidaxm = 30;

[x, y] = createpoints(numqzxi, maxjuli, minjuli);   % 生成群系中心坐标

kind_index = setkind(numqzxi, length(qzxi));        % 生成群系类型

map2d = spreadqzxi(x, y, kind_index, maxqzxidaxm, minqzxidaxm); % 生成二维地图

%% figure
figure(1);
hold on
scatter(x, y);
hold off

figure(2)
hold on
[mapx, mapy] = meshgrid(linspace(min(x)-maxqzxidaxm, max(x)+maxqzxidaxm, size(map2d, 1)), ...
                        linspace(min(y)-maxqzxidaxm, max(y)+maxqzxidaxm, size(map2d, 2)));

pcolor(mapx, mapy, map2d');
shading flat; % 使用flat shading，使得每个单元格内部颜色一致
colorbar; % 显示颜色条
colormap jet; % 使用jet颜色图
hold off
% 创建三维散点图并使用 z 值来着色
