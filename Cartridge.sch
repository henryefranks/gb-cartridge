EESchema Schematic File Version 4
LIBS:Cartridge-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Gameboy Cartridge"
Date ""
Rev "1.0"
Comp "Henry Franks"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5350 2500 5150 2500
Wire Wire Line
	5350 2600 5150 2600
Wire Wire Line
	5350 2700 5150 2700
Wire Wire Line
	5350 2800 5150 2800
Wire Wire Line
	5350 2900 5150 2900
Wire Wire Line
	5350 3000 5150 3000
Wire Wire Line
	5350 3100 5150 3100
Wire Wire Line
	5350 3200 5150 3200
Wire Wire Line
	5350 3300 5150 3300
Wire Wire Line
	5350 3400 5150 3400
Wire Wire Line
	5350 3500 5150 3500
Wire Wire Line
	5350 3600 5150 3600
Wire Wire Line
	5350 3700 5150 3700
Wire Wire Line
	5350 3800 5150 3800
Wire Wire Line
	5350 3900 5150 3900
Wire Wire Line
	5350 4150 5150 4150
Wire Wire Line
	5350 4250 5150 4250
Wire Wire Line
	5350 4350 5150 4350
Wire Wire Line
	5350 4450 5150 4450
Wire Wire Line
	5350 4550 5150 4550
Wire Wire Line
	5350 4650 5150 4650
Wire Wire Line
	5350 4750 5150 4750
Wire Wire Line
	5350 4850 5150 4850
Wire Wire Line
	5150 2250 6350 2250
Wire Wire Line
	6400 2150 5150 2150
Wire Wire Line
	6450 2050 5150 2050
Wire Wire Line
	5150 1950 5250 1950
NoConn ~ 5250 1950
Wire Wire Line
	5150 1850 6500 1850
Wire Wire Line
	5150 5100 5250 5100
Wire Wire Line
	5150 5200 5250 5200
Wire Wire Line
	6500 5300 5150 5300
NoConn ~ 5250 5100
NoConn ~ 5250 5200
Text GLabel 5150 5100 0    60   Input ~ 0
RESET
Text GLabel 5150 5200 0    60   Input ~ 0
AUDIO
Text GLabel 5150 5300 0    60   Input ~ 0
GND
Text GLabel 5150 4850 0    60   Input ~ 0
D7
Text GLabel 5150 4750 0    60   Input ~ 0
D6
Text GLabel 5150 4650 0    60   Input ~ 0
D5
Text GLabel 5150 4550 0    60   Input ~ 0
D4
Text GLabel 5150 4450 0    60   Input ~ 0
D3
Text GLabel 5150 4350 0    60   Input ~ 0
D2
Text GLabel 5150 4250 0    60   Input ~ 0
D1
Text GLabel 5150 4150 0    60   Input ~ 0
D0
Text GLabel 5150 4000 0    60   Input ~ 0
A15
Text GLabel 5150 3900 0    60   Input ~ 0
A14
Text GLabel 5150 3800 0    60   Input ~ 0
A13
Text GLabel 5150 3700 0    60   Input ~ 0
A12
Text GLabel 5150 3600 0    60   Input ~ 0
A11
Text GLabel 5150 3500 0    60   Input ~ 0
A10
Text GLabel 5150 3400 0    60   Input ~ 0
A9
Text GLabel 5150 3300 0    60   Input ~ 0
A8
Text GLabel 5150 3200 0    60   Input ~ 0
A7
Text GLabel 5150 3100 0    60   Input ~ 0
A6
Text GLabel 5150 3000 0    60   Input ~ 0
A5
Text GLabel 5150 2900 0    60   Input ~ 0
A4
Text GLabel 5150 2800 0    60   Input ~ 0
A3
Text GLabel 5150 2700 0    60   Input ~ 0
A2
Text GLabel 5150 2600 0    60   Input ~ 0
A1
Text GLabel 5150 2500 0    60   Input ~ 0
A0
Wire Wire Line
	5150 4000 5250 4000
NoConn ~ 5250 4000
Text GLabel 5150 2250 0    60   Input ~ 0
CS
Text GLabel 5150 2150 0    60   Input ~ 0
RD
Text GLabel 5150 2050 0    60   Input ~ 0
WR
Text GLabel 5150 1950 0    60   Input ~ 0
CLK
Text GLabel 5150 1850 0    60   Input ~ 0
VCC
$Comp
L Device:C C1
U 1 1 5B79B32A
P 6500 4600
F 0 "C1" H 6525 4700 50  0000 L CNN
F 1 "10nF" H 6525 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6538 4450 50  0001 C CNN
F 3 "" H 6500 4600 50  0001 C CNN
	1    6500 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2250 6350 2500
Wire Wire Line
	6350 2700 6400 2700
Wire Wire Line
	6400 2700 6400 2150
Wire Wire Line
	6350 2900 6450 2900
Wire Wire Line
	6450 2900 6450 2050
Wire Wire Line
	6350 4350 6500 4350
Wire Wire Line
	6500 1850 6500 4350
Wire Wire Line
	6350 4850 6500 4850
Wire Wire Line
	6500 4750 6500 4850
Connection ~ 6500 4350
Connection ~ 6500 4850
Wire Wire Line
	6500 4350 6500 4450
Wire Wire Line
	6500 4850 6500 5300
$Comp
L Cartridge-rescue:AT28C256-Custom U1
U 1 1 5B7AF674
P 5850 3650
F 0 "U1" H 5850 4950 60  0000 C CNN
F 1 "AT28C256" H 5850 2300 60  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 5450 2150 60  0001 C CNN
F 3 "" H 5450 2150 60  0001 C CNN
	1    5850 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x32_Male J1
U 1 1 5B7B5413
P 3300 3500
F 0 "J1" H 3350 5100 50  0000 C CNN
F 1 "Conn_01x32_Male" H 3350 1800 50  0000 C CNN
F 2 "Gameboy Cartridge:Edge Connector" H 3300 3500 50  0001 C CNN
F 3 "~" H 3300 3500 50  0001 C CNN
	1    3300 3500
	1    0    0    -1  
$EndComp
Text GLabel 3750 2000 2    50   Input ~ 0
VCC
Wire Wire Line
	3500 2000 3750 2000
Text GLabel 3750 2100 2    60   Input ~ 0
CLK
Wire Wire Line
	3500 2100 3750 2100
Text GLabel 3750 2200 2    60   Input ~ 0
WR
Wire Wire Line
	3500 2200 3750 2200
Text GLabel 3750 2300 2    60   Input ~ 0
RD
Text GLabel 3750 2400 2    60   Input ~ 0
CS
Text GLabel 3750 2500 2    60   Input ~ 0
A0
Text GLabel 3750 2600 2    60   Input ~ 0
A1
Text GLabel 3750 2700 2    60   Input ~ 0
A2
Text GLabel 3750 2800 2    60   Input ~ 0
A3
Text GLabel 3750 2900 2    60   Input ~ 0
A4
Text GLabel 3750 3400 2    60   Input ~ 0
A9
Text GLabel 3750 3300 2    60   Input ~ 0
A8
Text GLabel 3750 3200 2    60   Input ~ 0
A7
Text GLabel 3750 3100 2    60   Input ~ 0
A6
Text GLabel 3750 3000 2    60   Input ~ 0
A5
Text GLabel 3750 3500 2    60   Input ~ 0
A10
Text GLabel 3750 3600 2    60   Input ~ 0
A11
Text GLabel 3750 3700 2    60   Input ~ 0
A12
Text GLabel 3750 3800 2    60   Input ~ 0
A13
Text GLabel 3750 3900 2    60   Input ~ 0
A14
Text GLabel 3750 4000 2    60   Input ~ 0
A15
Text GLabel 3750 4100 2    60   Input ~ 0
D0
Text GLabel 3750 4200 2    60   Input ~ 0
D1
Text GLabel 3750 4300 2    60   Input ~ 0
D2
Text GLabel 3750 4400 2    60   Input ~ 0
D3
Text GLabel 3750 4500 2    60   Input ~ 0
D4
Text GLabel 3750 4600 2    60   Input ~ 0
D5
Text GLabel 3750 4700 2    60   Input ~ 0
D6
Text GLabel 3750 4800 2    60   Input ~ 0
D7
Text GLabel 3750 4900 2    60   Input ~ 0
RESET
Text GLabel 3750 5000 2    60   Input ~ 0
AUDIO
Text GLabel 3750 5100 2    60   Input ~ 0
GND
Wire Wire Line
	3500 5100 3750 5100
Wire Wire Line
	3500 5000 3750 5000
Wire Wire Line
	3750 4900 3500 4900
Wire Wire Line
	3500 4800 3750 4800
Wire Wire Line
	3750 4700 3500 4700
Wire Wire Line
	3500 4600 3750 4600
Wire Wire Line
	3750 4500 3500 4500
Wire Wire Line
	3500 4400 3750 4400
Wire Wire Line
	3750 4300 3500 4300
Wire Wire Line
	3500 2300 3750 2300
Wire Wire Line
	3750 2400 3500 2400
Wire Wire Line
	3500 2500 3750 2500
Wire Wire Line
	3750 2600 3500 2600
Wire Wire Line
	3500 2700 3750 2700
Wire Wire Line
	3750 2800 3500 2800
Wire Wire Line
	3500 2900 3750 2900
Wire Wire Line
	3750 3000 3500 3000
Wire Wire Line
	3500 3100 3750 3100
Wire Wire Line
	3750 3200 3500 3200
Wire Wire Line
	3500 3300 3750 3300
Wire Wire Line
	3750 3400 3500 3400
Wire Wire Line
	3500 3500 3750 3500
Wire Wire Line
	3750 3600 3500 3600
Wire Wire Line
	3500 3700 3750 3700
Wire Wire Line
	3750 3800 3500 3800
Wire Wire Line
	3500 3900 3750 3900
Wire Wire Line
	3750 4000 3500 4000
Wire Wire Line
	3500 4100 3750 4100
Wire Wire Line
	3750 4200 3500 4200
$EndSCHEMATC
