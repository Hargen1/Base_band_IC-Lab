clear;
data = randi([0 1], 1024, 1);

% Verilog Input Data Generater
fid = fopen('./bitstream.txt', 'wt');
fprintf(fid,'%d\n', data);
fclose(fid);

% ================== Matlab Sim ==================
% Signal Mapping & Up-Sampling
mapping_I_data = zeros(512, 1);
mapping_Q_data = zeros(512, 1);
up_sampling_I_data = zeros(2048, 1);
up_sampling_Q_data = zeros(2048, 1);

for i = 1:512
    if(data(2*i - 1) == 0)
        if(data(2*i) == 0)
            mapping_I_data(i) = 1;
            mapping_Q_data(i) = 1;
            up_sampling_I_data(4*i - 3) = 1;
            up_sampling_Q_data(4*i - 3) = 1;
        else
            mapping_I_data(i) = 1;
            mapping_Q_data(i) = -1;
            up_sampling_I_data(4*i - 3) = 1;
            up_sampling_Q_data(4*i - 3) = -1;
        end
    else
        if(data(2*i) == 0)
            mapping_I_data(i) = -1;
            mapping_Q_data(i) = 1;
            up_sampling_I_data(4*i - 3) = -1;
            up_sampling_Q_data(4*i - 3) = 1;
        else
            mapping_I_data(i) = -1;
            mapping_Q_data(i) = -1;
            up_sampling_I_data(4*i - 3) = -1;
            up_sampling_Q_data(4*i - 3) = -1;
        end
    end
end

% Pulse Shaping Filter
srrc_dec = srrcf(4,4,0.495);
srrc_dec = srrc_dec';
modin_I = conv(up_sampling_I_data, srrc_dec);
modin_Q = conv(up_sampling_Q_data, srrc_dec);

% Mix with DDFS
cj_now = 0;
txf_now = 0;

for i = 1:2080
    IFout(i) = modin_I(i)* cos(txf_now + cj_now) - modin_Q(i)* sin(txf_now + cj_now);
    txf_now = txf_now + pi/2;
end

% Matlab Result
[pxx_m, f_m] = pwelch(IFout);
subplot(2,1,1);
plot(f_m, 10*log10(pxx_m));
title('Matlab');

% Verilog Result
QAM_v = dlmread("./QAM_result.txt", "r");

QAM_v = QAM_v./16384;
for i = 1:2080
    if(QAM_v(i,1) > 8) 
        QAM_v(i,1) = QAM_v(i,1) - 16;
    end
end

[pxx_v, f_v] = pwelch(QAM_v);
subplot(2,1,2);
plot(f_v, 10*log10(pxx_v));
title('Verilog');

