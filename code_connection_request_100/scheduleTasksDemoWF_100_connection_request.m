function scheduleTasksDemo()
    % Define the task structure and processors
    tasks = [struct('processingTime', 3, 'requiredProcessors', [15, 22], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [4], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [65, 62, 38, 82, 48, 34, 1, 78, 40, 73], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [1, 78, 40], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [42, 65, 62, 38, 82, 48, 34, 1, 78, 88, 50], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [16, 49, 18, 76, 61], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [11], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [19, 49, 33], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [78, 81], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [35, 62, 38, 43, 31], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [32, 11, 22], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [23, 27], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [37, 79, 64, 60, 16, 57], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [3, 80, 87, 41, 18, 76, 61, 74, 59], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [79, 64, 60, 16, 49, 18, 9], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [44, 51, 63, 72], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [19, 49, 33, 14, 91], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [44, 83, 24, 89, 87, 41, 18, 76, 61], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [71, 21, 5], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [78, 88], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [19], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [49, 18, 76, 61, 74, 59], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [21], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [37, 79], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [61, 69], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [45, 82], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [52, 71, 87, 41, 18, 9], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [48, 34, 1], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [28], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [32, 11, 55, 83, 24], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [29], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [75, 35, 62, 38, 82, 33, 14, 21], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [82, 48, 34, 1, 78, 81], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [77, 82, 33, 14], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [8, 71], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [32], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [75, 35, 62, 38, 82, 33, 14, 21, 5, 12], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [46, 86, 50], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [60, 16, 49, 18, 76, 61, 74, 59], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [31, 19, 34, 1, 78, 40, 10], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [53, 12, 86, 83, 92], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [71, 87, 41, 48, 90], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [34, 1, 78, 36], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [82, 48, 34], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [38, 82, 33, 14, 91, 28, 39, 15, 22], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [6, 58, 25, 60], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [1, 20, 52, 71], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [55], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [56], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [75, 35, 62, 38, 82, 48, 34, 1, 78], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [31, 19, 34, 1, 78, 40], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [42, 65, 62, 38, 82, 33, 14, 6, 13], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [84, 91], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [52, 2, 39], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [79, 64, 60], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [44, 83, 24, 89], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [65, 62, 38, 82, 33, 14, 85], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [25, 78, 81, 7], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [42, 65, 62, 38, 82, 33, 14, 21, 5], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [3, 80, 87, 41, 18, 9], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [78, 36], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [62, 38, 82, 48, 34, 1, 78, 36], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [33, 14, 21], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [77, 43, 31], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [53, 3, 80, 87, 41, 48], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [48, 34], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [62, 38, 82, 33, 14, 91, 28], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [23, 27, 79], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [52, 2, 39, 51], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [61, 74, 59], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [45, 82, 33, 14, 6], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [62, 38, 82, 33, 14, 21, 5, 54], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [53, 12, 68, 30, 47], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [53, 3, 80, 6], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [83, 24, 89, 87, 41], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [67, 17], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [46, 86, 83], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [62, 38, 82, 48, 34, 1, 78], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [32, 66, 64, 60], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [26, 70, 79, 64, 60, 16, 49, 18, 76, 61], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [84, 6, 58, 25, 60], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [68, 79, 64, 60, 16, 90], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [65, 62, 38, 82, 33, 14, 91, 28, 39], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [48, 34, 1, 78, 40, 73], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [37, 79, 64, 60, 16, 49, 18, 76, 61, 74, 59], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [83], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [23, 27, 79, 36], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [64, 60, 16, 49, 18, 76, 61, 74, 59], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [38, 82, 33, 14, 21], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [46, 63, 3, 80, 87, 41, 18], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [65, 62, 38, 82, 33, 14, 21], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [43, 31], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [34, 1, 20, 52], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [76, 61, 74], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [31, 19, 34, 1, 78, 88, 50], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [32, 11, 55, 83], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [62, 38, 82, 33, 14, 85], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [26, 70, 79, 64, 60, 16, 90], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [77, 82, 33, 14, 91, 28, 39, 15], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [79, 64, 60, 16, 57], 'startTime', -1),
            ];
    numProcessors = 92; % Total number of processors

    % Sort tasks based on processing time in descending order initially
    [~, sortIdx] = sort(cellfun(@length, {tasks.requiredProcessors}), 'descend');
    tasks = tasks(sortIdx);

    % Initialization
    inProgress = false(1, length(tasks));
    time = 0;
    finishedTasks = 0;
    isProcessorFree = true(1, numProcessors);

    % Main loop
    while finishedTasks ~= length(tasks)
        [tasks, inProgress, isProcessorFree, time] = scheduleTasks(tasks, inProgress, isProcessorFree, time);
        [inProgress, isProcessorFree, time, finishedTasks] = advanceTime(tasks, inProgress, isProcessorFree, time, finishedTasks);
    end

    % Call the Gantt chart function after all tasks are scheduled
    %createGanttChart(tasks);
    createGanttChart2(tasks, numProcessors);

    for i = 1:length(tasks)
        fprintf('Task %d starts at time %d\n', i, tasks(i).startTime);
    end
end

function [tasks, inProgress, isProcessorFree, time] = scheduleTasks(tasks, inProgress, isProcessorFree, time)
    for j = 1:length(tasks)
        % Check if the task has not started yet and if required processors are free
        if tasks(j).startTime == -1 && all(isProcessorFree(tasks(j).requiredProcessors))
            tasks(j).startTime = time;
            inProgress(j) = true; % Mark task as in progress
            isProcessorFree(tasks(j).requiredProcessors) = false;
        end
    end
end

function [inProgress, isProcessorFree, time, finishedTasks] = advanceTime(tasks, inProgress, isProcessorFree, time, finishedTasks)
    minFinishTime = inf;
    for j = 1:length(tasks)
        if inProgress(j)
            finishTime = tasks(j).startTime + tasks(j).processingTime;
            if finishTime > time && finishTime < minFinishTime
                minFinishTime = finishTime;
            end
        end
    end
    if minFinishTime < inf
        time = minFinishTime;
        for j = 1:length(tasks)
            if inProgress(j) && tasks(j).startTime + tasks(j).processingTime == time
                inProgress(j) = false;
                isProcessorFree(tasks(j).requiredProcessors) = true;
                finishedTasks = finishedTasks + 1;
            end
        end
    else
    end
end

function createGanttChart(tasks)
    figure;
    hold on;

    % Determine the number of tasks
    numTasks = length(tasks);
    
    % Plot each task
    for i = 1:numTasks
        start_time = tasks(i).startTime;
        duration = tasks(i).processingTime;
        % Create a rectangle for each task
        rectangle('Position', [start_time, i - 0.4, duration, 0.8], 'FaceColor', 'blue');
    end

    % Setting the axes and labels
    xlim([0, max([tasks.startTime] + [tasks.processingTime])]);
    ylim([0, numTasks + 1]);
    ylabel('Shortest Path with edge details (Total:40)');
    xlabel('Wavelength Assignment in each shortest path');
    set(gca, 'YTick', 1:numTasks, 'YTickLabel', arrayfun(@(x) sprintf('Task %d', x), 1:numTasks, 'UniformOutput', false));
    title('Widest First Task Schedule Gantt Chart');
    hold off;
end

function createGanttChart2(tasks, numProcessors)
    % Create a figure with appropriate size
    figure; % Adjusted for vertical layout

    hold on;

    % Initialize a color map for different tasks
    colors = jet(length(tasks));

    % Plot each task on each required processor
    for i = 1:length(tasks)
        start_time = tasks(i).startTime;
        duration = tasks(i).processingTime;
        for proc = tasks(i).requiredProcessors
            % Create a rectangle for each task on each processor, swapping x and y coordinates
            rectangle('Position', [proc - 0.4, start_time, 0.8, duration], 'FaceColor', colors(i, :));
        end
    end

    % Setting the axes and labels
    xlim([0, numProcessors + 1]);
    ylim([0, max([tasks.startTime] + [tasks.processingTime])]);
    xlabel('Link in the shortest Path');
    ylabel('Wavelength Assignment in each shortest path');

    set(gca, 'XTick', 1:numProcessors, 'XTickLabel', arrayfun(@(x) sprintf('P%d', x), 1:numProcessors, 'UniformOutput', false));

    title('Widest First Task Schedule Gantt Chart for 100 connection request');
    hold off;
end
