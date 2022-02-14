## Learning Vector Quantization

University course assignment to model a supervised classification algorithm LVQ in Matlab

[`lvqdata.csv`](lvqdata.csv) is the dataset used, containing 100 two-dimensional feature vectors, 50% belonging to class 1 and 50% to class 2. 

There are two different implementations the first [`LVQ_a.m`](LVQ_a.m) using 1 prototype to model each class and second [`LVQ_b.m`](LVQ_b.m) using 2 prototypes per class

The goal of this algorith is to model LVQ by optimising the positions of the prototypes using training. The initial position of a prototype is chosen at a random datapoint belonging to the corresponding class. The LVQ algorithm solves this problem by randomly introducing already classified datapoints and adjusting the position of the prototypes accordingly. More specifically, when a datapoint is introduced, the euclidean distances between it and each of the prototypes is compared. The closest prototype is called the ”winner”. That ”winner” prototype is moved directly towards the datapoint if they belong to the same class and directly away if they are not. The whole dataset is introduced in a arbitrarily to complete an epoch. At the end of an epoch, an error rate is calculated based on misclassified datapoints and the dataset is reintroduced in a different random error. The epochs stop when the error rate is stable and the prototypes do not change positions anymore.
