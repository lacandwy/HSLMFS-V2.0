function inputImage = ColorThreshold(inputImages, UCT, LCT, Threshold)
        %UNTITLED 将图片调整颜色阈值，使输出的图片为二值图
        %   此处显示详细说明
        inputImages = imcomplement(inputImages);
        %调整阈值
        inputImages(inputImages > UCT) = 255;
        inputImages(inputImages <= LCT) = 0;
        %再次取反
        inputImages = imcomplement(inputImages);
        %调整阈值
        inputImages(inputImages >= Threshold) = 255;
        inputImages(inputImages < Threshold) = 0;
        inputImage = inputImages;
end