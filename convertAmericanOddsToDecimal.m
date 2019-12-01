function [decimal] = convertAmericanOddsToDecimal(decimal)
    decimal = str2num(decimal);
    if decimal > 0
        decimal = (decimal / 100) + 1;
    else
        decimal = (100 / decimal) + 1;
end

