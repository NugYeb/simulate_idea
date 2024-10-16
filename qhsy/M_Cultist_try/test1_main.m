function test1_main()
    % 初始化游戏参数
    snakeLength = 5;
    snake = zeros(snakeLength, 2);
    food = [];
    score = 0;
    speed = 0.1;
    direction = 'right';
    
    % 创建图形窗口
    figure;
    set(gcf, 'Position', [100 100 400 400]);
    axis([1 40 1 40]);
    axis off;
    hold on;
    
    % 创建蛇的初始位置
    for i = 1:snakeLength
        snake(i,:) = [i, 1];
    end
    
    % 创建食物
    generateFood(snake);
    
    % 更新游戏状态
    while true
        updateSnake();
        pause(speed);
        
        % 检查游戏是否结束
        if isGameOver(snake)
            break;
        end
        
        % 更新分数
        score = length(snake) - snakeLength;
        title(['Score: ' num2str(score)]);
    end
    
    % 游戏结束提示
    text(20, 20, 'Game Over!', 'FontSize', 18, 'HorizontalAlignment', 'center');
    pause(3); % 暂停几秒钟后关闭窗口
    close(gcf);
end

function generateFood(snake)
    % 生成食物的位置
    food = [randi([1, 40]), randi([1, 40])];
    while any(all(snake == food, 2))
        food = [randi([1, 40]), randi([1, 40])];
    end
    rectangle('Position', [food(1)-0.5, food(2)-0.5, 1, 1], 'FaceColor', 'r');
end

function updateSnake()
    global direction;
    
    % 处理键盘输入
    if waitforbuttonpress(0, 'Escape')
        return;
    elseif waitforbuttonpress(0, 'Up')
        direction = 'up';
    elseif waitforbuttonpress(0, 'Down')
        direction = 'down';
    elseif waitforbuttonpress(0, 'Left')
        direction = 'left';
    elseif waitforbuttonpress(0, 'Right')
        direction = 'right';
    end
    
    % 更新蛇的位置
    switch direction
        case 'up'
            snake = [snake(1,:) - [0 1]; snake(1:end-1,:)];
        case 'down'
            snake = [snake(1,:) + [0 1]; snake(1:end-1,:)];
        case 'left'
            snake = [snake(1,:) - [1 0]; snake(1:end-1,:)];
        case 'right'
            snake = [snake(1,:) + [1 0]; snake(1:end-1,:)];
    end
    
    % 检查是否吃到食物
    if all(snake(1,:) == food)
        score = score + 1;
        generateFood(snake);
    else
        snake(end,:) = [];
    end
    
    % 清除旧的蛇身
    clearObjects;
    
    % 绘制新的蛇身
    for i = 1:length(snake)
        rectangle('Position', [snake(i,1)-0.5, snake(i,2)-0.5, 1, 1], 'FaceColor', 'g');
    end
end

function clearObjects
    % 清除所有的图形对象
    cla;
    axis([1 40 1 40]);
    axis off;
    hold on;
    generateFood(snake);
end

function tf = isGameOver(snake)
    % 检查游戏是否结束
    head = snake(1,:);
    if any(head < 1 | head > 40) || ...
       any(all(snake(1:end-1,:) == head, 2))
        tf = true;
    else
        tf = false;
    end
end