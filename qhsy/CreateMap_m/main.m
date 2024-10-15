clc;
clear;
close all;
% 以区块为单位

tic
numqzxi = 100;
maxjuli = 20;
minjuli = 15;

qzxi = [1, 2, 3, 4, 5, 6];  % 

maxqzxidaxm = 15;
minqzxidaxm = 10;

[x, y] = createpoints(numqzxi, maxjuli, minjuli);
disp(toc)
kind_index = setkind(numqzxi, length(qzxi));

map2d = spreadqzxi(x, y, kind_index, maxqzxidaxm, minqzxidaxm);
disp(toc)

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
