function [resultsBoard, win]= updateResultsBoard( resultsBoard, secretCode, numGuess, guessedColors)
%updates the resultBoard with white and black pegs based on the player's guess
%Input: resultsBoard is a 10x4 numeric array with values 1 to 3
%       secretCode is a String of lenth 4 that has the secret code.
%       numGuess is an integer b/n 1 and 10 (player can have max of 10 guesses!)%                  
%
%       guessedColors is a 1x4 character array from the set BGOKPRTY
%           the mapping of the guessed colors 
%           Gray(A) = 1, Blue(B) = 2, Green(G) = 3; Orange(O) = 4, Pink(K) = 5, 
%           Purple(P) = 6, Red(R) = 7, Turquoise(8) = 8, Yellow(8) = 9
%
%Returns: the updated resultsBoard
%           the mappings on the resultsBoard
%           Gray is 1, Black Peg is 2, White Peg is 3
%         win is a boolean variable, true if code was guessed correctly false otherwise

colorMapping = {1, 'A';
    2, 'B';
    3, 'G';
    4, 'O';
    5, 'K';
    6, 'P';
    7, 'R';
    8, 'T';
    9, 'Y';
    };

%counter for all the colors
countForEachColor = zeros(1,length(colorMapping));

%*********************************
%check & update the BLACK pegs
%*********************************
blackPegsResult = (secretCode == guessedColors) ;
%update counters for the colors with black pegs
colorsFoundBlackPegs = guessedColors(blackPegsResult);
for i=1:length(colorsFoundBlackPegs)
    %find the number of the found colors in the Color Mapping
    numberForColor = find([colorMapping{:,2}] == colorsFoundBlackPegs(i));    
    countForEachColor(numberForColor) = countForEachColor(numberForColor) + 1;
end
numBlackPegs = length(colorsFoundBlackPegs);


%*********************************
%check for WHITE pegs
%*********************************
numWhitePegs = 0;
for i = 1:length(guessedColors)
    if ~blackPegsResult(i) %only where there is no black peg
        
        %search for the guessed color in the pattern
        ind = find( secretCode == guessedColors(i) );
        
        %the number of this particular color in the Color Mapping
        numberForColor = find([colorMapping{:,2}] == guessedColors(i));
        
        %the color was found in the pattern
        if ~isempty(ind)
            %if enough white white&black pegs have already been given for this color
            if countForEachColor(numberForColor) < length(ind)
                countForEachColor(numberForColor) = countForEachColor(numberForColor) + 1;
                numWhitePegs = numWhitePegs + 1;
            end
            
        end
    end
end

%determine the total number of black and white pegs
totPegs = numBlackPegs + numWhitePegs;
resultsBoard(numGuess,1:numBlackPegs) = 2; %place black pegs
resultsBoard(numGuess,numBlackPegs+1:totPegs) = 3; %place white pegs

%if there are 4 black pegs -- player has won the game!
win = (numBlackPegs == 4);

end

