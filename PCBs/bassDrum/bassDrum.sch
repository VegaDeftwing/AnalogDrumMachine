EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 61700DAA
P 3100 2400
F 0 "Q1" H 3290 2446 50  0000 L CNN
F 1 "2N3904" H 3290 2355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3300 2325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3100 2400 50  0001 L CNN
	1    3100 2400
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 61701809
P 4450 2400
F 0 "Q2" H 4640 2446 50  0000 L CNN
F 1 "2N3904" H 4640 2355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4650 2325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4450 2400 50  0001 L CNN
	1    4450 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 617648D4
P 5700 2450
F 0 "C2" V 5952 2450 50  0000 C CNN
F 1 "100nF" V 5861 2450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5738 2300 50  0001 C CNN
F 3 "~" H 5700 2450 50  0001 C CNN
	1    5700 2450
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D1
U 1 1 61767C11
P 2400 2950
F 0 "D1" V 2354 3030 50  0000 L CNN
F 1 "D" V 2445 3030 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 2400 2950 50  0001 C CNN
F 3 "~" H 2400 2950 50  0001 C CNN
	1    2400 2950
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 6176954F
P 1800 2950
F 0 "C1" H 1915 2996 50  0000 L CNN
F 1 "1uF" H 1915 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1838 2800 50  0001 C CNN
F 3 "~" H 1800 2950 50  0001 C CNN
	1    1800 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6176AE93
P 1150 2400
F 0 "R1" V 1357 2400 50  0000 C CNN
F 1 "1k" V 1266 2400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1080 2400 50  0001 C CNN
F 3 "~" H 1150 2400 50  0001 C CNN
	1    1150 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1300 2400 1800 2400
Wire Wire Line
	1800 2800 1800 2400
Connection ~ 1800 2400
Wire Wire Line
	2400 2800 2400 2400
Connection ~ 2400 2400
Wire Wire Line
	2400 2400 2900 2400
Connection ~ 2000 2400
Wire Wire Line
	2000 2400 2400 2400
Wire Wire Line
	1800 2400 2000 2400
Wire Wire Line
	2000 2000 2000 2400
$Comp
L Device:R R2
U 1 1 617640BC
P 2000 1850
F 0 "R2" H 2070 1896 50  0000 L CNN
F 1 "100k" H 2070 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1930 1850 50  0001 C CNN
F 3 "~" H 2000 1850 50  0001 C CNN
	1    2000 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6176D206
P 3200 1850
F 0 "R3" H 3270 1896 50  0000 L CNN
F 1 "47k" H 3270 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3130 1850 50  0001 C CNN
F 3 "~" H 3200 1850 50  0001 C CNN
	1    3200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2200 3200 2100
Connection ~ 3200 2100
Wire Wire Line
	3200 2100 3200 2000
Wire Wire Line
	3200 2100 3850 2100
Wire Wire Line
	3850 2100 3850 2400
Wire Wire Line
	3850 2400 4250 2400
$Comp
L Device:R R5
U 1 1 6176EB1C
P 4550 1850
F 0 "R5" H 4620 1896 50  0000 L CNN
F 1 "4.7k" H 4620 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4480 1850 50  0001 C CNN
F 3 "~" H 4550 1850 50  0000 C CNN
	1    4550 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 6176F438
P 3900 3200
F 0 "R4" H 3970 3246 50  0000 L CNN
F 1 "220" H 3970 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3830 3200 50  0001 C CNN
F 3 "~" H 3900 3200 50  0001 C CNN
	1    3900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2900 4550 2600
Wire Wire Line
	3200 2900 3200 2600
Wire Wire Line
	3200 2900 3900 2900
Wire Wire Line
	3900 3050 3900 2900
Connection ~ 3900 2900
Wire Wire Line
	3900 2900 4550 2900
Wire Wire Line
	3900 3500 3900 3350
Wire Wire Line
	1800 3500 1800 3100
Wire Wire Line
	2400 3500 2400 3100
Wire Wire Line
	3200 1700 3200 1250
Wire Wire Line
	4550 1700 4550 1250
Wire Wire Line
	3200 1250 3850 1250
Connection ~ 3850 1250
Wire Wire Line
	3850 1250 4550 1250
Wire Wire Line
	3850 1250 3850 800 
Wire Wire Line
	4550 2000 4550 2100
Connection ~ 4550 2100
Wire Wire Line
	4550 2100 4550 2200
Wire Wire Line
	4550 2100 5200 2100
Wire Wire Line
	5200 2100 5200 2450
Wire Wire Line
	5200 2450 5550 2450
Wire Wire Line
	5850 2450 6300 2450
Wire Wire Line
	7100 3050 7350 3050
Connection ~ 7100 3050
Wire Wire Line
	6800 3050 7100 3050
$Comp
L Device:R R6
U 1 1 61790FE8
P 7100 3400
F 0 "R6" H 7170 3446 50  0000 L CNN
F 1 "220" H 7170 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7030 3400 50  0001 C CNN
F 3 "~" H 7100 3400 50  0001 C CNN
	1    7100 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 6178D701
P 6650 3050
F 0 "C3" V 6902 3050 50  0000 C CNN
F 1 "100nF" V 6811 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6688 2900 50  0001 C CNN
F 3 "~" H 6650 3050 50  0001 C CNN
	1    6650 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 61797DA5
P 7100 4650
F 0 "R7" V 6893 4650 50  0000 C CNN
F 1 "1M" V 6984 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7030 4650 50  0001 C CNN
F 3 "~" H 7100 4650 50  0001 C CNN
	1    7100 4650
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 6178F177
P 7500 3050
F 0 "C4" V 7752 3050 50  0000 C CNN
F 1 "100nF" V 7661 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7538 2900 50  0001 C CNN
F 3 "~" H 7500 3050 50  0001 C CNN
	1    7500 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R8
U 1 1 617CBA46
P 6700 4950
F 0 "R8" V 6493 4950 50  0000 C CNN
F 1 "470k" V 6584 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6630 4950 50  0001 C CNN
F 3 "~" H 6700 4950 50  0001 C CNN
	1    6700 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 617CC16A
P 7500 4950
F 0 "R9" V 7293 4950 50  0000 C CNN
F 1 "470k" V 7384 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7430 4950 50  0001 C CNN
F 3 "~" H 7500 4950 50  0001 C CNN
	1    7500 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 617D1A9A
P 7100 5550
F 0 "R10" H 7170 5596 50  0000 L CNN
F 1 "47k" H 7170 5505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7030 5550 50  0001 C CNN
F 3 "~" H 7100 5550 50  0001 C CNN
	1    7100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3050 7800 3050
Wire Wire Line
	7800 3050 7800 4650
Wire Wire Line
	7800 4950 7650 4950
Wire Wire Line
	7250 4650 7800 4650
Connection ~ 7800 4650
Wire Wire Line
	7800 4650 7800 4950
Wire Wire Line
	6500 3050 6300 3050
Wire Wire Line
	6300 3050 6300 2650
Connection ~ 6300 3050
Wire Wire Line
	6300 3050 6300 4650
Wire Wire Line
	6950 4650 6300 4650
Connection ~ 7800 3050
Wire Wire Line
	7800 3050 7800 2550
$Comp
L Device:R R11
U 1 1 617DAA01
P 8200 2550
F 0 "R11" V 7993 2550 50  0000 C CNN
F 1 "0" V 8084 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8130 2550 50  0001 C CNN
F 3 "~" H 8200 2550 50  0001 C CNN
	1    8200 2550
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 617DB37B
P 8800 2550
F 0 "C6" V 8548 2550 50  0000 C CNN
F 1 "100nF" V 8639 2550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8838 2400 50  0001 C CNN
F 3 "~" H 8800 2550 50  0001 C CNN
	1    8800 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 2550 8650 2550
Wire Wire Line
	8050 2550 7800 2550
Wire Wire Line
	7100 3050 7100 3250
Wire Wire Line
	6850 4950 7100 4950
$Comp
L Device:C C5
U 1 1 617EA3CB
P 7100 5150
F 0 "C5" H 7215 5196 50  0000 L CNN
F 1 "100nF" H 7215 5105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7138 5000 50  0001 C CNN
F 3 "~" H 7100 5150 50  0001 C CNN
	1    7100 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 5000 7100 4950
Connection ~ 7100 4950
Wire Wire Line
	7100 4950 7350 4950
Wire Wire Line
	7100 5300 7100 5400
Text GLabel 850  2400 0    50   Input ~ 0
TRIG
$Comp
L Connector_Generic:Conn_02x12_Odd_Even J1
U 1 1 619036D4
P 10250 1400
F 0 "J1" H 10300 2117 50  0000 C CNN
F 1 "Conn_02x12_Odd_Even" H 10300 2026 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x12_P2.54mm_Vertical" H 10250 1400 50  0001 C CNN
F 3 "~" H 10250 1400 50  0001 C CNN
	1    10250 1400
	1    0    0    -1  
$EndComp
Text GLabel 10050 900  0    50   Input ~ 0
A_OUT_L
Text GLabel 10050 1000 0    50   Input ~ 0
A_OUT_R
Text GLabel 10050 1100 0    50   Input ~ 0
A_IN
Text GLabel 10050 1200 0    50   Input ~ 0
GND
Text GLabel 10050 1300 0    50   Input ~ 0
+12V
Text GLabel 10050 1400 0    50   Input ~ 0
-12V
Text GLabel 10050 1500 0    50   Input ~ 0
GND
Text GLabel 10050 1600 0    50   Input ~ 0
5V
Text GLabel 10050 1700 0    50   Input ~ 0
DET
Text GLabel 10050 1900 0    50   Input ~ 0
SDA
Text GLabel 10050 1800 0    50   Input ~ 0
SCL
Text GLabel 10050 2000 0    50   Input ~ 0
TRIG
Text GLabel 10550 900  2    50   Input ~ 0
A_OUT_L
Text GLabel 10550 1000 2    50   Input ~ 0
A_OUT_R
Text GLabel 10550 1100 2    50   Input ~ 0
A_IN
Text GLabel 10550 1200 2    50   Input ~ 0
GND
Text GLabel 10550 1300 2    50   Input ~ 0
+12V
Text GLabel 10550 1400 2    50   Input ~ 0
-12V
Text GLabel 10550 1500 2    50   Input ~ 0
GND
Text GLabel 10550 1600 2    50   Input ~ 0
5V
Text GLabel 10550 1700 2    50   Input ~ 0
DET
Text GLabel 10550 1900 2    50   Input ~ 0
SDA
Text GLabel 10550 1800 2    50   Input ~ 0
SCL
Text GLabel 10550 2000 2    50   Input ~ 0
TRIG
Text GLabel 3850 800  1    50   Input ~ 0
+12V
Text GLabel 2000 1550 1    50   Input ~ 0
+12V
Wire Wire Line
	2000 1700 2000 1550
Connection ~ 7800 2550
Wire Wire Line
	7800 2550 6900 2550
Text GLabel 7750 1800 3    50   Input ~ 0
-12V
$Comp
L Amplifier_Operational:TL072 U1
U 1 1 6170B86B
P 6600 2550
F 0 "U1" H 6600 2917 50  0000 C CNN
F 1 "TL072" H 6600 2826 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 6600 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6600 2550 50  0001 C CNN
	1    6600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  2400 1000 2400
Text GLabel 1800 6950 2    50   Input ~ 0
SDA
Text GLabel 1800 6850 2    50   Input ~ 0
SCL
Text GLabel 1300 7550 3    50   Input ~ 0
GND
Text GLabel 800  7150 0    50   Input ~ 0
5V
$Comp
L Amplifier_Operational:TL072 U1
U 2 1 6193A7C5
P 6150 1400
F 0 "U1" H 6150 1767 50  0000 C CNN
F 1 "TL072" H 6150 1676 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 6150 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6150 1400 50  0001 C CNN
	2    6150 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 6194C759
P 5850 7100
F 0 "R13" H 5920 7146 50  0000 L CNN
F 1 "10k" H 5920 7055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5780 7100 50  0001 C CNN
F 3 "~" H 5850 7100 50  0001 C CNN
	1    5850 7100
	1    0    0    -1  
$EndComp
Text GLabel 5850 7350 3    50   Input ~ 0
GND
$Comp
L Device:R R14
U 1 1 61957FEA
P 6300 7100
F 0 "R14" H 6370 7146 50  0000 L CNN
F 1 "10k" H 6370 7055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6230 7100 50  0001 C CNN
F 3 "~" H 6300 7100 50  0001 C CNN
	1    6300 7100
	1    0    0    -1  
$EndComp
Text GLabel 6300 7350 3    50   Input ~ 0
GND
Wire Wire Line
	5850 7350 5850 7250
Wire Wire Line
	6300 7350 6300 7250
Text GLabel 6450 6900 2    50   Input ~ 0
A0
Text GLabel 800  6850 0    50   Input ~ 0
A1
$Comp
L mcp46x2-potentiometer_digital:MCP46x2-Potentiometer_Digital U2
U 1 1 618F9094
P 1300 7050
F 0 "U2" H 1300 7900 50  0000 C CNN
F 1 "MCP46x2-Potentiometer_Digital" H 1300 7800 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 2050 6600 50  0001 C CNN
F 3 "" H 1300 7050 50  0001 C CNN
	1    1300 7050
	1    0    0    -1  
$EndComp
Text GLabel 1300 6550 1    50   Input ~ 0
A0
Text GLabel 1800 3500 3    50   Input ~ 0
GND
Text GLabel 2400 3500 3    50   Input ~ 0
GND
Text GLabel 3900 3500 3    50   Input ~ 0
GND
Text GLabel 10250 5150 3    50   Input ~ 0
-12V
Text GLabel 10900 5150 3    50   Input ~ 0
5V
$Comp
L power:+5V #PWR0102
U 1 1 6197D1BB
P 10900 4900
F 0 "#PWR0102" H 10900 4750 50  0001 C CNN
F 1 "+5V" H 10915 5073 50  0000 C CNN
F 2 "" H 10900 4900 50  0001 C CNN
F 3 "" H 10900 4900 50  0001 C CNN
	1    10900 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 6197DAC6
P 9600 4900
F 0 "#PWR0103" H 9600 4750 50  0001 C CNN
F 1 "+12V" H 9615 5073 50  0000 C CNN
F 2 "" H 9600 4900 50  0001 C CNN
F 3 "" H 9600 4900 50  0001 C CNN
	1    9600 4900
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR0104
U 1 1 6197E24D
P 10250 4900
F 0 "#PWR0104" H 10250 5000 50  0001 C CNN
F 1 "-12V" H 10265 5073 50  0000 C CNN
F 2 "" H 10250 4900 50  0001 C CNN
F 3 "" H 10250 4900 50  0001 C CNN
	1    10250 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 61984F23
P 9000 4900
F 0 "#PWR0105" H 9000 4650 50  0001 C CNN
F 1 "GND" H 9005 4727 50  0000 C CNN
F 2 "" H 9000 4900 50  0001 C CNN
F 3 "" H 9000 4900 50  0001 C CNN
	1    9000 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	9000 4900 9000 5050
Wire Wire Line
	9600 4900 9600 5050
Wire Wire Line
	10250 4900 10250 5050
Wire Wire Line
	10900 4900 10900 5050
Text GLabel 800  6950 0    50   Input ~ 0
P0Out
Text GLabel 7100 3700 3    50   Input ~ 0
P0In
Wire Wire Line
	7100 3700 7100 3550
Text GLabel 800  7250 0    50   Input ~ 0
P0In
Text GLabel 7100 5800 3    50   Input ~ 0
P1In
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61A74EB4
P 8900 5050
F 0 "#FLG0101" H 8900 5125 50  0001 C CNN
F 1 "PWR_FLAG" V 8900 5177 50  0000 L CNN
F 2 "" H 8900 5050 50  0001 C CNN
F 3 "~" H 8900 5050 50  0001 C CNN
	1    8900 5050
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61A75A74
P 10800 5050
F 0 "#FLG0102" H 10800 5125 50  0001 C CNN
F 1 "PWR_FLAG" V 10800 5177 50  0000 L CNN
F 2 "" H 10800 5050 50  0001 C CNN
F 3 "~" H 10800 5050 50  0001 C CNN
	1    10800 5050
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 61A75FA5
P 10200 5050
F 0 "#FLG0103" H 10200 5125 50  0001 C CNN
F 1 "PWR_FLAG" V 10200 5177 50  0000 L CNN
F 2 "" H 10200 5050 50  0001 C CNN
F 3 "~" H 10200 5050 50  0001 C CNN
	1    10200 5050
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 61A7698A
P 9550 5050
F 0 "#FLG0104" H 9550 5125 50  0001 C CNN
F 1 "PWR_FLAG" V 9550 5177 50  0000 L CNN
F 2 "" H 9550 5050 50  0001 C CNN
F 3 "~" H 9550 5050 50  0001 C CNN
	1    9550 5050
	0    -1   -1   0   
$EndComp
Text GLabel 9600 5150 3    50   Input ~ 0
+12V
Wire Wire Line
	8900 5050 9000 5050
Connection ~ 9000 5050
Wire Wire Line
	9000 5050 9000 5150
Wire Wire Line
	9550 5050 9600 5050
Connection ~ 9600 5050
Wire Wire Line
	9600 5050 9600 5150
Wire Wire Line
	10200 5050 10250 5050
Connection ~ 10250 5050
Wire Wire Line
	10250 5050 10250 5150
Wire Wire Line
	10800 5050 10900 5050
Connection ~ 10900 5050
Wire Wire Line
	10900 5050 10900 5150
Text GLabel 1200 7550 3    50   Input ~ 0
P1In
Text GLabel 1800 7250 2    50   Input ~ 0
P1Out
$Comp
L Amplifier_Operational:TL072 U1
U 3 1 6173189C
P 7850 1350
F 0 "U1" H 7808 1396 50  0000 L CNN
F 1 "TL072" H 7808 1305 50  0000 L CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 7850 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7850 1350 50  0001 C CNN
	3    7850 1350
	1    0    0    -1  
$EndComp
Text GLabel 7750 900  1    50   Input ~ 0
+12V
Wire Wire Line
	7100 5700 7100 5800
Text Notes 7000 4350 0    50   ~ 0
Decay
Text Notes 6900 2850 0    50   ~ 0
Frequency
$Comp
L Device:C C7
U 1 1 61B44A81
P 8200 950
F 0 "C7" V 7948 950 50  0000 C CNN
F 1 "470pF" V 8039 950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8238 800 50  0001 C CNN
F 3 "~" H 8200 950 50  0001 C CNN
	1    8200 950 
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 61B455E4
P 8200 1700
F 0 "C8" V 7948 1700 50  0000 C CNN
F 1 "470pF" V 8039 1700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8238 1550 50  0001 C CNN
F 3 "~" H 8200 1700 50  0001 C CNN
	1    8200 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 1050 7750 950 
Wire Wire Line
	8050 950  7750 950 
Connection ~ 7750 950 
Wire Wire Line
	7750 950  7750 900 
Wire Wire Line
	7750 1800 7750 1700
Wire Wire Line
	8050 1700 7750 1700
Connection ~ 7750 1700
Wire Wire Line
	7750 1700 7750 1650
Text GLabel 8500 950  2    50   Input ~ 0
GND
Text GLabel 8500 1700 2    50   Input ~ 0
GND
Wire Wire Line
	8500 950  8350 950 
Wire Wire Line
	8500 1700 8350 1700
Text GLabel 5850 1300 0    50   Input ~ 0
GND
Wire Wire Line
	6450 1400 6450 1650
Wire Wire Line
	6450 1650 5800 1650
Wire Wire Line
	5800 1650 5800 1500
Wire Wire Line
	5800 1500 5850 1500
Text GLabel 9600 2550 2    50   Input ~ 0
BassOUT
$Comp
L Device:R R15
U 1 1 62239D75
P 4100 4350
F 0 "R15" V 3893 4350 50  0000 C CNN
F 1 "220" V 3984 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4030 4350 50  0001 C CNN
F 3 "~" H 4100 4350 50  0001 C CNN
	1    4100 4350
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL072 U3
U 1 1 6223C822
P 2450 4350
F 0 "U3" H 2450 4717 50  0000 C CNN
F 1 "TL072" H 2450 4626 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 2450 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2450 4350 50  0001 C CNN
	1    2450 4350
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U3
U 2 1 6223DE72
P 3500 5600
F 0 "U3" H 3500 5967 50  0000 C CNN
F 1 "TL072" H 3500 5876 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 3500 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 3500 5600 50  0001 C CNN
	2    3500 5600
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U3
U 3 1 6223FD3A
P 800 5400
F 0 "U3" H 758 5446 50  0000 L CNN
F 1 "TL072" H 758 5355 50  0000 L CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 800 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 800 5400 50  0001 C CNN
	3    800  5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 6224E965
P 3400 4350
F 0 "C9" V 3148 4350 50  0000 C CNN
F 1 "10uF" V 3239 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3438 4200 50  0001 C CNN
F 3 "~" H 3400 4350 50  0001 C CNN
	1    3400 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 4450 2000 4450
Wire Wire Line
	2000 4450 2000 4850
Wire Wire Line
	2000 4850 2600 4850
Wire Wire Line
	2900 4850 3100 4850
Wire Wire Line
	3100 4850 3100 4350
Wire Wire Line
	3100 4350 3250 4350
Wire Wire Line
	2750 4350 3100 4350
Connection ~ 3100 4350
Wire Wire Line
	3550 4350 3950 4350
Wire Wire Line
	3150 5700 3200 5700
Wire Wire Line
	3150 5700 3150 5950
Wire Wire Line
	3150 5950 3900 5950
Wire Wire Line
	3900 5950 3900 5600
Wire Wire Line
	3900 5600 3800 5600
Text GLabel 3200 5500 0    50   Input ~ 0
GND
Text GLabel 4550 4850 2    50   Input ~ 0
A_OUT_L
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 62270C50
P 4350 4850
F 0 "J5" H 4500 5100 50  0000 L CNN
F 1 "Conn_01x03" H 4150 5200 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4350 4850 50  0001 C CNN
F 3 "~" H 4350 4850 50  0001 C CNN
	1    4350 4850
	-1   0    0    1   
$EndComp
Text GLabel 4550 4950 2    50   Input ~ 0
GND
Text GLabel 1450 4250 0    50   Input ~ 0
BassOUT
Text GLabel 700  4950 1    50   Input ~ 0
+12V
Text GLabel 700  5950 3    50   Input ~ 0
-12V
Wire Wire Line
	700  5100 700  5050
Wire Wire Line
	1450 4250 2150 4250
$Comp
L Device:C C11
U 1 1 6229DB66
P 1150 5050
F 0 "C11" V 898 5050 50  0000 C CNN
F 1 "470pF" V 989 5050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1188 4900 50  0001 C CNN
F 3 "~" H 1150 5050 50  0001 C CNN
	1    1150 5050
	0    1    1    0   
$EndComp
$Comp
L Device:C C12
U 1 1 6229E991
P 1150 5800
F 0 "C12" V 898 5800 50  0000 C CNN
F 1 "470pF" V 989 5800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1188 5650 50  0001 C CNN
F 3 "~" H 1150 5800 50  0001 C CNN
	1    1150 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	700  5700 700  5800
Wire Wire Line
	1000 5800 700  5800
Connection ~ 700  5800
Wire Wire Line
	700  5800 700  5950
Wire Wire Line
	1000 5050 700  5050
Connection ~ 700  5050
Wire Wire Line
	700  5050 700  4950
Text GLabel 1450 5050 2    50   Input ~ 0
GND
Text GLabel 1450 5800 2    50   Input ~ 0
GND
Wire Wire Line
	1300 5050 1450 5050
Wire Wire Line
	1300 5800 1450 5800
Text Notes 4100 5400 0    50   ~ 0
Buffer Control Pot
Wire Wire Line
	8950 2550 9600 2550
$Comp
L Device:R R16
U 1 1 62420D7B
P 2750 4850
F 0 "R16" V 2957 4850 50  0000 C CNN
F 1 "220" V 2866 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2680 4850 50  0001 C CNN
F 3 "~" H 2750 4850 50  0001 C CNN
	1    2750 4850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R17
U 1 1 62428DB0
P 2000 5100
F 0 "R17" H 2070 5146 50  0000 L CNN
F 1 "1M" H 2070 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1930 5100 50  0001 C CNN
F 3 "~" H 2000 5100 50  0001 C CNN
	1    2000 5100
	1    0    0    -1  
$EndComp
Text GLabel 2000 5350 3    50   Input ~ 0
GND
Wire Wire Line
	2000 4950 2000 4850
Connection ~ 2000 4850
Wire Wire Line
	2000 5350 2000 5250
Text GLabel 10200 3550 1    50   Input ~ 0
P1Out
Text Notes 10050 4150 0    50   ~ 0
Decay Pot
Text Notes 8950 4150 0    50   ~ 0
Frequency Pot
Wire Wire Line
	10200 3750 10200 3550
Wire Wire Line
	10300 3750 10300 3550
Wire Wire Line
	9300 3750 9300 3550
Wire Wire Line
	9200 3750 9200 3550
NoConn ~ 10100 3750
NoConn ~ 9100 3750
Text GLabel 9200 3550 1    50   Input ~ 0
P0Out
Text GLabel 10300 3550 1    50   Input ~ 0
GND
Text GLabel 9300 3550 1    50   Input ~ 0
GND
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 61990E3C
P 10200 3950
F 0 "J3" V 10072 4130 50  0000 L CNN
F 1 "Conn_01x03" V 10163 4130 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10200 3950 50  0001 C CNN
F 3 "~" H 10200 3950 50  0001 C CNN
	1    10200 3950
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 6198F8E9
P 9200 3950
F 0 "J2" V 9072 4130 50  0000 L CNN
F 1 "Conn_01x03" V 9163 4130 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9200 3950 50  0001 C CNN
F 3 "~" H 9200 3950 50  0001 C CNN
	1    9200 3950
	0    1    1    0   
$EndComp
Text GLabel 6000 6900 2    50   Input ~ 0
A1
$Comp
L mcp46x2-potentiometer_digital:MCP46x2-Potentiometer_Digital U4
U 1 1 624502D3
P 3400 6950
F 0 "U4" H 3400 7800 50  0000 C CNN
F 1 "MCP46x2-Potentiometer_Digital" H 3400 7700 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 4150 6500 50  0001 C CNN
F 3 "" H 3400 6950 50  0001 C CNN
	1    3400 6950
	1    0    0    -1  
$EndComp
Text GLabel 3900 6750 2    50   Input ~ 0
SCL
Text GLabel 3900 6850 2    50   Input ~ 0
SDA
Text Notes 3550 6450 0    50   ~ 0
Master Volume
Connection ~ 6300 4650
Wire Wire Line
	6300 4950 6550 4950
Wire Wire Line
	6300 4650 6300 4950
Text GLabel 5850 6100 1    50   Input ~ 0
5V
Text GLabel 5750 6100 1    50   Input ~ 0
5V
Text GLabel 5650 6100 1    50   Input ~ 0
5V
Text GLabel 5550 6100 1    50   Input ~ 0
5V
$Comp
L Switch:SW_DIP_x04 SW2
U 1 1 6245164D
P 5650 6400
F 0 "SW2" V 5604 6730 50  0000 L CNN
F 1 "SW_DIP_x04" V 5695 6730 50  0000 L CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx04_Slide_6.7x11.72mm_W7.62mm_P2.54mm_LowProfile" H 5650 6400 50  0001 C CNN
F 3 "~" H 5650 6400 50  0001 C CNN
	1    5650 6400
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 62486526
P 4850 7100
F 0 "R19" H 4920 7146 50  0000 L CNN
F 1 "10k" H 4920 7055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4780 7100 50  0001 C CNN
F 3 "~" H 4850 7100 50  0001 C CNN
	1    4850 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 624868D5
P 5450 7100
F 0 "R20" H 5520 7146 50  0000 L CNN
F 1 "10k" H 5520 7055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5380 7100 50  0001 C CNN
F 3 "~" H 5450 7100 50  0001 C CNN
	1    5450 7100
	1    0    0    -1  
$EndComp
Text GLabel 5450 7350 3    50   Input ~ 0
GND
Text GLabel 4850 7350 3    50   Input ~ 0
GND
Wire Wire Line
	6000 6900 5850 6900
Wire Wire Line
	5850 6900 5850 6950
Wire Wire Line
	6300 6950 6300 6900
Wire Wire Line
	6300 6900 6450 6900
Wire Wire Line
	5850 6900 5750 6900
Wire Wire Line
	5750 6900 5750 6700
Connection ~ 5850 6900
Wire Wire Line
	6300 6900 6300 6800
Wire Wire Line
	6300 6800 5850 6800
Wire Wire Line
	5850 6800 5850 6700
Connection ~ 6300 6900
Wire Wire Line
	5450 6950 5450 6900
Wire Wire Line
	5450 6900 5650 6900
Wire Wire Line
	5650 6900 5650 6700
Text GLabel 5350 6900 0    50   Input ~ 0
MasterA0
Wire Wire Line
	5350 6900 5450 6900
Connection ~ 5450 6900
Wire Wire Line
	4850 6950 4850 6900
Wire Wire Line
	4850 6800 5550 6800
Wire Wire Line
	5550 6800 5550 6700
Wire Wire Line
	4850 7250 4850 7350
Wire Wire Line
	5450 7250 5450 7350
Text GLabel 4750 6900 0    50   Input ~ 0
MasterA1
Wire Wire Line
	4750 6900 4850 6900
Connection ~ 4850 6900
Wire Wire Line
	4850 6900 4850 6800
Text GLabel 3400 6350 0    50   Input ~ 0
MasterA0
Text GLabel 2900 6750 0    50   Input ~ 0
MasterA1
Wire Wire Line
	3400 6450 3400 6350
Text GLabel 3400 7450 3    50   Input ~ 0
GND
NoConn ~ 3900 7150
NoConn ~ 3300 7450
Text GLabel 2900 7050 0    50   Input ~ 0
5V
Text GLabel 2900 7150 0    50   Input ~ 0
GND
Text Notes 4100 5550 0    50   ~ 0
Note: Output in parallel with Master Volume digital rheostat
Wire Wire Line
	4550 4350 4250 4350
Text GLabel 9000 5150 3    50   Input ~ 0
GND
Wire Wire Line
	4550 4350 4550 4750
Text GLabel 2900 6850 0    50   Input ~ 0
A_OUT_L
$EndSCHEMATC
