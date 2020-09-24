%details of recording
load('mgh007m.mat')
sampling_fr = 360
sampling_interval = 1 / sampling_fr
samples = size(val(7, :), 2)
gain = 1000
offset = 0
%%
%creating time axis
X = [0 : sampling_interval : samples / sampling_fr - sampling_interval]
%%
%Correcting signal (gain, offset)
data = val(7, :)
data = data - offset
data = data / gain
%%
%plot
figure
plot(X, data)
title('Resp.Imp.')
xlim([0, 60])
xlabel('sec')
ylabel('mV')
%%
figure
Y = fft(data);
P2 = abs(Y/samples);
P1 = P2(1:samples/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = sampling_fr*(0:(samples/2))/samples;
plot(f, P1)
title('one-sided frequency plot of Resp.Imp.')
xlabel('Hz')
ylabel('Amplitude')
xlim([0 5])
%%
%define carrier signal
fr_of_carr = 100
phi = 0
C = 1
carr_sig_value = C * sin(2*pi*fr_of_carr*X+phi)
figure
plot(X, carr_sig_value)
title('carrier signal')
xlabel('sec')
ylabel('mV')
xlim([0,1])
%%
%spectrum of carrier signal:
figure
Y = fft(carr_sig_value);
P2 = abs(Y/samples);
P1 = P2(1:samples/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = sampling_fr*(0:(samples/2))/samples;
plot(f, P1)
title('freq. plot of carrier signal.')
xlabel('Hz')
ylabel('Amplitude')
%xlim([0 10])
%%
%calculating modulated signal: m_left(t)
modulated_signal = (1 + data) .* carr_sig_value
figure
plot(X, modulated_signal)
xlim([0 10])
title('modulated signal')
xlabel('sec')
ylabel('mV')
%%
%spectrum of modulated signal
figure
Y = fft(modulated_signal);
P2 = abs(Y/samples);
P1 = P2(1:samples/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = sampling_fr*(0:(samples/2))/samples;
plot(f, P1)
title('freq. plot of modulated signal.')
xlabel('Hz')
ylabel('Amplitude')
xlim([99 101])
%%
%subplots
figure
subplot(3, 2, 1)
plot(X, data)
title('Resp.Imp.')
xlim([0, 60])
xlabel('sec')
ylabel('mV')
xlim([0 10])


subplot(3, 2, 2)
Y = fft(data);
P2 = abs(Y/samples);
P1 = P2(1:samples/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = sampling_fr*(0:(samples/2))/samples;
plot(f, P1)
title('one-sided frequency plot of Resp.Imp.')
xlabel('Hz')
ylabel('Amplitude')
xlim([0 2])



subplot(3,2,3)
fr_of_carr = 100
phi = 0
C = 1
carr_sig_value = C * sin(2*pi*fr_of_carr*X+phi)
plot(X, carr_sig_value)
title('carrier signal')
xlabel('sec')
ylabel('mV')
xlim([0,1])



subplot(3,2,4)
Y = fft(carr_sig_value);
P2 = abs(Y/samples);
P1 = P2(1:samples/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = sampling_fr*(0:(samples/2))/samples;
plot(f, P1)
title('freq. plot of carrier signal.')
xlabel('Hz')
ylabel('Amplitude')



subplot(3,2,5)
plot(X, modulated_signal)
xlim([0 10])
title('modulated signal')
xlabel('sec')
ylabel('mV')



subplot(3,2,6)
Y = fft(modulated_signal);
P2 = abs(Y/samples);
P1 = P2(1:samples/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = sampling_fr*(0:(samples/2))/samples;
plot(f, P1)
title('freq. plot of modulated signal.')
xlabel('Hz')
ylabel('Amplitude')
xlim([99 101])