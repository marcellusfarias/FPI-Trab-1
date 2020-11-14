function imageOut = contrastStretching( imageIn, a, b, va, vb )
%	Does the constrast stretching with the parametrized values.

    imageOut = imageIn;

    % Primeiro, ele calcula os parâmetros alfa, beta e gama para não
    % haver descontinuidade. Como são funções lineares, também calcula o "b"
    % do padrão y = ax + b;
    
    alfa = va / a;                  % since VA = alfa*a;
    
    beta = (vb - va)/(b - a);       % since VA = a*beta + betaAux;
    betaAux = va - (a * beta);      % since VB = b*beta + betaAux;
    
    gama = (255 - vb) / (255 - b);  % since 255 = (gama*255) + gamaAux;
    gamaAux = (vb) - (b * gama);    % since 255 = (gama*255) + gamaAux;
    
    for i=0:(a-1)
        positionsLowerThanA = find(imageIn == i);
        imageOut(positionsLowerThanA) = i*alfa;
    end

    for i=a:(b-1)
        positionBetweenAandB = find(imageIn == i);
        imageOut(positionBetweenAandB) = beta*(i) + betaAux;
    end

    for i=b:255
        positionsHigherThanB = find(imageIn == i);
        imageOut(positionsHigherThanB) = (gama*i) + gamaAux;
    end
end

% OLDER VERSION
%function imageOut = constrastStretching( imageIn, a, b, alfa, beta, gama )
%	Does the constrast stretching with the parametrized values.

%    imageOut = imageIn;

%    for i=0:(a-1)
%        positionsLowerThanA = find(imageIn == i);
%        imageOut(positionsLowerThanA) = i*alfa;
%    end

%    for i=a:(b-1)
%        positionBetweenAandB = find(imageIn == i);
%        imageOut(positionBetweenAandB) = (beta*(i-a)) + (a*alfa);
%    end

%    for i=b:255
%        positionsHigherThanB = find(imageIn == i);
%        imageOut(positionsHigherThanB) = (gama*(i - b)) + ((beta*(b-a)) + (a*alfa));
%    end
%end

