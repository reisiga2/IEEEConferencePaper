

% this fucntion recieves the maneuver IDs at one intersection and then
% translates the data into one unified maneuver ids from 1 to 12. Also if
% there was a maneuver ID in the data that was not possible it put 13
% instead. 

% input should be an array of 12 maneuvers with the order of NE, NS, NW,
% EN, ES, EW, SN, SE, SW, WN, WE, WS.
%maneuverIdList must be a row vector of manuve IDs with length 12. if a
%maneuver does not happen insert 0 instead. 
% exprData contains three columns. the first columns is maneuverIDs, second
% column is the time stamps and the third column is the realphases that
% should be manually determined. 

%translated_Data is the sequence of maneuvers renamed from 1 to 12 as
%explaned above. 


function data = translate_data(exprData, maneuverIdList)
    
dataLength = size(exprData, 1);
translated_Data=zeros(dataLength,1);
for i=1:dataLength
		if (exprData(i,1)==maneuverIdList(1))
                translated_Data(i,1)=1;
            
            elseif (exprData(i,1)==maneuverIdList(2))
				translated_Data(i,1)=2;
                
            elseif (exprData(i,1)==maneuverIdList(3))
				translated_Data(i,1)=3;
			
            elseif(exprData(i,1)==maneuverIdList(4))
				translated_Data(i,1)=4;
			
            elseif(exprData(i,1)==maneuverIdList(5))
				translated_Data(i,1)=5;
			
            elseif(exprData(i,1)==maneuverIdList(6))
				translated_Data(i,1)=6;
			
            elseif(exprData(i,1)==maneuverIdList(7))
				translated_Data(i,1)=7;
                
            elseif(exprData(i,1)==maneuverIdList(8))
				translated_Data(i,1)=8;
                
            elseif(exprData(i,1)==maneuverIdList(9))
				translated_Data(i,1)=9;
                
            elseif(exprData(i,1)==maneuverIdList(10))
				translated_Data(i,1)=10;
                
            elseif(exprData(i,1)==maneuverIdList(11))
				translated_Data(i,1)=11;
                
            elseif(exprData(i,1)==maneuverIdList(12))
				translated_Data(i,1)=12;
                
            else    
               translated_Data(i,1)=0;
        end
end
        time = (exprData(:,2)-min(exprData(:,2)))/1000; % transforms time to second starting at zero.
        realPhases = exprData(:,3);
        
        data = [translated_Data, time, realPhases ];
end