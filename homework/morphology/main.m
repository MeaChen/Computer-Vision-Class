% ѧ�ţ�5140379003 ��������Ľ�� 
% ʵ��erosion��dilation����̬ѧ����
% ˵�����Զ��������ļ�������ȡͼƬ������Ϊ�ṹԪ��
% ˵����ѡ��ͼƬ���ĵ���Ϊê�㣬��˲�֧��ͼƬ���ؾ���ĳ�����Ϊż����Ҳ��֧�ֳ��������Ŀ��ͼƬ�ĳ�����
% ˵�������Ϊ������ž������͡���ʴ������ͼƬ

function main
    %White = 0, black = 1
    pic = imread('lena-binary.bmp');
    s=input('������ͼƬ���ƣ�','s');
    SE = imread(s);
    
    [height,width]=size(pic);
    re1 = dilation(pic,SE);
    imwrite(re1,'dilation.bmp','bmp');
    re2 = erosion(pic,SE);
    imwrite(re2,'erosion.bmp','bmp');

end