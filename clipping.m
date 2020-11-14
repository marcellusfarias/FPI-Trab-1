function imageOut = clipping( imageIn, a, b )
%It's a kind of contrast stretching, where alfa and gama are equal to zero.
%   
    imageOut = imageIn;

    posLowerThanA = find(imageIn < a);
    imageOut(posLowerThanA) = 0;

    posHigherThanB = find(imageIn >= b);
    imageOut(posHigherThanB) = 255;

    % since it's a linear equation with type "y = ax + b",
    % I made an "y = alfa*x + beta" equation. We discover it to 
    % make the appropriated inclination between "a" and "b" parameters.
    alfa = 255/(b - a);
    beta = 255 - (b*alfa);

    for i=a:(b-1)
        positionsBetweenAandB = find(imageIn == i);
        imageOut(positionsBetweenAandB) = round((alfa*i) + beta);
    end
end

