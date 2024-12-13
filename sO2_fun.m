function [sO2,errormap]=sO2_fun(data2d_532,data2d_558,ecoeff,laserrate,mode,depth,mask,l_sO2f,h_sO2f)
[sizex sizey]=size(mask);
errormap=0.5*ones(sizex,sizey);

data2d_532=data2d_532./laserrate;
sO2o=(ecoeff(4).*data2d_532-ecoeff(3).*data2d_558)./((ecoeff(4)-ecoeff(2)).*data2d_532+(ecoeff(1)-ecoeff(3)).*data2d_558);
sO2f=sO2filter_fun(sO2o,depth,mask,l_sO2f,h_sO2f);


errormap(sO2f<0)=0;
errormap(sO2f>1)=1;

switch mode
    case 1 
        nor=max(sO2f,[],'all')-min(sO2f,[],'all');
        sO2f=sO2f+abs(min(sO2f,[],'all'));
        sO2f=sO2f./nor;
    case 2
        sO2f(sO2f<0)=0;
        nor=max(sO2f,[],'all');
        sO2f=sO2f./nor;
    case 3
        sO2f(sO2f<0)=0;
        sO2f(sO2f>1)=1;
    otherwise
        error('归一化模式开关错误');
end

sO2=sO2filter_fun(sO2f,depth,mask,l_sO2f,h_sO2f);
        