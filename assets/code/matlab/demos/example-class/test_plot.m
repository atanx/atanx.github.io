rng(1.0);
D = rand(1,30);

figure
hold on
plot(D(1,:), '-o');
plot(D(1,:)+1, '-+');
plot(D(1,:)+2, '-diamond');
plot(D(1,:)+3, '-v');
plot(D(1,:)+4, '->');

legend('Day 1', 'Day 2', 'Day 3' , 'Day 4', 'Day 5');
