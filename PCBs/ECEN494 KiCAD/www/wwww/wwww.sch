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
L Potentiometer_Digital:AD5272BRM U1
U 1 1 617626E2
P 5150 3750
F 0 "U1" H 5150 4431 50  0000 C CNN
F 1 "AD5272BRM" H 5150 4340 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 5900 3300 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5272_5274.pdf" H 5150 3750 50  0001 C CNN
	1    5150 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J1
U 1 1 61774FB9
P 5000 4900
F 0 "J1" H 5050 5317 50  0000 C CNN
F 1 "Conn_02x05_Counter_Clockwise" H 5050 5226 50  0000 C CNN
F 2 "Package_DIP:DIP-10_W7.62mm" H 5000 4900 50  0001 C CNN
F 3 "~" H 5000 4900 50  0001 C CNN
	1    5000 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3250 5150 3000
Wire Wire Line
	5150 3000 4250 3000
Wire Wire Line
	4250 3000 4250 4700
Wire Wire Line
	4250 4700 4800 4700
Wire Wire Line
	5650 3550 6350 3550
Wire Wire Line
	6350 3550 6350 4500
Wire Wire Line
	6350 4500 4650 4500
Wire Wire Line
	4650 4500 4650 4800
Wire Wire Line
	4650 4800 4800 4800
Wire Wire Line
	5650 3650 6050 3650
Wire Wire Line
	6050 3650 6050 5450
Wire Wire Line
	6050 5450 4600 5450
Wire Wire Line
	4600 5450 4600 4850
Wire Wire Line
	4600 4850 4800 4850
Wire Wire Line
	4800 4850 4800 4900
Wire Wire Line
	5150 4250 5150 4350
Wire Wire Line
	5150 4350 4500 4350
Wire Wire Line
	4500 4350 4500 5050
Wire Wire Line
	4500 5050 4800 5050
Wire Wire Line
	4800 5050 4800 5000
Wire Wire Line
	5650 3950 5650 5550
Wire Wire Line
	4800 5550 4800 5100
Wire Wire Line
	5050 4250 5150 4250
Wire Wire Line
	5550 4250 5550 5100
Wire Wire Line
	5550 5100 5300 5100
Connection ~ 5150 4250
Wire Wire Line
	5150 4250 5550 4250
Wire Wire Line
	5300 5000 5350 5000
Wire Wire Line
	5350 5000 5350 5350
Wire Wire Line
	5350 5350 4200 5350
Wire Wire Line
	4200 5350 4200 3950
Wire Wire Line
	4200 3950 4650 3950
Wire Wire Line
	4650 3850 3750 3850
Wire Wire Line
	3750 3850 3750 5950
Wire Wire Line
	3750 5950 5600 5950
Wire Wire Line
	5600 5950 5600 4700
Wire Wire Line
	5600 4700 5300 4700
Wire Wire Line
	4650 3650 3900 3650
Wire Wire Line
	3900 3650 3900 5750
Wire Wire Line
	3900 5750 5500 5750
Wire Wire Line
	5500 5750 5500 4900
Wire Wire Line
	5500 4900 5300 4900
Wire Wire Line
	4650 3550 4000 3550
Wire Wire Line
	4000 3550 4000 5600
Wire Wire Line
	4800 5550 5650 5550
Wire Wire Line
	4000 5600 5400 5600
Wire Wire Line
	5400 5600 5400 4800
Wire Wire Line
	5400 4800 5300 4800
$EndSCHEMATC
