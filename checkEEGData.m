function [ outputArg ] = checkEEGData( EEGData )
%UNTITLED ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

outputArg =1;

threshold = 1.5;

 %for all channel
 for ii = 1: size(EEGData,2)
   if find( abs(EEGData(:,ii) - mean(EEGData(:,ii))) > threshold)
     outputArg = 0;
   end
 end
end

