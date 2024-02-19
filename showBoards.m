function showBoards( guessBoard, resultsBoard )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
load MastermindImagesSounds;

%Color Mapping  to numbers
%Guess Board: Gray = 1
%Blue = 2, Green = 3; Orange = 4, Pink = 5,
%Purple = 6,   Red = 7, Turquoise = 8, Yellow = 9

%Results Board: Gray =1
%Black Pegs = 2, White Pegs = 3

%Creating the image for the GuessBoard
[numRows,numCols] = size(guessBoard);
guessBoardImage = [];
for r=1:numRows
    aRow = [];
    for c=1:numCols
        %create a row
        aRow = [aRow [Colors{guessBoard(r,c)}]];
    end
    %add this row
    guessBoardImage = [guessBoardImage; aRow];
end

%Creating the image for the GuessBoard
[numRows,numCols] = size(resultsBoard);
resultsBoardImage = [];
for r=1:numRows
    aRow = [];
    for c=1:numCols
        %create a row
        aRow = [aRow [PegColors{resultsBoard(r,c)}]];
    end
    %add this row
    resultsBoardImage = [resultsBoardImage; aRow];
end

totBoardImage = [guessBoardImage, blackSpace, resultsBoardImage];
imshow(totBoardImage);
%play the sound
sound(clickSound,Fs);

end

