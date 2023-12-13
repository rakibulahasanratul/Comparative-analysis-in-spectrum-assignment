algorithms = {'GA', 'LF', 'WF'};
requests_40 = [45, 37, 37];
requests_100 = [94, 69, 69];
figure;
numGroups = size(requests_40, 2); 
b = bar([requests_40; requests_100]', 'grouped');

x = NaN(2, numGroups);
for i = 1:length(b)
    x(i,:) = b(i).XEndPoints;
end

set(gca, 'xticklabel', algorithms)

xlabel('Algorithms')
ylabel('Highest spectrum indice')
title('Highest spectrum indices by Algorithm and Connection Requests')

legend({'40 Connection Requests', '100 Connection Requests'}, 'Location', 'northeast')

grid on

for i = 1:numGroups
    text(x(1,i), requests_40(i), num2str(requests_40(i)), 'vert', 'bottom', 'horiz', 'center');
    text(x(2,i), requests_100(i), num2str(requests_100(i)), 'vert', 'bottom', 'horiz', 'center');
end
