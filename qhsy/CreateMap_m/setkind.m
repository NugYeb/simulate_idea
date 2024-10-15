function kind_index = setkind(numqzxi, numkind)

    kind_index = zeros(1, numqzxi);

    for i = 1:1:numqzxi
        kind_index(i) = randi([1, numkind]);
    end

end