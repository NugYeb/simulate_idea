function [x, y] = createpoints(numqzxi, maxjuli, minjuli)

    x = zeros(1, numqzxi);
    y = zeros(1, numqzxi);
    nx = x(1);
    ny = y(1);

    svjiffwb = round(1.4*maxjuli);


    for ioi = 1:1:numqzxi-1
        tempjuli = 0;
        xffwb = [min(x) - svjiffwb, max(x) + svjiffwb];
        yffwb = [min(y) - svjiffwb, max(y) + svjiffwb];
        
        while tempjuli > maxjuli || tempjuli < minjuli
            nx = randi(xffwb);
            ny = randi(yffwb);

            tempjuli = min(sqrt(abs(x(1:ioi)-nx).^2 + abs(y(1:ioi)-ny).^2));
        end

        x(ioi+1) = nx;
        y(ioi+1) = ny;

        % disp(ioi+1);

    end


end