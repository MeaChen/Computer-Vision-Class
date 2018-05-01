/*
 *ѧ�ţ�5140379003
 *��������Ľ��
 *�˳������SIFT�㷨
 */
#include "opencv2/core/core.hpp"  
#include "highgui.h"  
#include "opencv2/imgproc/imgproc.hpp"  
#include "opencv2/features2d/features2d.hpp"  
#include "opencv2/nonfree/nonfree.hpp" 
#include "opencv2/legacy/legacy.hpp"
#include <iostream>
#include <highgui.h>
#include <cv.h>
#include <cxcore.h>
#include <vector>
using namespace std;
using namespace cv;

int main(int argc, char** argv)
{
	//��ƥ�������ͼ�񣬴�img1��ʶ���img2  
	Mat img1 = imread("1.jpg");
	Mat img2 = imread("3.jpg");

	SIFT sift1, sift2;

	vector<KeyPoint> key_points1, key_points2;

	Mat descriptors1, descriptors2, mascara;

	sift1(img1, mascara, key_points1, descriptors1);
	sift2(img2, mascara, key_points2, descriptors2);

	BruteForceMatcher<L2<float>> matcher;
	vector<DMatch>matches;
	matcher.match(descriptors1, descriptors2, matches);  //������֮���ƥ��

	std::nth_element(matches.begin(),  matches.begin() + 29, matches.end());       
	matches.erase(matches.begin() + 30, matches.end());

	namedWindow("SIFT_matches");
	Mat img_matches;
	//�����ͼ���л���ƥ����  
	drawMatches(img1, key_points1,         //��һ��ͼ�������������  
		img2, key_points2,      //�ڶ���ͼ�������������  
		matches,       //ƥ��������  
		img_matches,      //ƥ�����ͼ��  
		Scalar(255, 255, 255));     //�ð�ɫֱ����������ͼ���е�������  
	imshow("SIFT_matches", img_matches);
	waitKey(0);
	return 0;
}

