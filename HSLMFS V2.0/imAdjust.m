function outputImage = imAdjust(inputImages)
%IMADJUST 输入一张图片，经过对比度调整后输出
        Idouble = im2double(inputImages);
        n = 4;
        avg1 = mean2(Idouble(:, :, 1));
        avg2 = mean2(Idouble(:, :, 2));
        avg3 = mean2(Idouble(:, :, 3));
        sigma1 = std2(Idouble(:, :, 1));
        sigma2 = std2(Idouble(:, :, 2));
        sigma3 = std2(Idouble(:, :, 3));
        gamma = exp(-(avg1 + avg2 + avg3)/3 +  (sigma1 + sigma2 + sigma3)/3);
        outputImage = imadjust(inputImages, ...
            [max(0,avg1-n*sigma1), max(0,avg2-n*sigma2), max(0,avg3-n*sigma3); ...
            min(avg1+n*sigma1, 1), min(avg2+n*sigma2, 1), min(avg3+n*sigma3, 1)],[], gamma);
end