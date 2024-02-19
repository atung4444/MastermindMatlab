%  Name(s): Alan Tung
%  Email(s): actung@ncsu.edu
%  Date: 3/16/21
%  Lab Section(s)# 205
%  Project 2: Mastermind Game,  Spring 2021

%DO NOT CHANGE CODE from Line 7 to Line 27
clear; clc; close all;
figure('WindowStyle','docked');
warning('off','all'); % turns off all warning messages

%the size of the Guess Board
numTotGuesses = 10;
sizeColorGuess = 4;

fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');
fprintf('WELCOME TO THE MASTERMIND GAME!\n');
fprintf('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n');

%Color Mapping
%Gray = 1,   Blue = 2, Green = 3; Orange = 4
%Pink = 5, Purple = 6,   Red = 7, Turquoise = 8, Yellow = 9
%initialize the Boards & display them
guessBoard = ones(numTotGuesses,sizeColorGuess);
resultsBoard = ones(numTotGuesses,sizeColorGuess);
showBoards(guessBoard, resultsBoard);
%DO NOT CHANGE THE CODE ABOVE


%ADD YOUR CODE

generateCodeMakerPattern();