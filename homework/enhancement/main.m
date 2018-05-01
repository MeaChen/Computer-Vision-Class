function main
    pic = imread('underexposed.png');
    subplot(221),imshow(pic);
    title('ԭͼ��');
    pic=rgb2gray(pic);
    
    subplot(222),imhist(pic);
    title('ԭͼ���ֱ��ͼ');
    [height,width] = size(pic);
    sum=uint32(0);
    greys = zeros(1,256);
    for i=1:height
        for j=1:width
            sum = sum+uint32(pic(i,j));
            greys(pic(i,j)+1) = greys(pic(i,j)+1)+1;
        end
    end
    average = uint32(sum/(height*width*1.0));  
    pic2=pic;
    total1=0;
    for i=1:average
        total1 = total1+greys(i);
    end
    total2 = (width*height)-total1;
    %���ܶȺ���
    density1 = zeros(1,average);
    density2 = zeros(1,256-average);
    for i=1:average
        density1(i)=greys(i)/total1;
    end
    for i=(average+1):256
        density2(i-average)=greys(i)/total2;
    end
    
    %���ۻ��ֲ�����
    cdf1 = zeros(1,average);
    cdf2 = zeros(1,256-average);
    cdf1(1) = density1(1);   
    for i=2:average
        cdf1(i) = cdf1(i-1)+density1(i);
    end
    cdf2(1) = density2(1);
    for i=2:(256-average)
        cdf2(i) = cdf2(i-1)+density2(i);
    end
    %�������С�Ҷ�ֵ
    max=uint32(pic(1,1));
    min=uint32(pic(1,1));
    for i=1:height
        for j=1:width
            if(max<pic(i,j))
                max=uint32(pic(i,j));
            end
            if(min>pic(i,j))
                min=uint32(pic(i,j));
            end
        end
    end
    %����ͼ��Ҷ�ֵ
    for i=1:height
        for j=1:width
            if(pic(i,j)>=average)
                pic2(i,j) = cdf2(uint32(pic(i,j))-average+1)*(max-average)+average;
            else
                pic2(i,j) = cdf1(pic(i,j)+1)*(average-min)+min;
            end
        end
    end
    subplot(223),imshow(pic2);
    title('������ͼ��');
    subplot(224),imhist(pic2);
    title('������ͼ���ֱ��ͼ');
    