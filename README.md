# Signal-modulaton-with-carrier-signal-in-MATLAB
The signal modulation is a basic operation in communications (eg. radio signals), but it is also useful in biomedical signal processing.
This code shows how to implement this signal modulation in MATLAB.
The repository contains two files: mgh007m.info, mgh007m.mat. These files are from the MGH/MF Waveform Database: https://archive.physionet.org/physiobank/database/mghdb/
I use a 1-minute-long Respiratory Impedance signal from mgh007m.mat file. This is an 8x21600 matrix where the 7th row is the Respiratory Impedance signal.
I use a sine carrier signal: C*sin(2*pi*f + phi) where f = 100Hz, C = 1mV, phi = 0.


References:

The measurement details can be found on https://archive.physionet.org/physiobank/database/mghdb/

Welch JP, Ford PJ, Teplick RS, Rubsamen RM. The Massachusetts General Hospital-Marquette Foundation Hemodynamic and Electrocardiographic Database -- Comprehensive collection of critical care waveforms. J Clinical Monitoring 7(1):96-97 (1991).

Goldberger AL, Amaral LAN, Glass L, Hausdorff JM, Ivanov PCh, Mark RG, Mietus JE, Moody GB, Peng C-K, Stanley HE. PhysioBank, PhysioToolkit, and PhysioNet: Components of a New Research Resource for Complex Physiologic Signals. Circulation 101(23):e215-e220 [Circulation Electronic Pages; http://circ.ahajournals.org/cgi/content/full/101/23/e215]; 2000 (June 13).
