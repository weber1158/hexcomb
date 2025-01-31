function [r,g,b,score] = compareHexCodes(h1,h2)
 %Remove the '#' symbol, if present
 if h1(1) == '#'
   h1 = h1(2:end);
 end
 if h2(1) == '#'
   h2 = h2(2:end);
 end

 %Convert the hex codes into RGB triplets
 rgb1 = [hex2dec(h1(1:2)), hex2dec(h1(3:4)), hex2dec(h1(5:6))];
 rgb2 = [hex2dec(h2(1:2)), hex2dec(h2(3:4)), hex2dec(h2(5:6))];

 %Normalize RGB triplets and evaluate scores
 r = (1 - (abs( rgb1(1) - rgb2(1) ) / 255)) * 100;
 g = (1 - (abs( rgb1(2) - rgb2(2) ) / 255)) * 100;
 b = (1 - (abs( rgb1(3) - rgb2(3) ) / 255)) * 100;
 score = (r+g+b) / 3;
end

%Copyright 2025 Austin M. Weber