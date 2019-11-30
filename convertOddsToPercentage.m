function [percentage] = convertOddsToPercentage(odds)
    odds = str2num(odds);
    if odds > 0
        percentage = 100 ./ (odds + 100);
    else
        percentage = (-1 *odds) ./ ((-1 * odds) + 100);
    end
    %odds
    %percentage
end

