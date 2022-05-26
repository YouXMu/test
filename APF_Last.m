clc
clear
close all

%%%%%%%%%%%%%%%%%%%%%%%%%% ���õ�ͼ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ���õ�ͼ��С
row=30;%����
col=30;%����
%% �����ϰ�        1�����ϰ���    0�����������������
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

sign=flipud(sign); %������������·�ת
%% ���ϰ�ͼ
figure(1)
hold on
for i=1:row
    for j=1:col
        if sign(i,j)==1
            y=[i-1,i-1,i,i];
            x=[j-1,j,j,j-1];
            h=fill(x,y,'k');
            set(h,'facealpha',1) %�����ɫ��͸����Ϊ1����ɫ����
        end
    end
end
axis([0 col 0 row])%����ͼ�ı߽�
for i=1:row %��������
    plot([0 col],[i i],'k-');
end
for i=1:col
    plot([i i],[0 row],'k-');
end

%% �������յ�
%% �����
disp('�������������')
[A(1),A(2)]=ginput(1);
pause(0.5)
A=fliplr(ceil(A));
disp('�������յ�����')
if sign(A(1),A(2))==1
    msgbox('������ϰ��ϣ����������롣')
    return
end
plot(A(2)-0.5,A(1)-0.5,'g^');
text(A(2)-0.5,A(1)-0.5+1,'S','fontsize',10')
%% ���յ�
[B(1),B(2)]=ginput(1);
pause(0.5)
B=fliplr(ceil(B));
if sign(B(1),B(2))==1
    msgbox('�յ����ϰ��ϣ����������롣')
    return
end
plot(B(2)-0.5,B(1)-0.5,'r^');
text(B(2)-1.5,B(1)-1.5,'T','fontsize',10')

%%%%%%%%%%%%%%%%%%%%%%%%%%����Ϊ���ϳ����߼�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ���������
startPoint=fliplr(A-0.5);%���λ��
finalPoint=fliplr(B-0.5);%Ŀ��λ��
Katt=5;%����������Ҫ������ϵ��
Krep=15;%�������������ϵ��
stepSize=0.35;%����
purposeDistance=1*stepSize;%��С����Ŀ������С�ڸ�ֵʱ������Ϊ����Ŀ��
%�������ʵ��Ԥ��Ŀ�꣬����Ҳ���ʼ������ϵ����influenceDistance���õĲ������й�
obstaclePoint=[];%n���ϰ���
for i=1:row
    for j=1:col
        if sign(i,j)==1
            obstaclePoint=[obstaclePoint;[j-0.5,i-0.5]];
        end
    end
end
obstacleNum=size(obstaclePoint,1);%�ϰ�����
obstacleR=0.8;%�ϰ���뾶       
do=2*obstacleR;%�������ʱ�ϰ���Ӱ�����           
nowPoint=startPoint;%ѭ����ʼ����������ʼ���긳��now_point
route(1,:)=nowPoint;%route�Ǳ��泵�߹���ÿ��������꣬�տ�ʼ�Ƚ����Ž�������
j=1;
alphy=0.8;
beta=2;
tic;
while true %ѭ����ʼ
    %% ��������
    Attract_x=Katt*(finalPoint(1)-nowPoint(1));%x�����ϵ�����
    Attract_y=Katt*(finalPoint(2)-nowPoint(2));%y�����ϵ�����
    dis_lin=norm(finalPoint-nowPoint);%��ǰ����յ�ľ���
    Attract_x=Attract_x/dis_lin^alphy;
    Attract_y=Attract_y/dis_lin^alphy;
    %% ��������
    repulsion_x=0;%x�����ϵĳ���
    repulsion_y=0;%y�����ϵĳ���
    for i=1:obstacleNum
        dis_lin=norm(nowPoint-obstaclePoint(i,1:2));%·������ϰ��ľ���
        if dis_lin<do%����ϰ��͵�ǰ��ľ���С���ϰ�Ӱ�����
            repulsion_x=repulsion_x+Krep*(obstacleR/dis_lin)^beta*(obstaclePoint(i,1)-nowPoint(1));
            repulsion_y=repulsion_y+Krep*(obstacleR/dis_lin)^beta*(obstaclePoint(i,2)-nowPoint(2));
        end
    end
    %% ��������
    sum_x=Attract_x-repulsion_x;%x����ĺ���
    sum_y=Attract_y-repulsion_y;%y����ĺ���
    %% �ֲ������ж�
    if(j>2)%�ж��Ƿ����ֲ�����
        ifTrapped=norm(route(j,:)-route(j-2,:));
    end
    if(((j>2)&&(ifTrapped<stepSize/10))||((sum_x==0)&&(sum_y==0)&&(sum_z==0)))%��j�����j-2������������ߺ���Ϊ0������Ϊ�����˾ֲ�����ֵ
        disp('��������ͬ')
        break
    end
    %% ȷ����һ���������
    nextPoint(1)=nowPoint(1)+stepSize*sum_x/(sum_x^2+sum_y^2)^0.5;
    nextPoint(2)=nowPoint(2)+stepSize*sum_y/(sum_x^2+sum_y^2)^0.5;
    plot([nowPoint(1),nextPoint(1)],[nowPoint(2),nextPoint(2)],'bo','LineWidth',1.5)
    drawnow%ÿplotһ���㣬�ͰѸõ������figure��
    nowPoint=nextPoint;
    j=j+1;
    route(j,:)=nowPoint;%�Ѳ�����·����洢��route���Ա�������·������
    %% �жϵ�ǰ���Ƿ�ΪĿ���
    dis_Goal=norm(nowPoint-finalPoint);%���㵱ǰ����Ŀ������
    if dis_Goal<purposeDistance %����С�ڸ���ֵ������Ϊ����Ŀ���
        j=j+1;
        route(j,:)=finalPoint;%���յ���ӵ�·��
        break;
    end 
end
%% ����·���ܾ��룬��������Ľ����˹��Ƴ����߹���·�����Ա�
dis=0;
for i=2:size(route,1)
    dis=dis+norm(route(i,:)-route(i-1,:));
end
disp(['�ܾ��룺',num2str(dis)])   
title('Intelligent Car Path Planning Diagram');
