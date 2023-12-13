function scheduleTasksDemo()
    % Define the task structure and processors
    tasks = [struct('processingTime', 5, 'requiredProcessors', [67, 7, 41, 65], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [50, 51, 23, 13, 54], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [55, 37, 18, 10], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [59, 61, 2, 16], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [47, 68], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [53, 18, 10, 12, 44], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [27, 23, 64], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [5, 55, 14, 23, 13, 54, 59, 61, 2, 16], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [57, 44, 45, 61, 2, 16, 70], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [45, 61], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [36, 14, 23, 13, 54, 56], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [48, 26, 19, 42, 21, 58, 28, 3, 9, 43, 24], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [69, 6, 14, 23, 13, 54, 56], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [38, 44, 45, 61], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [28, 3, 9, 43, 15], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [36, 14, 23, 13, 54, 59, 61, 2, 16, 46], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [48, 26, 19, 42, 21, 58, 28, 3, 9, 43, 66, 17], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [54, 59, 29], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [25, 30, 6, 37], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [31, 28, 3, 9, 43, 15], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [53, 39, 14, 23, 13], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [3, 9, 43, 37, 18, 73], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [35, 67, 7, 41, 47, 60], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [43], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [38, 44, 45, 58, 56], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [28, 3, 9, 43, 37], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [71, 18, 10], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [20, 62, 28, 3, 9, 43, 24], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [4, 32, 40, 22, 72], 'startTime', -1),
struct('processingTime', 2, 'requiredProcessors', [6, 37], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [51, 23, 13, 54, 59, 61, 2, 16, 46, 63], 'startTime', -1),
struct('processingTime', 5, 'requiredProcessors', [9, 43, 66], 'startTime', -1),
struct('processingTime', 4, 'requiredProcessors', [71, 39, 24], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [25, 27, 23, 64], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [33, 19], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [42, 49, 1], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [25, 27, 23, 13, 54, 8, 34], 'startTime', -1),
struct('processingTime', 1, 'requiredProcessors', [48, 26, 19, 42, 49], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [11, 32, 39, 66, 17], 'startTime', -1),
struct('processingTime', 3, 'requiredProcessors', [52, 23], 'startTime', -1),
            ];
    numProcessors = 73; % Total number of processors

    % Sort tasks based on processing time in descending order initially
    [~, sortIdx] = sort([tasks.processingTime], 'descend');
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
   %#createGanttChart1(tasks)
    % Call the Gantt chart function after all tasks are scheduled
    createGanttChart2(tasks,numProcessors);

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
function createGanttChart1(tasks)
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
    title('Longest First Task Schedule Gantt Chart for 40 connection request');
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

    title('Longest First Task Schedule Gantt Chart for 40 connection request');
    hold off;
end


