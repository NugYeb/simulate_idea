function map2d = spreadqzxi(x, y, kind_index, maxdaxm, mindaxm, setedge)
    if nargin < 6
        setedge = 1;
    end

    num = length(kind_index);
    if num ~= length(x) || num ~= length(y)
        disp("Error! ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
    end

    map2d = zeros(max(x)-min(x)+2*maxdaxm, max(y)-min(y)+2*maxdaxm);

    for i = 1:1:num

        xindex = x(i)-maxdaxm : 1 : x(i)+maxdaxm;
        yindex = y(i)-maxdaxm : 1 : y(i)+maxdaxm;
        temppointsnum = length(xindex) * length(yindex);
        temppoints = zeros(temppointsnum, 2);

        tempnum = 0;
        for j = xindex
            for k = yindex
                tempnum = tempnum + 1;
                temppoints(tempnum, :) = [j, k];
            end
        end
        

        circleCenter = [x(i), y(i)];                % 圆心坐标
        circleRadius = randi([mindaxm, maxdaxm]);   % 圆的半径
        distances = sqrt(sum((temppoints - circleCenter).^2, 2));   % 计算每个点到圆心的距离
        for m = 1:1:length(distances)
            if setedge == 1
                s_distence = randi([mindaxm, maxdaxm]);
            else
                s_distence = circleRadius;
            end
            if distances(m)<s_distence
                tempmapx = temppoints(m, 1) - (min(x)-maxdaxm) + 1;
                tempmapy = temppoints(m, 2) - (min(y)-maxdaxm) + 1;
                map2d(tempmapx, tempmapy) = kind_index(i);
            end
        end

    end

end