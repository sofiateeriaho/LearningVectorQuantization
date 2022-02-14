% Generate figure
f = figure('Name', 'Learning Vector Quantization');
f.Position(3:4) = [800 600];

% Read data
filename = 'lvqdata.csv';
file = load(filename);

Column1 = file(:,1);
Column2 = file(:,2);
Row1 = file(1,:);

% The dimension of input vectors
dim = length(Row1);

% The number of examples
size = length(Column1);

% Create new column with 50x 0s and 50x 1s (for class representation)
v = [0 1];
u = repelem(v,50)';

% Create new table
newTable = table(Column1, Column2, u);

% From table to matrix
data = newTable{:,:};

% (a) part of assignment: LVQ1 with one prototype per class
prototypes = create_prototypes(data);

% (b) part of assignment: LVQ1 with two prototypes per class
%prototypes = [create_prototypes(data);create_prototypes(data)];

% Specify epochs
epochs = 100;
lrate = 0.002;
error_array = [];

% Update prototypes
for i = 1:epochs
    prototypes = training(data, size, prototypes, lrate);
    error = update_error(data, size, prototypes);
    error_array(end+1) = error;
end

% Plot winning prototypes
p0 = prototypes([find(prototypes(:,3) == 0)], :);
p1 = prototypes([find(prototypes(:,3) == 1)], :);

plot_data(p0(:,1), p0(:,2), 'rp', 'class 0 winning prototype')
plot_data(p1(:,1), p1(:,2), 'bp', 'class 1 winning prototype')

% Generate separate figure for learning curve
f2 = figure('Name', 'Learning Curve');
figure(f2);

plot(error_array', '-', 'LineWidth', 1.3);
ylim([min(error_array) max(23, max(error_array))]);
title('Learning Curve One Prototype')
xlabel('Number of Epochs');
ylabel('Training Error in percentage');

%save('LVQ(a).mat')
