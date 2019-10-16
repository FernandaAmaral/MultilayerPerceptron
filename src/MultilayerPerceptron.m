%%%%%%%%%%%%%%%%%%% Multilayer Perceptron %%%%%%%%%%%%%%%%%%%
% Autora: Fernanda Amaral Melo                              %
% Contato: fernanda.amaral.melo@gmail.com                   %
%                                                           %
% Script usado para treinar a rede neural                   %
% Par?metros:                                               %
% - labels, images: Training dataset                        %
% Sa?da:                                                    %
% - w1, w2: Matrizes correspondentes ao peso dos neur?nios  %
% - sset: Erro quadr?tico m?dio                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [w1,w2,sset] = MultilayerPerceptron (labels,images) 
 
    nep=1000; %Numero de Epocas
    eta=0.5; %Taxa de aprendizado
    ne=60000; %Numero de exemplos
    n=60; %Numero de neuronios na segunda camada -1 (bias)
    sset(nep)=0; %Variavel para guardar o erro quadratico medio de cada epoca

    w1=rand(785,n)*.2-.1; %Gera valores aleatorios para w entre -1 e 1
    w2=rand((n+1),10)*.2-.1;
    
    for i=1:nep %Varre pelo numero de epocas
        for j=1:ne %Varre pelo numero de exemplos
            sse=0.0; %Variavel para guardar o erro quadratico medio de cada exemplo 
            
            if (labels(j,1)==0)  d=[0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
            elseif (labels(j,1)==1)  d=[0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
            elseif (labels(j,1)==2)  d=[0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
            elseif (labels(j,1)==3)  d=[0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
            elseif (labels(j,1)==4)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
            elseif (labels(j,1)==5)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1 ; 0.1]; 
            elseif (labels(j,1)==6)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1 ; 0.1];         
            elseif (labels(j,1)==7)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1 ; 0.1];         
            elseif (labels(j,1)==8)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9 ; 0.1];         
            elseif (labels(j,1)==9)  d=[0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.9];
            end  % O conjunto de 'if's cria vetor de saidas desejadas de saida binaria
            
            x=images(:,j); % x assume o valor de um vetor: todas as linhas de "image" da coluna j
            x=[x;1]; % Adicao do neuronio de valor 1 que ser? multiplicado pelo bias 
         
            s1=transpose(w1)*x; %Soma ponderada das entradas
            y2=1.0./(1+exp(-s1)); %Funcao de ativacao sigmoide logistica
            s2=transpose(w2)*[y2;1]; %Soma ponderada dos neuronios da segunda camada
            y3=s2; %Funcao de ativacao Identidade
            
            for k=1:10
                sse=sse+(d(k)-y3(k))^2; % Calcula erro quadratico       
            end
            
            sse=sse/10; %Divide a soma dos erros quadraticos pelo numero de termos p/ se obter a media
            sset(i)=sset(i)+sse; %calcula a soma dos erros quadraticos dessa epoca
          
            e=(d-y3)*1; %Erro na ultima camada, com funcao de ativacao Identidade e derivada igual a 1
            dw2=[y2;1]*transpose(e); %delta w2
            e1=w2(1:n,1:10)*e.*y2.*(1-y2); %Propagacao do erro para a 1a camada
            dw1=x*transpose(e1); %delta w1
            w1=w1+eta*dw1; % Atualizacao de w1
            w2=w2+eta*dw2; % Atualizacao de w2
        end
        
        sset(i)=sset(i)/ne; %Divisao pelo numero de exemplos, calculando a media da soma dos erros quadraticos medios                  
    end
        
end

