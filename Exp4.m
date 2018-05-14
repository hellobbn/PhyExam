% A - Data Section
Vol_A = [170 169 170 169 172 171 172 172];
Tf_A = [23.70 24.10 24.29 24.15 24.48 24.63 24.02 24.30];

Vol_B = [275 275 275 276 275 277 276 275];
Tf_B = [18.12 18.18 18.13 18.10 18.16 18.69 18.15 18.12];

Vol_C = [56 54 56 55 57 56 55 55];
Tf_C = [25.51 26.17 25.21 25.01 25.46 25.23 25.17 25.43];


% B - Constant Section
e = 1.6 * 10^-19;


% C - Function Section

% C.1 - Normal Functions
Cal_C = @(v, t) v .* (t .* (1 + 0.0196 .* sqrt( t ))).^(3/2) ;% This function calculates the C
Cal_N = @(C) C ./ e;
Cal_c = @(C, N) C ./ N;
Cal_diff = @(c) (c - e) ./ e;

% C.2 Uncertanty
U = @(ua, b) sqrt((2.58 .* ua).^2 + (3.50 * b / 3)^2)


% D. Normal Calculation
C_A = Cal_C(Vol_A, Tf_A);
N_A = Cal_N(C_A);
c_A = Cal_c(C_A, 5)
Cal_diff = Cal_diff(c_A)

C_B = Cal_C(Vol_B, Tf_B);
N_B = Cal_N(C_B);
c_B = Cal_c(C_B, 5)
Cal_diff = Cal_diff(c_B)

C_C = Cal_C(Vol_C, Tf_C);
N_C = Cal_N(C_C);
c_C = Cal_c(C_C, 5)
Cal_diff = Cal_diff(c_C)


% E. Vol Uncertainty Calculation
Vol_Avg_A = mean(Vol_A)
Vol_Std_A = std(Vol_A)
Vol_Ua_A = Vol_Std_A / sqrt(8)
Vol_U_A = U(Vol_Ua_A, 1)

Vol_Avg_B = mean(Vol_B)
Vol_Std_B = std(Vol_B)
Vol_Ua_B = Vol_Std_B / sqrt(8)
Vol_U_B = U(Vol_Ua_B, 1)

Vol_Avg_C = mean(Vol_C)
Vol_Std_C = std(Vol_C)
Vol_Ua_C = Vol_Std_C / sqrt(8)
Vol_U_C = U(Vol_Ua_C, 1)


% F. Time Uncertainty Calculation
Tm_Avg_A = mean(Tf_A)
Tm_Std_A = std(Tf_A)
Tm_Ua_A = Tm_Avg_A / sqrt(8)
Tm_U_A = U(Tm_Ua_A, 0.2)

Tm_Avg_B = mean(Tf_B)
Tm_Std_B = std(Tf_B)
Tm_Ua_B = Tm_Avg_B / sqrt(8)
Tm_U_B = U(Tm_Ua_B, 0.2)

Tm_Avg_C = mean(Tf_C)
Tm_Std_C = std(Tf_C)
Tm_Ua_C = Tm_Avg_C / sqrt(8)
Tm_U_C = U(Tm_Ua_C, 0.2)

% G. U Calculation
U_A_Q_C = sqrt((Vol_U_A / Vol_Avg_A)^2 + (3 / 2)^2 * (Tm_U_A / Tm_Avg_A)^2)
U_B_Q_C = sqrt((Vol_U_B / Vol_Avg_B)^2 + (3 / 2)^2 * (Tm_U_B / Tm_Avg_B)^2)
U_C_Q_C = sqrt((Vol_U_C / Vol_Avg_C)^2 + (3 / 2)^2 * (Tm_U_C / Tm_Avg_C)^2)

U_A = U_A_Q_C * mean(C_A)
U_B = U_B_Q_C * mean(C_B)
U_C = U_C_Q_C * mwan(C_C)