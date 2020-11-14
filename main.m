function main(imageName, a, va, b, vb)
% Does the equalization and the constrast stretching of 2 grayscale images

    I = imread(imageName);
    dims = ndims(I);

    % if it's an rgb image, does the conversion to grayscale
    if(dims == 3)
        I = rgb2gray(I);
    end

    % Shows original image and original histogram
    figure, imshow(I);
    figure, imhist(I);   
    
    %a = 25;
    %va = 50;
    
    %b = 100;    
    %vb = 25;
    
    % CONTRAST STRETCHING
    imageOutConstrastStretching = contrastStretching(I, a, b, va, vb);
    figure, imshow(imageOutConstrastStretching);
    figure, imhist(imageOutConstrastStretching);

    % CLIPPING
    %imageOutClipping =clipping(I, a, b);
    %figure, imshow(imageOutClipping);

    % LIMIARIZACAO
    %imageOutLimiarization =limiarization(I, a);
    %figure, imshow(imageOutLimiarization);
    
    % EQUALIZATION
    imageOutEqualization = histEq(I);
    figure, imshow(imageOutEqualization);
    figure, imhist(imageOutEqualization);
end

