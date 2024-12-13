function []=save_fun(datorgcf,fileloc,mode,datatype,post,sbutt)
if sbutt==1
    loc_pre=fileloc(1:(strlength(fileloc)-4));
    switch mode
        case 'fig'
            saveas(datorgcf,[loc_pre post '.fig']);
        case 'mat'
            save([loc_pre post '.mat'],datorgcf);
        case 'dat'
            fid=fopen([loc_pre post '.dat'],'w+');
            fwrite(fid,datorgcf,datatype);
            fclose(fid);
        otherwise
            error('¥Ê¥¢ƒ£ Ω…Ë÷√¥ÌŒÛ');
    end
end