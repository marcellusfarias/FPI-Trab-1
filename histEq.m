function imageOut=histEq(imageIn)
%	Does the equalization of a histogram from an parametrized image.

    % Gets the size of the image
    [M,N]=size(imageIn);
    
    % Gets the original histogram.
    originalHistogram = imhist(imageIn);
    sizeOriginalHistogram = size(originalHistogram);

    % Gets the cumulative histogram.
    cumulativeHistogram = originalHistogram;
    for i=2:sizeOriginalHistogram
        cumulativeHistogram(i) = cumulativeHistogram(i-1) + originalHistogram(i);
    end

    equalizedHistogram = round((sizeOriginalHistogram(1,1)/(M*N))*cumulativeHistogram);

    imageOut = imageIn;
    % Does the equalization of the histogram
    for i=1:256
        positions=find(imageIn==i-1);
        imageOut(positions)=equalizedHistogram(i);
    end;

    %figure, imshow(imageOut)
end