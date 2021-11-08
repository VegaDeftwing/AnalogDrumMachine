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
L Timer:LM555xM U1
U 1 1 617306A6
P 2750 2200
F 0 "U1" H 2750 2850 50  0000 C CNN
F 1 "LM555xM" H 2750 2750 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3600 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 3600 1800 50  0001 C CNN
	1    2750 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1750 2750 1750
Wire Wire Line
	2750 1800 2750 1750
Wire Wire Line
	2250 2400 1800 2400
Wire Wire Line
	1800 2400 1800 1750
Wire Wire Line
	2250 3950 1800 3950
Wire Wire Line
	1800 3950 1800 3300
Wire Wire Line
	2750 3350 2750 3300
Wire Wire Line
	2750 3300 1800 3300
Connection ~ 1800 3300
$Comp
L Device:C C2
U 1 1 61738DFE
P 2000 2000
F 0 "C2" V 2150 2000 50  0000 C CNN
F 1 "100n" V 1839 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 2038 1850 50  0001 C CNN
F 3 "~" H 2000 2000 50  0001 C CNN
	1    2000 2000
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 6173AB86
P 3500 4200
F 0 "C4" V 3650 4200 50  0000 C CNN
F 1 "100n" V 3339 4200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 3538 4050 50  0001 C CNN
F 3 "~" H 3500 4200 50  0001 C CNN
	1    3500 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 2400 3400 2400
Wire Wire Line
	3400 1500 2250 1500
Wire Wire Line
	2250 1500 2250 2000
Wire Wire Line
	2750 4150 2750 4200
Wire Wire Line
	2750 4200 1550 4200
Connection ~ 1550 4200
Wire Wire Line
	1550 4200 1550 4450
Wire Wire Line
	3400 2400 3400 1500
Wire Wire Line
	3850 2400 3850 2200
Wire Wire Line
	3850 2200 3250 2200
$Comp
L Device:R R4
U 1 1 6174F8BB
P 3650 2400
F 0 "R4" V 3750 2400 50  0000 C CNN
F 1 "1k" V 3534 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3580 2400 50  0001 C CNN
F 3 "~" H 3650 2400 50  0001 C CNN
	1    3650 2400
	0    1    1    0   
$EndComp
$Comp
L Timer:LM555xM U2
U 1 1 617312A2
P 2750 3750
F 0 "U2" H 2750 4400 50  0000 C CNN
F 1 "LM555xM" H 2750 4300 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3600 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 3600 3350 50  0001 C CNN
	1    2750 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2000 1550 2650
Wire Wire Line
	2750 2600 2750 2650
Wire Wire Line
	2750 2650 1550 2650
Connection ~ 1550 2650
Wire Wire Line
	1550 2650 1550 4200
Wire Wire Line
	3850 2400 3800 2400
Wire Wire Line
	3500 2400 3400 2400
Connection ~ 3400 2400
Wire Wire Line
	3250 2000 3950 2000
Wire Wire Line
	3950 2000 3950 2850
Wire Wire Line
	3950 2850 2150 2850
Wire Wire Line
	2150 2850 2150 3550
Wire Wire Line
	2150 3550 2250 3550
Wire Wire Line
	2150 2000 2250 2000
Connection ~ 2250 2000
Wire Wire Line
	1850 2000 1550 2000
Wire Wire Line
	1800 2400 1800 3300
Connection ~ 1800 2400
Wire Wire Line
	3250 3950 3500 3950
Wire Wire Line
	3500 4450 1550 4450
Wire Wire Line
	3500 4350 3500 4450
Wire Wire Line
	3500 4050 3500 3950
Wire Wire Line
	3250 3750 3500 3750
Wire Wire Line
	3500 3750 3500 3950
Connection ~ 3500 3950
$Comp
L Device:CP C5
U 1 1 61766331
P 3900 3550
F 0 "C5" V 4155 3550 50  0000 C CNN
F 1 "10u" V 4064 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 3938 3400 50  0001 C CNN
F 3 "~" H 3900 3550 50  0001 C CNN
	1    3900 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 3550 3750 3550
$Comp
L Timer:LM555xM U4
U 1 1 61777911
P 6550 2200
F 0 "U4" H 6550 2850 50  0000 C CNN
F 1 "LM555xM" H 6550 2750 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7400 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 7400 1800 50  0001 C CNN
	1    6550 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1750 6550 1750
Wire Wire Line
	6550 1800 6550 1750
Wire Wire Line
	6050 2400 5600 2400
Wire Wire Line
	5600 2400 5600 1750
Wire Wire Line
	6050 3950 5600 3950
Wire Wire Line
	5600 3950 5600 3300
Wire Wire Line
	6550 3350 6550 3300
Wire Wire Line
	6550 3300 5600 3300
Connection ~ 5600 3300
$Comp
L Device:C C6
U 1 1 61777928
P 5800 2000
F 0 "C6" V 5950 2000 50  0000 C CNN
F 1 "100n" V 5639 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 5838 1850 50  0001 C CNN
F 3 "~" H 5800 2000 50  0001 C CNN
	1    5800 2000
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 61777934
P 7300 4200
F 0 "C7" V 7450 4200 50  0000 C CNN
F 1 "100n" V 7139 4200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 7338 4050 50  0001 C CNN
F 3 "~" H 7300 4200 50  0001 C CNN
	1    7300 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7050 2400 7200 2400
Wire Wire Line
	7200 1500 6050 1500
Wire Wire Line
	6050 1500 6050 2000
Wire Wire Line
	7200 2400 7200 1500
Wire Wire Line
	7650 2400 7650 2200
Wire Wire Line
	7650 2200 7050 2200
$Comp
L Device:R R9
U 1 1 61777944
P 7450 2400
F 0 "R9" V 7550 2400 50  0000 C CNN
F 1 "1k" V 7334 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7380 2400 50  0001 C CNN
F 3 "~" H 7450 2400 50  0001 C CNN
	1    7450 2400
	0    1    1    0   
$EndComp
$Comp
L Timer:LM555xM U5
U 1 1 6177794A
P 6550 3750
F 0 "U5" H 6550 4400 50  0000 C CNN
F 1 "LM555xM" H 6550 4300 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7400 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 7400 3350 50  0001 C CNN
	1    6550 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2600 6550 2650
Wire Wire Line
	7650 2400 7600 2400
Wire Wire Line
	7300 2400 7200 2400
Connection ~ 7200 2400
Wire Wire Line
	5950 2850 5950 3550
Wire Wire Line
	5950 3550 6050 3550
Wire Wire Line
	5950 2000 6050 2000
Connection ~ 6050 2000
Wire Wire Line
	5650 2000 5350 2000
Wire Wire Line
	5600 2400 5600 3300
Connection ~ 5600 2400
Wire Wire Line
	7050 3950 7300 3950
Wire Wire Line
	7300 4050 7300 3950
Wire Wire Line
	7050 3750 7300 3750
Wire Wire Line
	7300 3750 7300 3950
Connection ~ 7300 3950
$Comp
L Device:CP 10u1
U 1 1 61777983
P 7700 3550
F 0 "10u1" V 7955 3550 50  0000 C CNN
F 1 "CP" V 7864 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 7738 3400 50  0001 C CNN
F 3 "~" H 7700 3550 50  0001 C CNN
	1    7700 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 3550 7550 3550
Text GLabel 8450 2400 2    50   Input ~ 0
APC2_IN
Text GLabel 8500 3550 2    50   Input ~ 0
APC2
Wire Wire Line
	7850 3550 8500 3550
$Comp
L Device:R R1
U 1 1 6179AB56
P 1900 5750
F 0 "R1" V 1693 5750 50  0000 C CNN
F 1 "330" V 1784 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1830 5750 50  0001 C CNN
F 3 "~" H 1900 5750 50  0001 C CNN
	1    1900 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 5750 2050 5750
Text GLabel 2000 5300 0    50   Input ~ 0
APC2
Wire Wire Line
	2000 5300 2250 5300
$Comp
L Device:C C3
U 1 1 617A0100
P 3300 5500
F 0 "C3" V 3450 5500 50  0000 C CNN
F 1 "22n" V 3139 5500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 3338 5350 50  0001 C CNN
F 3 "~" H 3300 5500 50  0001 C CNN
	1    3300 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 5300 3300 5300
Wire Wire Line
	3300 5300 3300 5350
Wire Wire Line
	3300 5650 3300 5750
Wire Wire Line
	2550 5750 3300 5750
Connection ~ 3300 5750
Wire Wire Line
	3300 5750 3300 5950
Wire Wire Line
	3900 5300 3300 5300
Connection ~ 3300 5300
Text GLabel 1350 5750 0    50   Input ~ 0
TRIG
Wire Wire Line
	1350 5750 1550 5750
Text Notes 3750 5600 0    50   ~ 0
LOW PASS GATE
$Comp
L Device:C C1
U 1 1 617B2C2D
P 1050 3550
F 0 "C1" V 1200 3550 50  0000 C CNN
F 1 "1m" V 889 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 1088 3400 50  0001 C CNN
F 3 "~" H 1050 3550 50  0001 C CNN
	1    1050 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 61775333
P 4350 2200
F 0 "R8" V 4143 2200 50  0000 C CNN
F 1 "1k" V 4234 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 2200 50  0001 C CNN
F 3 "~" H 4350 2200 50  0001 C CNN
	1    4350 2200
	0    1    1    0   
$EndComp
Text GLabel 4700 1750 3    50   Input ~ 0
Digi1
Text GLabel 6650 5700 2    50   Input ~ 0
Digi1
Wire Wire Line
	5600 1400 5600 1750
Connection ~ 5600 1750
Text GLabel 5650 5400 0    50   Input ~ 0
Digi2
$Comp
L Device:R R5
U 1 1 617A7559
P 3850 3950
F 0 "R5" V 3643 3950 50  0000 C CNN
F 1 "1k" V 3734 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3780 3950 50  0001 C CNN
F 3 "~" H 3850 3950 50  0001 C CNN
	1    3850 3950
	0    -1   1    0   
$EndComp
Text GLabel 4300 4000 1    50   Input ~ 0
Digi2
Wire Wire Line
	3500 3950 3700 3950
Wire Wire Line
	7500 3950 7300 3950
Text GLabel 8400 1750 3    50   Input ~ 0
Digi3
Text GLabel 8450 5700 2    50   Input ~ 0
Digi3
Wire Wire Line
	7950 6050 7950 6000
Wire Wire Line
	7850 6000 7850 6050
Text GLabel 7450 5400 0    50   Input ~ 0
Digi4
Text GLabel 10250 5700 2    50   Input ~ 0
APC1_OUT
Wire Wire Line
	9750 6050 9750 6000
Wire Wire Line
	9650 6000 9650 6050
Text GLabel 9650 6050 3    50   Input ~ 0
APC2_IN
Text GLabel 10250 5300 2    50   Input ~ 0
SCL
Text GLabel 8450 5300 2    50   Input ~ 0
SCL
Text GLabel 6650 5300 2    50   Input ~ 0
SCL
Text GLabel 6650 5400 2    50   Input ~ 0
SDA
Text GLabel 8450 5400 2    50   Input ~ 0
SDA
Text GLabel 10250 5400 2    50   Input ~ 0
SDA
Text GLabel 6150 5000 1    50   Input ~ 0
A0
Text GLabel 5650 5300 0    50   Input ~ 0
A1
Text GLabel 7450 5300 0    50   Input ~ 0
A3
Text GLabel 7950 5000 1    50   Input ~ 0
A2
Text GLabel 9750 5000 1    50   Input ~ 0
A4
Text GLabel 9250 5300 0    50   Input ~ 0
A5
NoConn ~ 6050 2200
NoConn ~ 6050 3750
NoConn ~ 2250 3750
NoConn ~ 2250 2200
$Comp
L Device:R R16
U 1 1 6186DF81
P 9700 2550
F 0 "R16" V 9800 2550 50  0000 C CNN
F 1 "10k" V 9584 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9630 2550 50  0001 C CNN
F 3 "~" H 9700 2550 50  0001 C CNN
	1    9700 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 6186E12C
P 10000 2550
F 0 "R17" V 10100 2550 50  0000 C CNN
F 1 "10k" V 9884 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9930 2550 50  0001 C CNN
F 3 "~" H 10000 2550 50  0001 C CNN
	1    10000 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 6186E489
P 10300 2550
F 0 "R18" V 10400 2550 50  0000 C CNN
F 1 "10k" V 10184 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 2550 50  0001 C CNN
F 3 "~" H 10300 2550 50  0001 C CNN
	1    10300 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 6186E63E
P 10600 2550
F 0 "R19" V 10700 2550 50  0000 C CNN
F 1 "10k" V 10484 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10530 2550 50  0001 C CNN
F 3 "~" H 10600 2550 50  0001 C CNN
	1    10600 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 6186D3F4
P 9400 2550
F 0 "R15" V 9500 2550 50  0000 C CNN
F 1 "10k" V 9284 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9330 2550 50  0001 C CNN
F 3 "~" H 9400 2550 50  0001 C CNN
	1    9400 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 6186E88C
P 10900 2550
F 0 "R20" V 11000 2550 50  0000 C CNN
F 1 "10k" V 10784 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10830 2550 50  0001 C CNN
F 3 "~" H 10900 2550 50  0001 C CNN
	1    10900 2550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10900 2400 10600 2400
Connection ~ 9700 2400
Wire Wire Line
	9700 2400 9400 2400
Connection ~ 10000 2400
Wire Wire Line
	10000 2400 9700 2400
Connection ~ 10300 2400
Wire Wire Line
	10300 2400 10000 2400
Connection ~ 10600 2400
Wire Wire Line
	10600 2400 10300 2400
Wire Wire Line
	9400 2250 9400 2400
Connection ~ 9400 2400
Text GLabel 9650 2900 0    50   Input ~ 0
A0
Text GLabel 9650 3000 0    50   Input ~ 0
A1
Text GLabel 9650 3100 0    50   Input ~ 0
A2
Text GLabel 9650 3200 0    50   Input ~ 0
A3
Text GLabel 9650 3300 0    50   Input ~ 0
A4
Text GLabel 9650 3400 0    50   Input ~ 0
A5
Wire Wire Line
	10300 2700 10200 2700
Wire Wire Line
	10100 2700 10000 2700
Wire Wire Line
	10300 2750 10600 2750
Wire Wire Line
	10600 2750 10600 2700
Wire Wire Line
	10400 2800 10900 2800
Wire Wire Line
	10900 2800 10900 2700
Wire Wire Line
	10000 2750 9700 2750
Wire Wire Line
	9700 2750 9700 2700
Wire Wire Line
	9900 2800 9400 2800
Wire Wire Line
	9400 2800 9400 2700
Wire Wire Line
	9900 2800 9900 2900
Wire Wire Line
	9900 2900 9650 2900
Wire Wire Line
	9650 3000 10000 3000
Wire Wire Line
	9650 3100 10100 3100
Wire Wire Line
	9650 3200 10200 3200
Wire Wire Line
	9650 3400 10400 3400
Wire Wire Line
	10400 3400 10400 2800
Wire Wire Line
	9650 3300 10300 3300
Connection ~ 9900 2900
Connection ~ 10000 3000
Connection ~ 10100 3100
Connection ~ 10200 3200
Connection ~ 10300 3300
Connection ~ 10400 3400
$Comp
L Switch:SW_DIP_x06 SW1
U 1 1 61956944
P 10100 3850
F 0 "SW1" V 10054 4280 50  0000 L CNN
F 1 "SW_DIP_x06" V 10145 4280 50  0000 L CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx06_Slide_6.7x16.8mm_W7.62mm_P2.54mm_LowProfile" H 10100 3850 50  0001 C CNN
F 3 "~" H 10100 3850 50  0001 C CNN
	1    10100 3850
	0    1    1    0   
$EndComp
Text Notes 5800 700  0    50   ~ 0
TRIGGER IS 3.3V, DOES THAT MEAN THE 5V IS REPLACED WITH 3.3V AS WELL?
$Comp
L Potentiometer_Digital:MCP46x2 U3
U 1 1 617A02FD
P 6150 5500
F 0 "U3" H 6450 6100 50  0000 C CNN
F 1 "MCP46x2" H 6450 6000 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 6900 5050 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf" H 6150 5500 50  0001 C CNN
	1    6150 5500
	1    0    0    -1  
$EndComp
$Comp
L Potentiometer_Digital:MCP46x2 U6
U 1 1 617A1DE5
P 7950 5500
F 0 "U6" H 8250 6100 50  0000 C CNN
F 1 "MCP46x2" H 8250 6000 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 8700 5050 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf" H 7950 5500 50  0001 C CNN
	1    7950 5500
	1    0    0    -1  
$EndComp
$Comp
L Potentiometer_Digital:MCP46x2 U7
U 1 1 617A2587
P 9750 5500
F 0 "U7" H 10050 6100 50  0000 C CNN
F 1 "MCP46x2" H 10050 6000 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 10500 5050 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf" H 9750 5500 50  0001 C CNN
	1    9750 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 617A978D
P 2400 5300
F 0 "R2" V 2193 5300 50  0000 C CNN
F 1 "1k" V 2284 5300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2330 5300 50  0001 C CNN
F 3 "~" H 2400 5300 50  0001 C CNN
	1    2400 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 617A9A7D
P 2400 5750
F 0 "R3" V 2193 5750 50  0000 C CNN
F 1 "1k" V 2284 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2330 5750 50  0001 C CNN
F 3 "~" H 2400 5750 50  0001 C CNN
	1    2400 5750
	0    1    1    0   
$EndComp
Text Notes 1550 5050 0    50   ~ 0
PHOTORESISTOR (1000 Ohms Approx when LED on)
Text Notes 6050 800  0    50   ~ 0
BYPASS CAPS FOR ALL THREE POWERS?\n
Text GLabel 9450 1000 1    50   Input ~ 0
A_OUT_L
Text GLabel 9450 1500 3    50   Input ~ 0
A_OUT_L
Text GLabel 9750 1000 1    50   Input ~ 0
GND
Text GLabel 9750 1500 3    50   Input ~ 0
GND
Text GLabel 9850 1000 1    50   Input ~ 0
+12V
Text GLabel 9850 1500 3    50   Input ~ 0
+12V
Text GLabel 9950 1500 3    50   Input ~ 0
-12V
Text GLabel 9950 1000 1    50   Input ~ 0
-12V
Text GLabel 10050 1000 1    50   Input ~ 0
GND
Text GLabel 10050 1500 3    50   Input ~ 0
GND
Text GLabel 10150 1500 3    50   Input ~ 0
5V
Text GLabel 10150 1000 1    50   Input ~ 0
5V
Text GLabel 10250 1000 1    50   Input ~ 0
DET
Text GLabel 10250 1500 3    50   Input ~ 0
DET
Text GLabel 10350 1500 3    50   Input ~ 0
SDA
Text GLabel 10350 1000 1    50   Input ~ 0
SDA
Text GLabel 10450 1000 1    50   Input ~ 0
SCL
Text GLabel 10450 1500 3    50   Input ~ 0
SCL
Text GLabel 10550 1500 3    50   Input ~ 0
TRIG
Text GLabel 10550 1000 1    50   Input ~ 0
TRIG
Text GLabel 9400 2250 1    50   Input ~ 0
5V
Text GLabel 9900 4150 3    50   Input ~ 0
GND
Text GLabel 9200 5600 0    50   Input ~ 0
5V
Text GLabel 9750 6050 3    50   Input ~ 0
GND
Text GLabel 7850 6050 3    50   Input ~ 0
5V
Text GLabel 7400 5700 0    50   Input ~ 0
5V
Text GLabel 7400 5600 0    50   Input ~ 0
5V
Text GLabel 7950 6050 3    50   Input ~ 0
GND
Text GLabel 5550 5600 0    50   Input ~ 0
5V
Text GLabel 5550 5700 0    50   Input ~ 0
5V
Text GLabel 6050 6100 3    50   Input ~ 0
5V
Text GLabel 6150 6100 3    50   Input ~ 0
GND
Text GLabel 4750 6850 2    50   Input ~ 0
A_OUT_L
Text GLabel 3300 5950 3    50   Input ~ 0
GND
Wire Wire Line
	7050 2000 7750 2000
Wire Wire Line
	7750 2000 7750 2850
Wire Wire Line
	7750 2850 5950 2850
Wire Wire Line
	5350 2000 5350 2650
Wire Wire Line
	6550 2650 5350 2650
Connection ~ 5350 2650
Wire Wire Line
	7300 4350 7300 4450
Wire Wire Line
	7300 4450 5350 4450
Text GLabel 5350 4550 3    50   Input ~ 0
GND
Wire Wire Line
	5350 2650 5350 4200
Wire Wire Line
	5350 4200 5350 4450
Connection ~ 5350 4200
Wire Wire Line
	6550 4200 5350 4200
Wire Wire Line
	6550 4150 6550 4200
Text GLabel 5600 1400 1    50   Input ~ 0
5V
Text GLabel 4450 3550 2    50   Input ~ 0
APC1_OUT
Wire Wire Line
	5350 4550 5350 4450
Connection ~ 5350 4450
Text GLabel 1550 4550 3    50   Input ~ 0
GND
Wire Wire Line
	1550 4550 1550 4450
Connection ~ 1550 4450
Text GLabel 1800 1400 1    50   Input ~ 0
5V
Wire Wire Line
	1800 1400 1800 1750
Connection ~ 1800 1750
Text GLabel 1050 3400 1    50   Input ~ 0
5V
Text GLabel 1050 3700 3    50   Input ~ 0
GND
Text GLabel 9550 1500 3    50   Input ~ 0
A_OUT_R
Text GLabel 9550 1000 1    50   Input ~ 0
A_OUT_R
Text GLabel 9650 1000 1    50   Input ~ 0
A_IN
Text GLabel 9650 1500 3    50   Input ~ 0
A_IN
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 617D244E
P 4800 1450
F 0 "J4" V 4764 1262 50  0000 R CNN
F 1 "Conn_01x03" V 4673 1262 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4800 1450 50  0001 C CNN
F 3 "~" H 4800 1450 50  0001 C CNN
	1    4800 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 2200 3850 2200
Connection ~ 3850 2200
Wire Wire Line
	4500 2200 4800 2200
Wire Wire Line
	4800 1650 4800 2200
Wire Wire Line
	4700 1750 4700 1650
Wire Wire Line
	4300 4000 4300 4100
$Comp
L Device:R R10
U 1 1 61812684
P 8050 2200
F 0 "R10" V 7843 2200 50  0000 C CNN
F 1 "1k" V 7934 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7980 2200 50  0001 C CNN
F 3 "~" H 8050 2200 50  0001 C CNN
	1    8050 2200
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 6181268B
P 8500 1450
F 0 "J7" V 8464 1262 50  0000 R CNN
F 1 "Conn_01x03" V 8373 1262 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 8500 1450 50  0001 C CNN
F 3 "~" H 8500 1450 50  0001 C CNN
	1    8500 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8200 2200 8500 2200
Wire Wire Line
	8500 1650 8500 2200
Wire Wire Line
	8400 1750 8400 1650
Wire Wire Line
	7900 2200 7650 2200
Connection ~ 7650 2200
$Comp
L Device:R R7
U 1 1 6182AA89
P 7650 3950
F 0 "R7" V 7443 3950 50  0000 C CNN
F 1 "1k" V 7534 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7580 3950 50  0001 C CNN
F 3 "~" H 7650 3950 50  0001 C CNN
	1    7650 3950
	0    -1   1    0   
$EndComp
Text GLabel 8100 4000 1    50   Input ~ 0
Digi4
Wire Wire Line
	7800 3950 8000 3950
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 6182AA91
P 8000 4300
F 0 "J6" V 7872 4480 50  0000 L CNN
F 1 "Conn_01x03" V 7963 4480 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 8000 4300 50  0001 C CNN
F 3 "~" H 8000 4300 50  0001 C CNN
	1    8000 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	8000 3950 8000 4100
Wire Wire Line
	8100 4000 8100 4100
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 618308EB
P 8000 2700
F 0 "J5" V 7872 2880 50  0000 L CNN
F 1 "Conn_01x03" V 7963 2880 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 8000 2700 50  0001 C CNN
F 3 "~" H 8000 2700 50  0001 C CNN
	1    8000 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2400 8000 2400
Wire Wire Line
	8000 2400 8000 2500
Connection ~ 7650 2400
Wire Wire Line
	8100 2500 8100 2400
Wire Wire Line
	8100 2400 8450 2400
NoConn ~ 7900 2500
NoConn ~ 8600 1650
NoConn ~ 4900 1650
NoConn ~ 12650 5700
$Comp
L Amplifier_Operational:TL072 U8
U 1 1 617DD6F7
P 2650 6850
F 0 "U8" H 2650 7217 50  0000 C CNN
F 1 "TL072" H 2650 7126 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 2650 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2650 6850 50  0001 C CNN
	1    2650 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 617DF1E9
P 1950 6750
F 0 "C9" V 2100 6750 50  0000 C CNN
F 1 "100n" V 1789 6750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 1988 6600 50  0001 C CNN
F 3 "~" H 1950 6750 50  0001 C CNN
	1    1950 6750
	0    -1   -1   0   
$EndComp
Text GLabel 3900 5300 2    50   Input ~ 0
LPG_OUT
Text GLabel 1700 6750 0    50   Input ~ 0
LPG_OUT
Wire Wire Line
	2950 6850 3150 6850
Wire Wire Line
	2300 6950 2350 6950
$Comp
L Amplifier_Operational:TL072 U8
U 2 1 61834C36
P 1550 7400
F 0 "U8" H 1550 7767 50  0000 C CNN
F 1 "TL072" H 1550 7676 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 1550 7400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 1550 7400 50  0001 C CNN
	2    1550 7400
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U8
U 3 1 618377D6
P 1100 6550
F 0 "U8" H 1058 6596 50  0000 L CNN
F 1 "TL072" H 1058 6505 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 1100 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 1100 6550 50  0001 C CNN
	3    1100 6550
	1    0    0    -1  
$EndComp
Text GLabel 1000 6200 1    50   Input ~ 0
+12V
Text GLabel 1000 6900 3    50   Input ~ 0
-12V
NoConn ~ 1850 7400
NoConn ~ 1250 7500
NoConn ~ 1250 7300
$Comp
L Device:CP C11
U 1 1 61859462
P 3600 6850
F 0 "C11" V 3855 6850 50  0000 C CNN
F 1 "1u" V 3764 6850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 3638 6700 50  0001 C CNN
F 3 "~" H 3600 6850 50  0001 C CNN
	1    3600 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 6850 3150 6850
Connection ~ 3150 6850
$Comp
L Device:R R6
U 1 1 618623D3
P 4100 6850
F 0 "R6" V 3893 6850 50  0000 C CNN
F 1 "1k" V 3984 6850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4030 6850 50  0001 C CNN
F 3 "~" H 4100 6850 50  0001 C CNN
	1    4100 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 6850 3750 6850
Wire Wire Line
	4750 6850 4600 6850
Text GLabel 9250 5400 0    50   Input ~ 0
BUFFER_POT
Text GLabel 9200 5700 0    50   Input ~ 0
GND
Text GLabel 4600 7050 3    50   Input ~ 0
BUFFER_POT
Wire Wire Line
	4600 7050 4600 6850
Connection ~ 4600 6850
Wire Wire Line
	4600 6850 4400 6850
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 6187A4A6
P 4100 7350
F 0 "J2" V 4100 7550 50  0000 L CNN
F 1 "Conn_01x03" V 4200 7200 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4100 7350 50  0001 C CNN
F 3 "~" H 4100 7350 50  0001 C CNN
	1    4100 7350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 7350 4400 7350
Wire Wire Line
	4400 7350 4400 6850
Connection ~ 4400 6850
Wire Wire Line
	4400 6850 4250 6850
NoConn ~ 4300 7250
Text GLabel 4300 7550 3    50   Input ~ 0
GND
Wire Wire Line
	4300 7550 4300 7450
Text GLabel 1550 6350 3    50   Input ~ 0
GND
Wire Wire Line
	1550 5900 1550 5750
Connection ~ 1550 5750
Wire Wire Line
	1550 5750 1750 5750
Wire Wire Line
	1550 6200 1550 6350
Wire Wire Line
	2100 6750 2350 6750
Wire Wire Line
	1800 6750 1700 6750
$Comp
L Device:CP C8
U 1 1 6184635B
P 1550 6050
F 0 "C8" V 1805 6050 50  0000 C CNN
F 1 "100u" V 1714 6050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 1588 5900 50  0001 C CNN
F 3 "~" H 1550 6050 50  0001 C CNN
	1    1550 6050
	1    0    0    -1  
$EndComp
Text Notes 2350 5950 0    50   ~ 0
LED
$Comp
L Device:C C10
U 1 1 61846FA1
P 2900 7150
F 0 "C10" V 3050 7150 50  0000 C CNN
F 1 "100n" V 2739 7150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 2938 7000 50  0001 C CNN
F 3 "~" H 2900 7150 50  0001 C CNN
	1    2900 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 7150 3050 7150
Wire Wire Line
	3150 6850 3150 7150
Wire Wire Line
	2750 7150 2300 7150
Wire Wire Line
	2300 6950 2300 7150
$Comp
L Connector_Generic:Conn_02x12_Odd_Even J1
U 1 1 61926EBE
P 9950 1300
F 0 "J1" V 10046 612 50  0000 R CNN
F 1 "Conn_02x12_Odd_Even" V 9955 612 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x12_P2.54mm_Vertical" H 9950 1300 50  0001 C CNN
F 3 "~" H 9950 1300 50  0001 C CNN
	1    9950 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9900 2900 9900 3550
Text GLabel 10000 4150 3    50   Input ~ 0
GND
Text GLabel 10100 4150 3    50   Input ~ 0
GND
Text GLabel 10200 4150 3    50   Input ~ 0
GND
Text GLabel 10300 4150 3    50   Input ~ 0
GND
Text GLabel 10400 4150 3    50   Input ~ 0
GND
Wire Wire Line
	10400 3400 10400 3550
Wire Wire Line
	10300 3300 10300 3550
Wire Wire Line
	10200 3200 10200 3550
Wire Wire Line
	10100 3100 10100 3550
Wire Wire Line
	10000 3000 10000 3550
$Comp
L power:GND #PWR0101
U 1 1 6197B6A1
P 9750 2000
F 0 "#PWR0101" H 9750 1750 50  0001 C CNN
F 1 "GND" H 9755 1827 50  0000 C CNN
F 2 "" H 9750 2000 50  0001 C CNN
F 3 "" H 9750 2000 50  0001 C CNN
	1    9750 2000
	1    0    0    -1  
$EndComp
Text GLabel 9750 2000 1    50   Input ~ 0
GND
$Comp
L power:+12V #PWR0102
U 1 1 6197D9C5
P 10100 2050
F 0 "#PWR0102" H 10100 1900 50  0001 C CNN
F 1 "+12V" H 10115 2223 50  0000 C CNN
F 2 "" H 10100 2050 50  0001 C CNN
F 3 "" H 10100 2050 50  0001 C CNN
	1    10100 2050
	-1   0    0    1   
$EndComp
$Comp
L power:-12V #PWR0103
U 1 1 6197EE97
P 10300 2050
F 0 "#PWR0103" H 10300 2150 50  0001 C CNN
F 1 "-12V" H 10315 2223 50  0000 C CNN
F 2 "" H 10300 2050 50  0001 C CNN
F 3 "" H 10300 2050 50  0001 C CNN
	1    10300 2050
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 6197FEDC
P 10500 2050
F 0 "#PWR0104" H 10500 1900 50  0001 C CNN
F 1 "+5V" H 10515 2223 50  0000 C CNN
F 2 "" H 10500 2050 50  0001 C CNN
F 3 "" H 10500 2050 50  0001 C CNN
	1    10500 2050
	-1   0    0    1   
$EndComp
Text GLabel 10500 2000 1    50   Input ~ 0
5V
Text GLabel 10100 2000 1    50   Input ~ 0
+12V
Text GLabel 10300 2000 1    50   Input ~ 0
-12V
Wire Wire Line
	10100 2050 10100 2000
Wire Wire Line
	10500 2050 10500 2000
Wire Wire Line
	10300 2050 10300 2000
Wire Wire Line
	1000 6850 1000 6900
Wire Wire Line
	1000 6250 1000 6200
Wire Wire Line
	6050 6000 6050 6100
Wire Wire Line
	6150 6100 6150 6000
Wire Wire Line
	5650 5700 5550 5700
Wire Wire Line
	5550 5600 5650 5600
Wire Wire Line
	7450 5700 7400 5700
Wire Wire Line
	7450 5600 7400 5600
Wire Wire Line
	9250 5600 9200 5600
Wire Wire Line
	9250 5700 9200 5700
NoConn ~ 7900 4100
Wire Wire Line
	10200 2700 10200 3200
Wire Wire Line
	10100 2700 10100 3100
Wire Wire Line
	10300 2750 10300 3300
Wire Wire Line
	10000 2750 10000 3000
Wire Wire Line
	4050 3550 4450 3550
Wire Wire Line
	4000 3950 4200 3950
Wire Wire Line
	4200 3950 4200 4100
NoConn ~ 4100 4100
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 617D1A8D
P 4200 4300
F 0 "J3" V 4072 4480 50  0000 L CNN
F 1 "Conn_01x03" V 4163 4480 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4200 4300 50  0001 C CNN
F 3 "~" H 4200 4300 50  0001 C CNN
	1    4200 4300
	0    1    1    0   
$EndComp
$EndSCHEMATC
