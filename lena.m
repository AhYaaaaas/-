% 读入lena图片
Lena = imread("C:/Users/gxy/Desktop/lena.bmp");
%显示lena
figure();
%获取lena的宽高
[h,w] = size(Lena);
%分区
%划分出 3 x 3的分区，第三个参数表示位置
subplot(3,3,1);
%显示图片
imshow(Lena);
%设置图片标题
title("原图");
%生成宽高分别位height和width的全零矩阵
cover = zeros(h,w,8);
%将lena图分成八个位平面
temp = Lena;
for k=1:8 %图层1-8
    %获取图像最后一层
    cover(:,:,k) = mod(temp,2);
    %移除图像最后一层
    temp = idivide(int32(temp),int32(2));
    subplot(3,3,k+1);
    imshow(cover(:,:,k));
    text = ['第',num2str(k),'个位平面'];
    title(text);
end
%读入barbara图片
Barbara = imread("C:/Users/gxy/Desktop/barbara.bmp");
figure();
%宽高和lena相同
subplot(3,3,1);
imshow(Barbara);
title("原图");
hideInfo = zeros(h,w,8);
temp = Barbara;
for k=1:8 %图层1-8
    %获取图像最后一层
    hideInfo(:,:,k) = mod(temp,2);
    %移除图像最后一层
    temp = idivide(int32(temp),int32(2));
    subplot(3,3,k+1);
    imshow(hideInfo(:,:,k));
    text = ['第',num2str(k),'个位平面'];
    title(text);
end

%用于展示嵌入图片后的图像
figure();
subplot(2,2,1);
imshow(Lena);
title("原图");
%保存嵌入后的图像
result = zeros(h,w,1);
%lena的最后一层用barbara替代
cover(:,:,1) = hideInfo(:,:,8);
for index=0:7
    result(:,:,1) = result(:,:,1) + sym(2^index)*cover(:,:,index+1);
end
subplot(2,2,2);
imshow(result,[]);
title("嵌入后的图像");

%嵌入的信息
info = zeros(h,w,1);
%获取嵌入后图像的最后一层
info(:,:,1) = mod(result,2) * sym(2^7);
subplot(2,2,3);
imshow(info,[]);
title("提取出来的图像");




