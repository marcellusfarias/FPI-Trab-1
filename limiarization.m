function imageOut = limiarization( imageIn, T )
%   It's a kind of contrast stretching, where alfa and gama are equal to zero,
%   and "a" is equal to "b".

    imageOut = clipping(imageIn, T, T);
end

