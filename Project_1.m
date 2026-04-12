clc;
clear;
close all;
%% --------------------------UNIPOLAR SIGNALING----------------------------
a = 4;
n = 100;
ensemble_uni = zeros(500,800);
for i = 1 : 500
data = randi([0,1],1,n);
tx = a * data;
tx_matrix = repmat(tx,8,1);
tx_column = reshape(tx_matrix,800,1);
ensemble_uni(i, :) = tx_column;
end
%% ------------------------POLAR NON RETURN TO ZERO------------------------
ensemble_NRZ = zeros(500,800);
for i = 1 : 500
data = randi([0,1],1,n);
tx = (( 2 * data ) - 1) * a;
tx_matrix = repmat(tx,8,1);
tx_column = reshape(tx_matrix,800,1);
ensemble_NRZ(i, :) = tx_column;
end