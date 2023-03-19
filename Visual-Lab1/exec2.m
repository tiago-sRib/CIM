 clc;clear;close all;
addpath(".\Matlab scripts\");

N = [100 300 500];
factor = [1/3 1/2 2 3];

for n = 1:length(N)
    for f = 1:length(factor)
            orig = imzoneplate(N(n));
           [res1, res2] = ampliaReduz(N(n), factor(f));
    end
end