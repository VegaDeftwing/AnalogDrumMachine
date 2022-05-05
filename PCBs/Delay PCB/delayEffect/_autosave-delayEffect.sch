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
L power:+5V #PWR0101
U 1 1 62417540
P 10750 2850
F 0 "#PWR0101" H 10750 2700 50  0001 C CNN
F 1 "+5V" H 10765 3023 50  0000 C CNN
F 2 "" H 10750 2850 50  0001 C CNN
F 3 "" H 10750 2850 50  0001 C CNN
	1    10750 2850
	-1   0    0    1   
$EndComp
Text GLabel 10750 2000 0    50   Input ~ 0
+5V
Connection ~ 7050 1300
Wire Wire Line
	7350 1300 7050 1300
Text GLabel 7350 1300 2    50   Input ~ 0
Input
Wire Wire Line
	6700 1300 7050 1300
Wire Wire Line
	5000 1300 5700 1300
Wire Wire Line
	6150 1300 6400 1300
Connection ~ 4750 1700
Wire Wire Line
	4750 1650 4750 1700
Wire Wire Line
	5200 1650 4750 1650
Wire Wire Line
	4400 1700 4750 1700
Wire Wire Line
	4400 1900 4400 1700
Wire Wire Line
	4250 1900 4400 1900
Wire Wire Line
	4250 2000 4750 2000
$Comp
L Device:R R9
U 1 1 6242BE70
P 7050 1450
F 0 "R9" H 6980 1404 50  0000 R CNN
F 1 "100k" H 6980 1495 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6980 1450 50  0001 C CNN
F 3 "~" H 7050 1450 50  0001 C CNN
	1    7050 1450
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C14
U 1 1 6242B385
P 6550 1300
F 0 "C14" V 6805 1300 50  0000 C CNN
F 1 "4.7uF" V 6714 1300 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6588 1150 50  0001 C CNN
F 3 "~" H 6550 1300 50  0001 C CNN
	1    6550 1300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C13
U 1 1 6242AB38
P 4850 1300
F 0 "C13" V 4598 1300 50  0000 C CNN
F 1 "5600pF" V 4689 1300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4888 1150 50  0001 C CNN
F 3 "~" H 4850 1300 50  0001 C CNN
	1    4850 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 6242A2EC
P 6000 1300
F 0 "R8" V 5793 1300 50  0000 C CNN
F 1 "15k" V 5884 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5930 1300 50  0001 C CNN
F 3 "~" H 6000 1300 50  0001 C CNN
	1    6000 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 62429EA8
P 5350 1650
F 0 "R7" V 5143 1650 50  0000 C CNN
F 1 "10k" V 5234 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5280 1650 50  0001 C CNN
F 3 "~" H 5350 1650 50  0001 C CNN
	1    5350 1650
	0    1    1    0   
$EndComp
$Comp
L Device:C C12
U 1 1 62428F9A
P 4750 1850
F 0 "C12" H 4865 1896 50  0000 L CNN
F 1 "560pF" H 4865 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4788 1700 50  0001 C CNN
F 3 "~" H 4750 1850 50  0001 C CNN
	1    4750 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 62426908
P 4450 2950
F 0 "C6" H 4565 2996 50  0000 L CNN
F 1 ".1uF" H 4565 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4488 2800 50  0001 C CNN
F 3 "~" H 4450 2950 50  0001 C CNN
	1    4450 2950
	1    0    0    -1  
$EndComp
NoConn ~ 3250 2500
Wire Wire Line
	2700 2600 3250 2600
Wire Wire Line
	2400 2800 3250 2800
Wire Wire Line
	3250 2900 2900 2900
$Comp
L Device:C C5
U 1 1 624244FA
P 2900 3050
F 0 "C5" H 3015 3096 50  0000 L CNN
F 1 ".1uF" H 3015 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2938 2900 50  0001 C CNN
F 3 "~" H 2900 3050 50  0001 C CNN
	1    2900 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 62422F77
P 2400 2950
F 0 "C4" H 2515 2996 50  0000 L CNN
F 1 ".1uF" H 2515 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2438 2800 50  0001 C CNN
F 3 "~" H 2400 2950 50  0001 C CNN
	1    2400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2300 3250 2300
Wire Wire Line
	2400 2600 2150 2600
$Comp
L Device:R R1
U 1 1 624219DE
P 2550 2600
F 0 "R1" V 2343 2600 50  0000 C CNN
F 1 "R" V 2434 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2480 2600 50  0001 C CNN
F 3 "~" H 2550 2600 50  0001 C CNN
	1    2550 2600
	0    1    1    0   
$EndComp
Connection ~ 1900 1350
Wire Wire Line
	2800 1350 1900 1350
Wire Wire Line
	2800 1900 2800 1350
Wire Wire Line
	3250 1900 2800 1900
Wire Wire Line
	2750 2000 3250 2000
Wire Wire Line
	2300 2200 2150 2200
Connection ~ 2300 2200
Wire Wire Line
	2300 2000 2300 2200
Wire Wire Line
	2450 2000 2300 2000
Wire Wire Line
	3250 2200 2300 2200
$Comp
L Device:CP C3
U 1 1 6241DA49
P 2600 2000
F 0 "C3" V 2345 2000 50  0000 C CNN
F 1 "47uF" V 2436 2000 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2638 1850 50  0001 C CNN
F 3 "~" H 2600 2000 50  0001 C CNN
	1    2600 2000
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 6241598C
P 1500 1500
F 0 "C1" H 1615 1546 50  0000 L CNN
F 1 ".1uF" H 1615 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1538 1350 50  0001 C CNN
F 3 "~" H 1500 1500 50  0001 C CNN
	1    1500 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 624161AB
P 1900 1500
F 0 "C2" H 2015 1546 50  0000 L CNN
F 1 "100uF" H 2015 1455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 1938 1350 50  0001 C CNN
F 3 "~" H 1900 1500 50  0001 C CNN
	1    1900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1350 1900 1350
Text GLabel 1300 1350 0    50   Input ~ 0
+5V
Wire Wire Line
	1300 1350 1500 1350
Connection ~ 1500 1350
$Comp
L Audio:PT2399 U1
U 1 1 62414ECF
P 3750 2400
F 0 "U1" H 3750 3167 50  0000 C CNN
F 1 "PT2399" H 3750 3076 50  0000 C CNN
F 2 "Package_DIP:DIP-18_W7.62mm_Socket" H 3750 2000 50  0001 C CNN
F 3 "http://sound.westhost.com/pt2399.pdf" H 3750 2000 50  0001 C CNN
	1    3750 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 6243CDE5
P 4650 2600
F 0 "C7" V 4398 2600 50  0000 C CNN
F 1 ".1uF" V 4489 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4688 2450 50  0001 C CNN
F 3 "~" H 4650 2600 50  0001 C CNN
	1    4650 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 3100 4250 3100
Wire Wire Line
	4250 3100 4250 2900
Wire Wire Line
	4250 2800 4450 2800
Wire Wire Line
	4250 2500 4500 2500
Wire Wire Line
	4500 2500 4500 2600
Wire Wire Line
	4250 2600 4500 2600
Connection ~ 4500 2600
Connection ~ 4750 2000
Wire Wire Line
	5200 2000 4750 2000
$Comp
L Device:R R6
U 1 1 62429804
P 5350 2000
F 0 "R6" V 5143 2000 50  0000 C CNN
F 1 "15k" V 5234 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5280 2000 50  0001 C CNN
F 3 "~" H 5350 2000 50  0001 C CNN
	1    5350 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 62446056
P 5550 3450
F 0 "R2" V 5343 3450 50  0000 C CNN
F 1 "15k" V 5434 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5480 3450 50  0001 C CNN
F 3 "~" H 5550 3450 50  0001 C CNN
	1    5550 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 6244C7F0
P 6400 3250
F 0 "R3" V 6193 3250 50  0000 C CNN
F 1 "10k" V 6284 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6330 3250 50  0001 C CNN
F 3 "~" H 6400 3250 50  0001 C CNN
	1    6400 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 6244DE94
P 6400 2950
F 0 "R4" V 6193 2950 50  0000 C CNN
F 1 "15k" V 6284 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6330 2950 50  0001 C CNN
F 3 "~" H 6400 2950 50  0001 C CNN
	1    6400 2950
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 62457C5B
P 5850 3100
F 0 "C8" H 5965 3146 50  0000 L CNN
F 1 "560pF" H 5965 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5888 2950 50  0001 C CNN
F 3 "~" H 5850 3100 50  0001 C CNN
	1    5850 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2950 6250 2950
Wire Wire Line
	5850 3250 6250 3250
Wire Wire Line
	6550 3250 6700 3250
Wire Wire Line
	6700 3250 6700 2950
Wire Wire Line
	6700 2950 6550 2950
$Comp
L Device:C C9
U 1 1 6245C371
P 7000 3100
F 0 "C9" H 7115 3146 50  0000 L CNN
F 1 "5600pF" H 7115 3055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7038 2950 50  0001 C CNN
F 3 "~" H 7000 3100 50  0001 C CNN
	1    7000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2950 6700 2950
Connection ~ 6700 2950
Wire Wire Line
	5700 3450 6700 3450
Wire Wire Line
	6700 3450 6700 3250
Connection ~ 6700 3250
Wire Wire Line
	5400 3450 5400 2600
Wire Wire Line
	5400 2600 4800 2600
Wire Wire Line
	4250 2300 4800 2300
Wire Wire Line
	4800 2300 4800 2550
Wire Wire Line
	4800 2550 5700 2550
Wire Wire Line
	5700 2550 5700 3250
Wire Wire Line
	5700 3250 5850 3250
Connection ~ 5850 3250
$Comp
L Device:R R5
U 1 1 62460A47
P 6200 2300
F 0 "R5" V 5993 2300 50  0000 C CNN
F 1 "2.7k" V 6084 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6130 2300 50  0001 C CNN
F 3 "~" H 6200 2300 50  0001 C CNN
	1    6200 2300
	0    1    1    0   
$EndComp
$Comp
L Device:CP C11
U 1 1 62461279
P 7250 2300
F 0 "C11" V 7505 2300 50  0000 C CNN
F 1 "10uF" V 7414 2300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7288 2150 50  0001 C CNN
F 3 "~" H 7250 2300 50  0001 C CNN
	1    7250 2300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C10
U 1 1 62462F6B
P 6700 2450
F 0 "C10" H 6815 2496 50  0000 L CNN
F 1 ".01uF" H 6815 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6738 2300 50  0001 C CNN
F 3 "~" H 6700 2450 50  0001 C CNN
	1    6700 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2950 5850 2300
Wire Wire Line
	5850 2300 6050 2300
Connection ~ 5850 2950
Wire Wire Line
	6350 2300 6700 2300
Wire Wire Line
	7100 2300 6700 2300
Connection ~ 6700 2300
Text GLabel 7700 2300 2    50   Input ~ 0
Output
Wire Wire Line
	7400 2300 7700 2300
Wire Wire Line
	4250 2200 5500 2200
Wire Wire Line
	5500 2200 5500 2300
Wire Wire Line
	5500 2300 5850 2300
Connection ~ 5850 2300
Wire Wire Line
	4550 1300 4700 1300
Wire Wire Line
	10750 2000 10750 2400
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 62487FDD
P 10550 2400
F 0 "#FLG0103" H 10550 2475 50  0001 C CNN
F 1 "PWR_FLAG" V 10550 2527 50  0000 L CNN
F 2 "" H 10550 2400 50  0001 C CNN
F 3 "~" H 10550 2400 50  0001 C CNN
	1    10550 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10550 2400 10750 2400
Connection ~ 10750 2400
Wire Wire Line
	10750 2400 10750 2850
Wire Wire Line
	5500 1650 5700 1650
Wire Wire Line
	5700 1650 5700 1300
Connection ~ 5700 1300
Wire Wire Line
	5700 1300 5850 1300
Wire Wire Line
	5500 2000 5700 2000
Wire Wire Line
	5700 2000 5700 1650
Connection ~ 5700 1650
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 62497777
P 9650 1200
F 0 "J1" H 9700 1617 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 9700 1526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 9650 1200 50  0001 C CNN
F 3 "~" H 9650 1200 50  0001 C CNN
	1    9650 1200
	1    0    0    -1  
$EndComp
Text GLabel 9450 1000 0    50   Input ~ 0
+5V
Text GLabel 9950 1000 2    50   Input ~ 0
+5V
Text GLabel 9450 1100 0    50   Input ~ 0
Input
Text GLabel 9450 1200 0    50   Input ~ 0
Output
Text GLabel 9450 1300 0    50   Input ~ 0
AGND
Text GLabel 9450 1400 0    50   Input ~ 0
DGND
Text GLabel 9950 1100 2    50   Input ~ 0
Input
Text GLabel 9950 1200 2    50   Input ~ 0
Output
Text GLabel 9950 1300 2    50   Input ~ 0
AGND
Text GLabel 9950 1400 2    50   Input ~ 0
DGND
$Comp
L power:GND #PWR0102
U 1 1 624D2EBF
P 9850 2900
F 0 "#PWR0102" H 9850 2650 50  0001 C CNN
F 1 "GND" H 9855 2727 50  0000 C CNN
F 2 "" H 9850 2900 50  0001 C CNN
F 3 "" H 9850 2900 50  0001 C CNN
	1    9850 2900
	1    0    0    -1  
$EndComp
Text GLabel 9850 2000 0    50   Input ~ 0
GND
Wire Wire Line
	9850 2000 9850 2450
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 624D5698
P 9650 2450
F 0 "#FLG0101" H 9650 2525 50  0001 C CNN
F 1 "PWR_FLAG" V 9650 2577 50  0000 L CNN
F 2 "" H 9650 2450 50  0001 C CNN
F 3 "~" H 9650 2450 50  0001 C CNN
	1    9650 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 2450 9850 2450
Connection ~ 9850 2450
Wire Wire Line
	9850 2450 9850 2900
Text GLabel 7000 3250 3    50   Input ~ 0
GND
Text GLabel 2900 3200 3    50   Input ~ 0
GND
Text GLabel 2400 3100 3    50   Input ~ 0
GND
Text GLabel 2150 2600 0    50   Input ~ 0
GND
Text GLabel 2150 2200 0    50   Input ~ 0
GND
Text GLabel 3050 2300 0    50   Input ~ 0
GND
Text GLabel 1900 1650 3    50   Input ~ 0
GND
Text GLabel 1500 1650 3    50   Input ~ 0
GND
Text GLabel 6700 2600 3    50   Input ~ 0
GND
Text GLabel 7050 1600 3    50   Input ~ 0
GND
Text GLabel 4550 1300 0    50   Input ~ 0
GND
$EndSCHEMATC
