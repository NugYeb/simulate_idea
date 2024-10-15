qzxi = ["苔原", "草原", "丛林", "针叶林", "落叶林", "雨林", "荒漠", "冻土", "水生生态"];

qzxi_q = ones(1, length(qzxi));
qzxi_p = cprobability(qzxi_q);
qzxi_l = cline_prob(qzxi_p);

figure(1)
plot(qzxi_l);