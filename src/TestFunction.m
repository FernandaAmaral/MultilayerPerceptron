%%%%%%%%%%%%%%%%%%%%% Test Function %%%%%%%%%%%%%%%%%%%%%%%%%
% Autora: Fernanda Amaral Melo                              %
% Contato: fernanda.amaral.melo@gmail.com                   %
%                                                           %
% Script usado para testar a rede neural                    %
% Par?metros:                                               %
% - w1, w2: Matrizes da rede treinada                       %
% - imagestest, labelstest: Conjunto de imagens e labels    %
%                           de teste                        %
% Sa?da:                                                    %
% - sse: Erro quadr?tico                                    %
% - sser: Erro quadr?tico m?dio                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [sse,sset] = TestFunction(w1,w2,imagestest,labelstest)

for j=1:10000 %Varre pelo numero de exemplos

    x=imagestest(:,j); % x assume o valor de um vetor: todas as linhas de "image" da coluna j
    x=[x;1]; % Adicao do neuronio de valor 1 que sera multiplicado pelo bias
    sse(10000)=0; %Variavel para guardar o erro quadratico medio de cada exemplo
    
    if (labelstest(j,1)==0)  d=[0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
    elseif (labelstest(j,1)==1)  d=[0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
    elseif (labelstest(j,1)==2)  d=[0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
    elseif (labelstest(j,1)==3)  d=[0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
    elseif (labelstest(j,1)==4)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
    elseif (labelstest(j,1)==5)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
    elseif (labelstest(j,1)==6)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1];         
    elseif (labelstest(j,1)==7)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1];         
    elseif (labelstest(j,1)==8)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1];         
    elseif (labelstest(j,1)==9)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9];
    end  % O conjunto de 'if's cria vetor de saidas desejadas de sa?da bin?ria

    s1=transpose(w1)*x; %Soma ponderada das entradas
    y2=1.0./(1+exp(-s1)); %Funcao de ativacao sigmoide logistica
    s2=transpose(w2)*[y2;1]; %Soma ponderada dos neuronios da segunda camada
    y3=s2;
    
    for k=1:10
        sse(j)=sse(j)+(d(k)-y3(k))^2; % Calcula erro quadratico       
    end
    sse(j)=sse(j)/10;
    
end
sset=(sum(sse(:)))/10000; %Calcula a media de todos os erros

end

