                                           
                                          
                                       
                                       
line_data_black = [1.12717     0.469266
2.05202     0.513489                   
3.03468     0.551612                   
4.13295     0.496715                   
      5     0.450967                   
6.04046      0.38997                   
6.96532     0.362522                   
8.12139     0.315249                   
8.93064     0.263402                   
10.0289     0.214604                   
11.9942     0.145983                   
14.0751     0.130734                   
16.0983     0.124634                   
17.8902     0.103285                   
20.0289    0.0910856                   
22.2254    0.0773613                   
23.8439    0.0590623                   
26.0983    0.0483878                   
];                                     
                                       
line_data_red = [1.06936     0.450967      
1.99422     0.479941                   
3.03468     0.496715                   
4.01734     0.460117                   
      5     0.425044                   
6.09827     0.360997                   
6.96532     0.344223                   
7.94798     0.307625                   
9.04624     0.243578                   
 9.9711     0.188681                   
 12.052     0.112435                   
13.9595     0.100235                   
16.0405     0.084986                   
18.0058    0.0697367                   
20.0289     0.063637                   
21.9942     0.043813                   
24.0173    0.0377134                   
];                                     
    
line_data_blue = [1.06936     0.425044
2.05202     0.432668             
2.91908     0.460117             
4.13295     0.415894             
 5.0578     0.368622             
5.92486     0.342698             
7.02312     0.333548             
8.06358     0.267977             
10.0289     0.159707             
11.9942    0.0956604             
14.1329    0.0788863             
16.0405     0.065162             
18.0058    0.0514377             
19.9711    0.0422881             
21.9942     0.043813             
24.1329    0.0377134             
];                                   
                                    
line_data_green = [1.06936     0.400645      
2.05202     0.425044                   
2.97688     0.440293                   
4.01734     0.382346                   
 5.0578     0.322874                   
6.04046     0.315249                   
7.31214       0.2939                   
8.00578     0.235953                   
9.04624     0.188681                   
10.1445     0.132259                   
11.9942     0.084986                   
13.9595    0.0880358                   
16.0405    0.0560124                   
18.0058     0.045338                   
20.0289    0.0407632                   
21.9942    0.0377134                   
23.9595    0.0361884                   
];                                                                 
%% 
%{
           b     blue          .     point              -     solid
           g     green         o     circle             :     dotted
           r     red           x     x-mark             -.    dashdot 
           c     cyan          +     plus               --    dashed   
           m     magenta       *     star             (none)  no line
           y     yellow        s     square
           k     black         d     diamond
           w     white         v     triangle (down)
                               ^     triangle (up)
                               <     triangle (left)
                               >     triangle (right)
                               p     pentagram
                               h     hexagram
                          
%}
figure
hold on 
plot(line_data_black(:,1), line_data_black(:,2),'k-*')   
plot(line_data_red(:,1), line_data_red(:,2),'r-o', 'markerfacecolor', 'r') 
plot(line_data_blue(:,1), line_data_blue(:,2),'b-^', 'markerfacecolor', 'b')  
plot(line_data_green(:,1), line_data_green(:,2),'g-s', 'markerfacecolor','g')  
%plot(line_data(:,1), line_data(:,2),'r-*')  
%plot(line_data(:,1), line_data(:,2),'r-*')  
%plot(line_data(:,1), line_data(:,2),'r-*')  
xlabel('distance');
ylabel('free chloride concentration');
legend('C1','F1','F2', 'F3')                 
print -djpeg -r300 newplot2                                          
