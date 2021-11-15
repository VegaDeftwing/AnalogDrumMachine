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
P 2400 1650
F 0 "U1" H 2400 2300 50  0000 C CNN
F 1 "LM555xM" H 2400 2200 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3250 1250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 3250 1250 50  0001 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1200 2400 1200
Wire Wire Line
	2400 1250 2400 1200
Wire Wire Line
	1900 1850 1450 1850
Wire Wire Line
	1450 1850 1450 1200
Wire Wire Line
	1900 3400 1450 3400
Wire Wire Line
	1450 3400 1450 2750
Wire Wire Line
	2400 2800 2400 2750
Wire Wire Line
	2400 2750 1450 2750
Connection ~ 1450 2750
$Comp
L Device:C C2
U 1 1 61738DFE
P 1650 1450
F 0 "C2" V 1800 1450 50  0000 C CNN
F 1 "100n" V 1489 1450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 1688 1300 50  0001 C CNN
F 3 "~" H 1650 1450 50  0001 C CNN
	1    1650 1450
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 6173AB86
P 3150 3650
F 0 "C4" V 3300 3650 50  0000 C CNN
F 1 "100n" V 2989 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 3188 3500 50  0001 C CNN
F 3 "~" H 3150 3650 50  0001 C CNN
	1    3150 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 1850 3050 1850
Wire Wire Line
	3050 950  1900 950 
Wire Wire Line
	1900 950  1900 1450
Wire Wire Line
	2400 3600 2400 3650
Wire Wire Line
	2400 3650 1200 3650
Connection ~ 1200 3650
Wire Wire Line
	1200 3650 1200 3900
Wire Wire Line
	3050 1850 3050 950 
Wire Wire Line
	3500 1850 3500 1650
Wire Wire Line
	3500 1650 2900 1650
$Comp
L Device:R R4
U 1 1 6174F8BB
P 3300 1850
F 0 "R4" V 3400 1850 50  0000 C CNN
F 1 "1k" V 3184 1850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3230 1850 50  0001 C CNN
F 3 "~" H 3300 1850 50  0001 C CNN
	1    3300 1850
	0    1    1    0   
$EndComp
$Comp
L Timer:LM555xM U2
U 1 1 617312A2
P 2400 3200
F 0 "U2" H 2400 3850 50  0000 C CNN
F 1 "LM555xM" H 2400 3750 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3250 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 3250 2800 50  0001 C CNN
	1    2400 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 1450 1200 2100
Wire Wire Line
	2400 2050 2400 2100
Wire Wire Line
	2400 2100 1200 2100
Connection ~ 1200 2100
Wire Wire Line
	1200 2100 1200 3650
Wire Wire Line
	3500 1850 3450 1850
Wire Wire Line
	3150 1850 3050 1850
Connection ~ 3050 1850
Wire Wire Line
	2900 1450 3600 1450
Wire Wire Line
	3600 1450 3600 2300
Wire Wire Line
	3600 2300 1800 2300
Wire Wire Line
	1800 2300 1800 3000
Wire Wire Line
	1800 3000 1900 3000
Wire Wire Line
	1800 1450 1900 1450
Connection ~ 1900 1450
Wire Wire Line
	1500 1450 1200 1450
Wire Wire Line
	1450 1850 1450 2750
Connection ~ 1450 1850
Wire Wire Line
	2900 3400 3150 3400
Wire Wire Line
	3150 3900 1200 3900
Wire Wire Line
	3150 3800 3150 3900
Wire Wire Line
	3150 3500 3150 3400
Wire Wire Line
	2900 3200 3150 3200
Wire Wire Line
	3150 3200 3150 3400
Connection ~ 3150 3400
$Comp
L Device:CP C5
U 1 1 61766331
P 3550 3000
F 0 "C5" V 3805 3000 50  0000 C CNN
F 1 "10u" V 3714 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 3588 2850 50  0001 C CNN
F 3 "~" H 3550 3000 50  0001 C CNN
	1    3550 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2900 3000 3400 3000
$Comp
L Timer:LM555xM U4
U 1 1 61777911
P 6200 1650
F 0 "U4" H 6200 2300 50  0000 C CNN
F 1 "LM555xM" H 6200 2200 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7050 1250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 7050 1250 50  0001 C CNN
	1    6200 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1200 6200 1200
Wire Wire Line
	6200 1250 6200 1200
Wire Wire Line
	5700 1850 5250 1850
Wire Wire Line
	5250 1850 5250 1200
Wire Wire Line
	5700 3400 5250 3400
Wire Wire Line
	5250 3400 5250 2750
Wire Wire Line
	6200 2800 6200 2750
Wire Wire Line
	6200 2750 5250 2750
Connection ~ 5250 2750
$Comp
L Device:C C6
U 1 1 61777928
P 5450 1450
F 0 "C6" V 5600 1450 50  0000 C CNN
F 1 "100n" V 5289 1450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 5488 1300 50  0001 C CNN
F 3 "~" H 5450 1450 50  0001 C CNN
	1    5450 1450
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 61777934
P 6950 3650
F 0 "C7" V 7100 3650 50  0000 C CNN
F 1 "100n" V 6789 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 6988 3500 50  0001 C CNN
F 3 "~" H 6950 3650 50  0001 C CNN
	1    6950 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 1850 6850 1850
Wire Wire Line
	6850 950  5700 950 
Wire Wire Line
	5700 950  5700 1450
Wire Wire Line
	6850 1850 6850 950 
Wire Wire Line
	7300 1850 7300 1650
Wire Wire Line
	7300 1650 6700 1650
$Comp
L Device:R R9
U 1 1 61777944
P 7100 1850
F 0 "R9" V 7200 1850 50  0000 C CNN
F 1 "1k" V 6984 1850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7030 1850 50  0001 C CNN
F 3 "~" H 7100 1850 50  0001 C CNN
	1    7100 1850
	0    1    1    0   
$EndComp
$Comp
L Timer:LM555xM U5
U 1 1 6177794A
P 6200 3200
F 0 "U5" H 6200 3850 50  0000 C CNN
F 1 "LM555xM" H 6200 3750 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7050 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm555.pdf" H 7050 2800 50  0001 C CNN
	1    6200 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2050 6200 2100
Wire Wire Line
	7300 1850 7250 1850
Wire Wire Line
	6950 1850 6850 1850
Connection ~ 6850 1850
Wire Wire Line
	5600 2300 5600 3000
Wire Wire Line
	5600 3000 5700 3000
Wire Wire Line
	5600 1450 5700 1450
Connection ~ 5700 1450
Wire Wire Line
	5300 1450 5000 1450
Wire Wire Line
	5250 1850 5250 2750
Connection ~ 5250 1850
Wire Wire Line
	6700 3400 6950 3400
Wire Wire Line
	6950 3500 6950 3400
Wire Wire Line
	6700 3200 6950 3200
Wire Wire Line
	6950 3200 6950 3400
Connection ~ 6950 3400
$Comp
L Device:CP 10u1
U 1 1 61777983
P 7350 3000
F 0 "10u1" V 7605 3000 50  0000 C CNN
F 1 "CP" V 7514 3000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 7388 2850 50  0001 C CNN
F 3 "~" H 7350 3000 50  0001 C CNN
	1    7350 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6700 3000 7200 3000
Text GLabel 8100 1850 2    50   Input ~ 0
APC2_IN
Text GLabel 8150 3000 2    50   Input ~ 0
APC2
Wire Wire Line
	7500 3000 8150 3000
$Comp
L Device:R R1
U 1 1 6179AB56
P 1450 5000
F 0 "R1" V 1243 5000 50  0000 C CNN
F 1 "330" V 1334 5000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1380 5000 50  0001 C CNN
F 3 "~" H 1450 5000 50  0001 C CNN
	1    1450 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 5000 1600 5000
Text GLabel 1550 4550 0    50   Input ~ 0
APC2
Wire Wire Line
	1550 4550 1800 4550
Text GLabel 900  5000 0    50   Input ~ 0
TRIG
Wire Wire Line
	900  5000 1100 5000
$Comp
L Device:C C1
U 1 1 617B2C2D
P 750 2650
F 0 "C1" V 900 2650 50  0000 C CNN
F 1 "1m" V 589 2650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 788 2500 50  0001 C CNN
F 3 "~" H 750 2650 50  0001 C CNN
	1    750  2650
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 61775333
P 4000 1650
F 0 "R8" V 3793 1650 50  0000 C CNN
F 1 "1k" V 3884 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3930 1650 50  0001 C CNN
F 3 "~" H 4000 1650 50  0001 C CNN
	1    4000 1650
	0    1    1    0   
$EndComp
Text GLabel 4350 1200 3    50   Input ~ 0
Digi1
Text GLabel 7450 5750 2    50   Input ~ 0
Digi1
Wire Wire Line
	5250 850  5250 1200
Connection ~ 5250 1200
Text GLabel 6450 5450 0    50   Input ~ 0
Digi2
$Comp
L Device:R R5
U 1 1 617A7559
P 3500 3400
F 0 "R5" V 3293 3400 50  0000 C CNN
F 1 "1k" V 3384 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3430 3400 50  0001 C CNN
F 3 "~" H 3500 3400 50  0001 C CNN
	1    3500 3400
	0    -1   1    0   
$EndComp
Text GLabel 3950 3450 1    50   Input ~ 0
Digi2
Wire Wire Line
	3150 3400 3350 3400
Wire Wire Line
	7150 3400 6950 3400
Text GLabel 8050 1200 3    50   Input ~ 0
Digi3
Text GLabel 8950 5750 2    50   Input ~ 0
Digi3
Wire Wire Line
	8450 6100 8450 6050
Wire Wire Line
	8350 6050 8350 6100
Text GLabel 7950 5450 0    50   Input ~ 0
Digi4
Text GLabel 10750 5750 2    50   Input ~ 0
APC1_OUT
Wire Wire Line
	10250 6100 10250 6050
Wire Wire Line
	10150 6050 10150 6100
Text GLabel 10150 6100 3    50   Input ~ 0
APC2_IN
Text GLabel 10750 5350 2    50   Input ~ 0
SCL
Text GLabel 8950 5350 2    50   Input ~ 0
SCL
Text GLabel 7450 5350 2    50   Input ~ 0
SCL
Text GLabel 7450 5450 2    50   Input ~ 0
SDA
Text GLabel 8950 5450 2    50   Input ~ 0
SDA
Text GLabel 10750 5450 2    50   Input ~ 0
SDA
Text GLabel 6950 5050 1    50   Input ~ 0
A0
Text GLabel 6450 5350 0    50   Input ~ 0
A1
Text GLabel 7950 5350 0    50   Input ~ 0
A3
Text GLabel 8450 5050 1    50   Input ~ 0
A2
Text GLabel 10250 5050 1    50   Input ~ 0
A4
Text GLabel 9750 5350 0    50   Input ~ 0
A5
NoConn ~ 5700 1650
NoConn ~ 5700 3200
NoConn ~ 1900 3200
NoConn ~ 1900 1650
$Comp
L Device:R R16
U 1 1 6186DF81
P 9700 2750
F 0 "R16" V 9800 2750 50  0000 C CNN
F 1 "10k" V 9584 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9630 2750 50  0001 C CNN
F 3 "~" H 9700 2750 50  0001 C CNN
	1    9700 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 6186E12C
P 10000 2750
F 0 "R17" V 10100 2750 50  0000 C CNN
F 1 "10k" V 9884 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9930 2750 50  0001 C CNN
F 3 "~" H 10000 2750 50  0001 C CNN
	1    10000 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 6186E489
P 10300 2750
F 0 "R18" V 10400 2750 50  0000 C CNN
F 1 "10k" V 10184 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10230 2750 50  0001 C CNN
F 3 "~" H 10300 2750 50  0001 C CNN
	1    10300 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 6186E63E
P 10600 2750
F 0 "R19" V 10700 2750 50  0000 C CNN
F 1 "10k" V 10484 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10530 2750 50  0001 C CNN
F 3 "~" H 10600 2750 50  0001 C CNN
	1    10600 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 6186D3F4
P 9400 2750
F 0 "R15" V 9500 2750 50  0000 C CNN
F 1 "10k" V 9284 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9330 2750 50  0001 C CNN
F 3 "~" H 9400 2750 50  0001 C CNN
	1    9400 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 6186E88C
P 10900 2750
F 0 "R20" V 11000 2750 50  0000 C CNN
F 1 "10k" V 10784 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10830 2750 50  0001 C CNN
F 3 "~" H 10900 2750 50  0001 C CNN
	1    10900 2750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10900 2600 10600 2600
Connection ~ 9700 2600
Wire Wire Line
	9700 2600 9400 2600
Connection ~ 10000 2600
Wire Wire Line
	10000 2600 9700 2600
Connection ~ 10300 2600
Wire Wire Line
	10300 2600 10000 2600
Connection ~ 10600 2600
Wire Wire Line
	10600 2600 10300 2600
Text GLabel 9650 3100 0    50   Input ~ 0
A0
Text GLabel 9650 3200 0    50   Input ~ 0
A1
Text GLabel 9650 3300 0    50   Input ~ 0
A2
Text GLabel 9650 3400 0    50   Input ~ 0
A3
Text GLabel 9650 3500 0    50   Input ~ 0
A4
Text GLabel 9650 3600 0    50   Input ~ 0
A5
Wire Wire Line
	10300 2900 10200 2900
Wire Wire Line
	10100 2900 10000 2900
Wire Wire Line
	10300 2950 10600 2950
Wire Wire Line
	10600 2950 10600 2900
Wire Wire Line
	10400 3000 10900 3000
Wire Wire Line
	10900 3000 10900 2900
Wire Wire Line
	10000 2950 9700 2950
Wire Wire Line
	9700 2950 9700 2900
Wire Wire Line
	9900 3000 9400 3000
Wire Wire Line
	9400 3000 9400 2900
Wire Wire Line
	9900 3000 9900 3100
Wire Wire Line
	9900 3100 9650 3100
Wire Wire Line
	9650 3200 10000 3200
Wire Wire Line
	9650 3300 10100 3300
Wire Wire Line
	9650 3400 10200 3400
Wire Wire Line
	9650 3600 10400 3600
Wire Wire Line
	10400 3600 10400 3000
Wire Wire Line
	9650 3500 10300 3500
Connection ~ 9900 3100
Connection ~ 10000 3200
Connection ~ 10100 3300
Connection ~ 10200 3400
Connection ~ 10300 3500
Connection ~ 10400 3600
$Comp
L Switch:SW_DIP_x06 SW1
U 1 1 61956944
P 10100 4050
F 0 "SW1" V 10054 4480 50  0000 L CNN
F 1 "SW_DIP_x06" V 10145 4480 50  0000 L CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx06_Slide_6.7x16.8mm_W7.62mm_P2.54mm_LowProfile" H 10100 4050 50  0001 C CNN
F 3 "~" H 10100 4050 50  0001 C CNN
	1    10100 4050
	0    1    1    0   
$EndComp
$Comp
L Potentiometer_Digital:MCP46x2 U3
U 1 1 617A02FD
P 6950 5550
F 0 "U3" H 7250 6150 50  0000 C CNN
F 1 "MCP46x2" H 7250 6050 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 7700 5100 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf" H 6950 5550 50  0001 C CNN
	1    6950 5550
	1    0    0    -1  
$EndComp
$Comp
L Potentiometer_Digital:MCP46x2 U6
U 1 1 617A1DE5
P 8450 5550
F 0 "U6" H 8750 6150 50  0000 C CNN
F 1 "MCP46x2" H 8750 6050 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 9200 5100 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf" H 8450 5550 50  0001 C CNN
	1    8450 5550
	1    0    0    -1  
$EndComp
$Comp
L Potentiometer_Digital:MCP46x2 U7
U 1 1 617A2587
P 10250 5550
F 0 "U7" H 10550 6150 50  0000 C CNN
F 1 "MCP46x2" H 10550 6050 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 11000 5100 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf" H 10250 5550 50  0001 C CNN
	1    10250 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 617A978D
P 1950 4550
F 0 "R2" V 2050 4550 50  0000 C CNN
F 1 "1k" V 1834 4550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1880 4550 50  0001 C CNN
F 3 "~" H 1950 4550 50  0001 C CNN
	1    1950 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 617A9A7D
P 1950 5000
F 0 "R3" V 1743 5000 50  0000 C CNN
F 1 "1k" V 1834 5000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1880 5000 50  0001 C CNN
F 3 "~" H 1950 5000 50  0001 C CNN
	1    1950 5000
	0    1    1    0   
$EndComp
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
Text GLabel 9900 4350 3    50   Input ~ 0
GND
Text GLabel 10250 6100 3    50   Input ~ 0
GND
Text GLabel 8450 6100 3    50   Input ~ 0
GND
Text GLabel 6950 6150 3    50   Input ~ 0
GND
Text GLabel 4750 6850 2    50   Input ~ 0
A_OUT_L
Text GLabel 2450 5000 2    50   Input ~ 0
GND
Wire Wire Line
	6700 1450 7400 1450
Wire Wire Line
	7400 1450 7400 2300
Wire Wire Line
	7400 2300 5600 2300
Wire Wire Line
	5000 1450 5000 2100
Wire Wire Line
	6200 2100 5000 2100
Connection ~ 5000 2100
Wire Wire Line
	6950 3800 6950 3900
Wire Wire Line
	6950 3900 5000 3900
Text GLabel 5000 4000 3    50   Input ~ 0
GND
Wire Wire Line
	5000 2100 5000 3650
Wire Wire Line
	5000 3650 5000 3900
Connection ~ 5000 3650
Wire Wire Line
	6200 3650 5000 3650
Wire Wire Line
	6200 3600 6200 3650
Text GLabel 4100 3000 2    50   Input ~ 0
APC1_OUT
Wire Wire Line
	5000 4000 5000 3900
Connection ~ 5000 3900
Text GLabel 1200 4000 3    50   Input ~ 0
GND
Wire Wire Line
	1200 4000 1200 3900
Connection ~ 1200 3900
Wire Wire Line
	1450 850  1450 1200
Connection ~ 1450 1200
Text GLabel 750  2800 3    50   Input ~ 0
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
P 4450 900
F 0 "J4" V 4414 712 50  0000 R CNN
F 1 "Conn_01x03" V 4323 712 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4450 900 50  0001 C CNN
F 3 "~" H 4450 900 50  0001 C CNN
	1    4450 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 1650 3500 1650
Connection ~ 3500 1650
Wire Wire Line
	4150 1650 4450 1650
Wire Wire Line
	4450 1100 4450 1650
Wire Wire Line
	4350 1200 4350 1100
Wire Wire Line
	3950 3450 3950 3550
$Comp
L Device:R R10
U 1 1 61812684
P 7700 1650
F 0 "R10" V 7493 1650 50  0000 C CNN
F 1 "1k" V 7584 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7630 1650 50  0001 C CNN
F 3 "~" H 7700 1650 50  0001 C CNN
	1    7700 1650
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 6181268B
P 8150 900
F 0 "J7" V 8114 712 50  0000 R CNN
F 1 "Conn_01x03" V 8023 712 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 8150 900 50  0001 C CNN
F 3 "~" H 8150 900 50  0001 C CNN
	1    8150 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7850 1650 8150 1650
Wire Wire Line
	8150 1100 8150 1650
Wire Wire Line
	8050 1200 8050 1100
Wire Wire Line
	7550 1650 7300 1650
Connection ~ 7300 1650
$Comp
L Device:R R7
U 1 1 6182AA89
P 7300 3400
F 0 "R7" V 7093 3400 50  0000 C CNN
F 1 "1k" V 7184 3400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7230 3400 50  0001 C CNN
F 3 "~" H 7300 3400 50  0001 C CNN
	1    7300 3400
	0    -1   1    0   
$EndComp
Text GLabel 7750 3450 1    50   Input ~ 0
Digi4
Wire Wire Line
	7450 3400 7650 3400
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 6182AA91
P 7650 3750
F 0 "J6" V 7522 3930 50  0000 L CNN
F 1 "Conn_01x03" V 7613 3930 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 7650 3750 50  0001 C CNN
F 3 "~" H 7650 3750 50  0001 C CNN
	1    7650 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 3400 7650 3550
Wire Wire Line
	7750 3450 7750 3550
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 618308EB
P 7650 2150
F 0 "J5" V 7522 2330 50  0000 L CNN
F 1 "Conn_01x03" V 7613 2330 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 7650 2150 50  0001 C CNN
F 3 "~" H 7650 2150 50  0001 C CNN
	1    7650 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 1850 7650 1850
Wire Wire Line
	7650 1850 7650 1950
Connection ~ 7300 1850
Wire Wire Line
	7750 1950 7750 1850
Wire Wire Line
	7750 1850 8100 1850
NoConn ~ 7550 1950
NoConn ~ 8250 1100
NoConn ~ 4550 1100
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
Text GLabel 3750 4950 1    50   Input ~ 0
VACTROL_OUT
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
P 1000 7000
F 0 "U8" H 958 7046 50  0000 L CNN
F 1 "TL072" H 958 6955 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 1000 7000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 1000 7000 50  0001 C CNN
	3    1000 7000
	1    0    0    -1  
$EndComp
Text GLabel 900  6650 1    50   Input ~ 0
+12V
Text GLabel 900  7350 3    50   Input ~ 0
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
Text GLabel 9750 5450 0    50   Input ~ 0
BUFFER_POT
Text GLabel 9700 5750 0    50   Input ~ 0
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
Text GLabel 1100 5600 3    50   Input ~ 0
GND
Wire Wire Line
	1100 5150 1100 5000
Connection ~ 1100 5000
Wire Wire Line
	1100 5000 1300 5000
Wire Wire Line
	1100 5450 1100 5600
Wire Wire Line
	2100 6750 2350 6750
Wire Wire Line
	1800 6750 1700 6750
$Comp
L Device:CP C8
U 1 1 6184635B
P 1100 5300
F 0 "C8" V 1355 5300 50  0000 C CNN
F 1 "100u" V 1264 5300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 1138 5150 50  0001 C CNN
F 3 "~" H 1100 5300 50  0001 C CNN
	1    1100 5300
	1    0    0    -1  
$EndComp
Text Notes 1900 5150 0    50   ~ 0
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
	9900 3100 9900 3750
Text GLabel 10000 4350 3    50   Input ~ 0
GND
Text GLabel 10100 4350 3    50   Input ~ 0
GND
Text GLabel 10200 4350 3    50   Input ~ 0
GND
Text GLabel 10300 4350 3    50   Input ~ 0
GND
Text GLabel 10400 4350 3    50   Input ~ 0
GND
Wire Wire Line
	10400 3600 10400 3750
Wire Wire Line
	10300 3500 10300 3750
Wire Wire Line
	10200 3400 10200 3750
Wire Wire Line
	10100 3300 10100 3750
Wire Wire Line
	10000 3200 10000 3750
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
	900  7300 900  7350
Wire Wire Line
	900  6700 900  6650
Wire Wire Line
	6850 6050 6850 6150
Wire Wire Line
	6950 6150 6950 6050
Wire Wire Line
	7950 5750 7900 5750
Wire Wire Line
	7950 5650 7900 5650
Wire Wire Line
	9750 5650 9700 5650
Wire Wire Line
	9750 5750 9700 5750
NoConn ~ 7550 3550
Wire Wire Line
	10200 2900 10200 3400
Wire Wire Line
	10100 2900 10100 3300
Wire Wire Line
	10300 2950 10300 3500
Wire Wire Line
	10000 2950 10000 3200
Wire Wire Line
	3700 3000 4100 3000
Wire Wire Line
	3650 3400 3850 3400
Wire Wire Line
	3850 3400 3850 3550
NoConn ~ 3750 3550
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 617D1A8D
P 3850 3750
F 0 "J3" V 3722 3930 50  0000 L CNN
F 1 "Conn_01x03" V 3813 3930 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 3850 3750 50  0001 C CNN
F 3 "~" H 3850 3750 50  0001 C CNN
	1    3850 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 6196E9A7
P 3550 5250
F 0 "RV1" H 3481 5296 50  0000 R CNN
F 1 "R_POT" H 3481 5205 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PT-6-V_Vertical" H 3550 5250 50  0001 C CNN
F 3 "~" H 3550 5250 50  0001 C CNN
	1    3550 5250
	1    0    0    -1  
$EndComp
Text GLabel 3550 5400 3    50   Input ~ 0
GND
$Comp
L Comparator:AD8561 U9
U 1 1 61970198
P 4200 5150
F 0 "U9" H 4544 5196 50  0000 L CNN
F 1 "AD8561" H 4544 5105 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4200 5150 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ad8561.pdf" H 4200 5150 50  0001 C CNN
	1    4200 5150
	1    0    0    -1  
$EndComp
Text GLabel 4200 5550 3    50   Input ~ 0
GND
NoConn ~ 4500 5050
Wire Wire Line
	3700 5250 3900 5250
Wire Wire Line
	3750 4950 3750 5050
Wire Wire Line
	3750 5050 3900 5050
Wire Wire Line
	4100 4850 4100 4800
Text GLabel 4000 5500 0    50   Input ~ 0
GND
Wire Wire Line
	4000 5500 4100 5500
Wire Wire Line
	4100 5500 4100 5450
Text GLabel 4300 4750 1    50   Input ~ 0
GND
Wire Wire Line
	4300 4850 4300 4750
Wire Wire Line
	4200 5450 4200 5550
Text GLabel 2450 4550 2    50   Input ~ 0
VACTROL_OUT
Text Notes 1800 5450 0    50   ~ 0
VACTROL\n
Wire Wire Line
	2100 5000 2450 5000
Wire Wire Line
	2450 4550 2100 4550
Text GLabel 5400 6050 3    50   Input ~ 0
GND
Text GLabel 5400 5250 1    50   Input ~ 0
VACTROL_OUT
$Comp
L Device:C C3
U 1 1 617A0100
P 5400 5900
F 0 "C3" V 5550 5900 50  0000 C CNN
F 1 "22n" V 5239 5900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 5438 5750 50  0001 C CNN
F 3 "~" H 5400 5900 50  0001 C CNN
	1    5400 5900
	-1   0    0    1   
$EndComp
Connection ~ 4900 5250
Wire Wire Line
	4900 5450 5100 5450
Wire Wire Line
	4900 5250 4900 5450
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 619EB8EF
P 5300 5450
F 0 "Q1" H 5490 5496 50  0000 L CNN
F 1 "2N3904" H 5490 5405 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 5500 5375 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5300 5450 50  0001 L CNN
	1    5300 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5250 4900 5150
Wire Wire Line
	4500 5250 4900 5250
$Comp
L Device:R R11
U 1 1 619DFE81
P 4900 5000
F 0 "R11" V 4693 5000 50  0000 C CNN
F 1 "10k" V 4784 5000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4830 5000 50  0001 C CNN
F 3 "~" H 4900 5000 50  0001 C CNN
	1    4900 5000
	-1   0    0    1   
$EndComp
Text Notes 8900 600  0    50   ~ 0
BUS CONNECTOR THAT PROVIDES POWER/TRIGGER TO DRUM
Text Notes 9150 2500 0    50   ~ 0
DIP SWITCH TO CONTROL ADDRESSES OF DIGIPOTS
Wire Wire Line
	9300 2600 9400 2600
Connection ~ 9400 2600
Text Notes 8100 4750 0    50   ~ 0
DIGIPOT IC CHIPS
Wire Notes Line
	11200 4800 6200 4800
Wire Notes Line
	6200 4800 6200 6500
Wire Notes Line
	6200 6500 11200 6500
Wire Notes Line
	11200 6500 11200 4800
Wire Notes Line
	11150 4600 11150 2500
Wire Notes Line
	11150 2500 9050 2500
Wire Notes Line
	9050 2500 9050 4600
Wire Notes Line
	9050 4600 11150 4600
Wire Notes Line
	11150 2300 9100 2300
Wire Notes Line
	9100 2300 9100 600 
Wire Notes Line
	9100 600  11150 600 
Wire Notes Line
	11150 600  11150 2300
Wire Notes Line
	3050 4300 3050 4900
Wire Notes Line
	3050 4900 2800 4900
Wire Notes Line
	2800 4900 2800 5850
Wire Notes Line
	2800 5850 550  5850
Wire Notes Line
	2150 4400 1700 4400
Wire Notes Line
	1700 4400 1700 5350
Wire Notes Line
	2150 4400 2150 5350
Wire Notes Line
	1700 5350 2150 5350
Text Notes 1650 4400 0    50   ~ 0
PHOTORESISTOR
Wire Notes Line
	1000 4200 1000 650 
Wire Notes Line
	1000 650  8850 650 
Wire Notes Line
	8850 650  8850 4200
Wire Notes Line
	1000 4200 8850 4200
Text Notes 4450 600  0    50   ~ 0
2X APC 4X 555 TIMER
Text Notes 1150 6000 0    50   ~ 0
BEGINNING OF LOW PASS GATE
$Comp
L Device:R R12
U 1 1 61ACD63E
P 9250 1450
F 0 "R12" V 9150 1450 50  0000 C CNN
F 1 "47" V 9350 1450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9180 1450 50  0001 C CNN
F 3 "~" H 9250 1450 50  0001 C CNN
	1    9250 1450
	-1   0    0    1   
$EndComp
Text GLabel 9250 1300 1    50   Input ~ 0
5V
Text GLabel 9250 1600 3    50   Input ~ 0
5V_CL
Text GLabel 5250 850  2    50   Input ~ 0
5V_CL
Text GLabel 6300 5850 3    50   Input ~ 0
5V_CL
Wire Wire Line
	6300 5650 6300 5750
Wire Wire Line
	6300 5650 6450 5650
Wire Wire Line
	6300 5750 6400 5750
Connection ~ 6300 5750
Wire Wire Line
	6300 5750 6300 5850
Wire Wire Line
	6400 5750 6400 6150
Wire Wire Line
	6400 6150 6850 6150
Connection ~ 6400 5750
Wire Wire Line
	6400 5750 6450 5750
Text GLabel 8350 6100 3    50   Input ~ 0
5V_CL
Wire Wire Line
	7900 5650 7900 5750
Wire Wire Line
	7900 6050 8350 6050
Connection ~ 7900 5750
Wire Wire Line
	7900 5750 7900 6050
Connection ~ 8350 6050
Text GLabel 9700 5650 0    50   Input ~ 0
5V_CL
Text GLabel 4900 4850 1    50   Input ~ 0
5V_CL
Text GLabel 4100 4800 1    50   Input ~ 0
5V_CL
Text GLabel 3550 5100 1    50   Input ~ 0
5V_CL
Text GLabel 1450 850  2    50   Input ~ 0
5V_CL
Text GLabel 750  2500 1    50   Input ~ 0
5V_CL
Text GLabel 1700 6750 0    50   Input ~ 0
LPG_OUT
Text GLabel 5050 5700 0    50   Input ~ 0
LPG_OUT
Wire Wire Line
	5050 5700 5400 5700
Wire Wire Line
	5400 5700 5400 5650
Wire Wire Line
	5400 5750 5400 5700
Connection ~ 5400 5700
$Comp
L Device:C C12
U 1 1 61B30F8B
P 750 1050
F 0 "C12" V 900 1050 50  0000 C CNN
F 1 "22p" V 589 1050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 788 900 50  0001 C CNN
F 3 "~" H 750 1050 50  0001 C CNN
	1    750  1050
	-1   0    0    1   
$EndComp
Text GLabel 750  900  1    50   Input ~ 0
5V_CL
Text GLabel 750  1200 3    50   Input ~ 0
GND
$Comp
L Device:C C13
U 1 1 61B44170
P 750 1850
F 0 "C13" V 900 1850 50  0000 C CNN
F 1 "22p" V 589 1850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 788 1700 50  0001 C CNN
F 3 "~" H 750 1850 50  0001 C CNN
	1    750  1850
	-1   0    0    1   
$EndComp
Text GLabel 750  1700 1    50   Input ~ 0
5V_CL
Text GLabel 750  2000 3    50   Input ~ 0
GND
$Comp
L Device:C C14
U 1 1 61B4F4BA
P 750 3450
F 0 "C14" V 900 3450 50  0000 C CNN
F 1 "22p" V 589 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 788 3300 50  0001 C CNN
F 3 "~" H 750 3450 50  0001 C CNN
	1    750  3450
	-1   0    0    1   
$EndComp
Text GLabel 750  3300 1    50   Input ~ 0
5V_CL
Text GLabel 750  3600 3    50   Input ~ 0
GND
$Comp
L Device:C C15
U 1 1 61B6F90C
P 750 4250
F 0 "C15" V 900 4250 50  0000 C CNN
F 1 "22p" V 589 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 788 4100 50  0001 C CNN
F 3 "~" H 750 4250 50  0001 C CNN
	1    750  4250
	-1   0    0    1   
$EndComp
Text GLabel 750  4100 1    50   Input ~ 0
5V_CL
Text GLabel 750  4400 3    50   Input ~ 0
GND
Wire Notes Line
	3050 4300 1050 4300
Wire Notes Line
	1050 4300 1050 4800
Wire Notes Line
	1050 4800 550  4800
Wire Notes Line
	550  4800 550  5850
Wire Notes Line
	5850 6350 5850 4350
Wire Notes Line
	5850 4350 3200 4350
Wire Notes Line
	3200 4350 3200 6350
Wire Notes Line
	3200 6350 5800 6350
Text Notes 3150 4300 0    50   ~ 0
COMPARATOR/BJT SWITCH & END OF LPG (HELPS FULLY MUTE CIRCUIT)
Wire Notes Line
	5300 7750 700  7750
Wire Notes Line
	700  7750 700  6250
Wire Notes Line
	700  6250 3000 6250
Wire Notes Line
	3000 6250 3000 6500
Wire Notes Line
	3000 6500 5300 6500
Wire Notes Line
	5300 6500 5300 7750
Text Notes 1350 6200 0    50   ~ 0
OUTPUT BUFFER CKT
Text GLabel 9300 2600 0    50   Input ~ 0
5V_CL
$EndSCHEMATC
