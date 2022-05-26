clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%% 设置地图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 设置地图大小
row=30;%行数
col=30;%列数
%% 设置障碍        1代表障碍物    0代表可自由行走区域
sign =  [    1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 1 1 1 1 0 0  
             1 1 1 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  
             1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1
             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 1
             1 1 0 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 1 
             1 1 0 0 0 1 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
             0 0 1 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1
             0 0 1 0 1 0 0 0 1 0 0 1 1 0 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1
             0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 1 1 1 1 1 0 1 1
             0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0
             0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
             0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
             1 0 0 0 1 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
             1 0 1 0 1 0 1 0 1 1 1 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0
             1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0
             1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
             1 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
             1 0 1 1 1 1 1 1 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
             0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
             1 0 0 0 1 1 0 0 1 1 0 0 0 1 0 0 0 1 1 1 0 0 1 1 1 0 0 0 0 0
             1 0 0 0 1 1 0 0 1 1 0 0 0 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 0
             1 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1
             1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1
             1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 1
             1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 1 1 1 0 0 0 1
             1 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 1 1 0 0 1 1 0 0 0 0 0 1
             1 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1  
             0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 0 1 0  ] ; 

sign=flipud(sign); %将数组从上向下翻转
%% 画障碍图
figure(1)
hold on
for i=1:row
    for j=1:col
        if sign(i,j)==1
            y=[i-1,i-1,i,i];
            x=[j-1,j,j,j-1];
            h=fill(x,y,'k');
            set(h,'facealpha',1) %填充颜色的透明度为1，颜色最深
        end
    end
end
axis([0 col 0 row])%限制图的边界
for i=1:row %画网格线
    plot([0 col],[i i],'k-');
end
for i=1:col
    plot([i i],[0 row],'k-');
end

%% 画起点和终点
%% 画起点
disp('请输入起点坐标')
[A(1),A(2)]=ginput(1);
pause(0.5)
A=fliplr(ceil(A));
disp('请输入终点坐标')
if sign(A(1),A(2))==1
    msgbox('起点在障碍上，请重新输入。')
    return
end
plot(A(2)-0.5,A(1)-0.5,'g^');
text(A(2)-0.5,A(1)-0.5+1,'S','fontsize',10')
%% 画终点
[B(1),B(2)]=ginput(1);
pause(0.5)
B=fliplr(ceil(B));
if sign(B(1),B(2))==1
    msgbox('终点在障碍上，请重新输入。')
    return
end
plot(B(2)-0.5,B(1)-0.5,'r^');
text(B(2)-1.5,B(1)-1.5,'T','fontsize',10')

%%%%%%%%%%%%%%%%%%%%%%%%%%以下为避障程序逻辑%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 主处理程序
startPoint=fliplr(A-0.5);%起点位置
finalPoint=fliplr(B-0.5);%目标位置
Katt=5;%计算引力需要的增益系数
Krep=15;%计算斥力的增益系数
stepSize=0.35;%步长
purposeDistance=1*stepSize;%当小车与目标点距离小于改值时，即认为到达目标
%如果不能实现预期目标，可能也与初始的增益系数，influenceDistance设置的不合适有关
obstaclePoint=[];%n个障碍物
for i=1:row
    for j=1:col
        if sign(i,j)==1
            obstaclePoint=[obstaclePoint;[j-0.5,i-0.5]];
        end
    end
end
obstacleNum=size(obstaclePoint,1);%障碍个数
obstacleR=0.8;%障碍物半径       
do=2*obstacleR;%计算斥力时障碍物影响距离           
nowPoint=startPoint;%循环初始，将车的起始坐标赋给now_point
route(1,:)=nowPoint;%route是保存车走过的每个点的坐标，刚开始先将起点放进该向量
j=1;
alphy=0.8;
beta=2;
tic;
while true %循环开始
    %% 引力计算
    Attract_x=Katt*(finalPoint(1)-nowPoint(1));%x方向上的引力
    Attract_y=Katt*(finalPoint(2)-nowPoint(2));%y方向上的引力
    dis_lin=norm(finalPoint-nowPoint);%当前点和终点的距离
    Attract_x=Attract_x/dis_lin^alphy;
    Attract_y=Attract_y/dis_lin^alphy;
    %% 斥力计算
    repulsion_x=0;%x方向上的斥力
    repulsion_y=0;%y方向上的斥力
    for i=1:obstacleNum
        dis_lin=norm(nowPoint-obstaclePoint(i,1:2));%路径点和障碍的距离
        if dis_lin<do%如果障碍和当前点的距离小于障碍影响距离
            repulsion_x=repulsion_x+Krep*(obstacleR/dis_lin)^beta*(obstaclePoint(i,1)-nowPoint(1));
            repulsion_y=repulsion_y+Krep*(obstacleR/dis_lin)^beta*(obstaclePoint(i,2)-nowPoint(2));
        end
    end
    %% 合力计算
    sum_x=Attract_x-repulsion_x;%x方向的合力
    sum_y=Attract_y-repulsion_y;%y方向的合力
    %% 局部最优判断
    if(j>2)%判断是否进入局部最优
        ifTrapped=norm(route(j,:)-route(j-2,:));
    end
    if(((j>2)&&(ifTrapped<stepSize/10))||((sum_x==0)&&(sum_y==0)&&(sum_z==0)))%第j步与第j-2步距离过近或者合力为0，则认为进入了局部最优值
        disp('进入死胡同')
        break
    end
    %% 确定下一个点的坐标
    nextPoint(1)=nowPoint(1)+stepSize*sum_x/(sum_x^2+sum_y^2)^0.5;
    nextPoint(2)=nowPoint(2)+stepSize*sum_y/(sum_x^2+sum_y^2)^0.5;
    plot([nowPoint(1),nextPoint(1)],[nowPoint(2),nextPoint(2)],'bo','LineWidth',1.5)
    drawnow%每plot一个点，就把该点更新在figure中
    nowPoint=nextPoint;
    j=j+1;
    route(j,:)=nowPoint;%把产生的路径点存储进route，以便最后计算路径长度
    %% 判断当前点是否为目标点
    dis_Goal=norm(nowPoint-finalPoint);%计算当前点与目标点距离
    if dis_Goal<purposeDistance %距离小于给定值，则认为到达目标点
        j=j+1;
        route(j,:)=finalPoint;%把终点添加到路径
        break;
    end 
end
%% 计算路径总距离，可用于与改进的人工势场法走过的路径做对比
dis=0;
for i=2:size(route,1)
    dis=dis+norm(route(i,:)-route(i-1,:));
end
disp(['总距离：',num2str(dis)])   
title('Intelligent Car Path Planning Diagram');
