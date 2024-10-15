function lineprobability = cline_prob(p)

    num = length(p);
    lineprobability = zeros(1, num);

    lineprobability(1) = p(1);
    for i = 2:1:num
        lineprobability(i) = lineprobability(i-1) + p(i);
    end
    
end