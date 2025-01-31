function hexColors = generateHexCodes()
    % Initialize variables
    numColors = 6;
    hexColors = cell(1, numColors);
    minDistance = 64; % Minimum perceptual distance between colors

    % Generate colors
    for i = 1:numColors
        while true
            % Generate a random color
            color = randi([0, 255], 1, 3);
            hexColor = sprintf('#%02X%02X%02X', color);

            % Check if the color is black or white
            if strcmp(hexColor, '#000000') || strcmp(hexColor, '#FFFFFF')
                continue;
            end

            % Check perceptual distance from existing colors
            if i > 1
                distances = zeros(1, i-1);
                for j = 1:i-1
                    distances(j) = sqrt(sum((color - hex2rgb(hexColors{j})).^2));
                end
                if min(distances) < minDistance
                    continue;
                end
            end

            % If the color is valid, add it to the list
            hexColors{i} = hexColor;
            break;
        end
    end
end

function rgb = hex2rgb(hex)
    % Convert hex color to RGB
    hex = hex(2:end); % Remove the '#'
    rgb = [hex2dec(hex(1:2)), hex2dec(hex(3:4)), hex2dec(hex(5:6))];
end

%Copyright 2025 Austin M. Weber