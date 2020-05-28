EESchema Schematic File Version 4
EELAYER 30 0
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
$Comp
L Connector_Generic:Conn_01x32 J?
U 1 1 5ED073BA
P 4150 3450
F 0 "J?" H 4150 5050 50  0000 C CNN
F 1 "PAK_CONNECTOR" H 3900 1750 50  0000 C CNN
F 2 "" H 4150 3450 50  0001 C CNN
F 3 "~" H 4150 3450 50  0001 C CNN
	1    4150 3450
	-1   0    0    -1  
$EndComp
$Comp
L AT28C256:AT28C256-15PU U?
U 1 1 5ED08DF2
P 5200 3150
F 0 "U?" H 5200 3150 50  0000 C CNN
F 1 "AT28C256-15PU" H 5200 2350 50  0000 C CNN
F 2 "" H 5200 3150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0006.pdf" H 5200 3150 50  0001 C CNN
	1    5200 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2450 4750 2450
Wire Wire Line
	4750 2550 4350 2550
Wire Wire Line
	4350 2650 4750 2650
Wire Wire Line
	4350 2750 4750 2750
Wire Wire Line
	4750 2850 4350 2850
Wire Wire Line
	4350 2950 4750 2950
Wire Wire Line
	4350 3050 4750 3050
Wire Wire Line
	4750 3150 4350 3150
Wire Wire Line
	4350 3250 4750 3250
Wire Wire Line
	4350 3350 4750 3350
Wire Wire Line
	4750 3450 4350 3450
Wire Wire Line
	4350 3550 4750 3550
Wire Wire Line
	4350 3650 4750 3650
Wire Wire Line
	4750 3750 4350 3750
Wire Wire Line
	4350 3850 4750 3850
Wire Wire Line
	5750 3850 5650 3850
Wire Wire Line
	5650 3750 5850 3750
Wire Wire Line
	5950 3650 5650 3650
Wire Wire Line
	5650 3550 6050 3550
Wire Wire Line
	5650 3450 6150 3450
Wire Wire Line
	5650 3350 6250 3350
Wire Wire Line
	5650 3250 6350 3250
Wire Wire Line
	5650 3150 6450 3150
Wire Wire Line
	4350 1950 5750 1950
Wire Wire Line
	5750 1950 5750 2450
Wire Wire Line
	5750 2450 5650 2450
Wire Wire Line
	5650 2550 6550 2550
Wire Wire Line
	6550 2550 6550 2400
$Comp
L Device:C C?
U 1 1 5ED10C7E
P 6550 2250
F 0 "C?" H 6665 2296 50  0000 L CNN
F 1 "10n" H 6665 2205 50  0000 L CNN
F 2 "" H 6588 2100 50  0001 C CNN
F 3 "~" H 6550 2250 50  0001 C CNN
	1    6550 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1950 5750 1950
Wire Wire Line
	6550 1950 6550 2100
Connection ~ 5750 1950
Wire Wire Line
	6550 2550 6550 5050
Wire Wire Line
	6550 5050 4350 5050
Connection ~ 6550 2550
NoConn ~ 4350 4950
NoConn ~ 4350 4850
Wire Wire Line
	4350 4350 6150 4350
Wire Wire Line
	4350 4250 6250 4250
Wire Wire Line
	4350 4150 6350 4150
Wire Wire Line
	4350 4050 6450 4050
Wire Wire Line
	4350 4450 6050 4450
Wire Wire Line
	4350 4550 5950 4550
Wire Wire Line
	4350 4650 5850 4650
Wire Wire Line
	4350 4750 5750 4750
NoConn ~ 4350 3950
Wire Wire Line
	5750 3850 5750 4750
Wire Wire Line
	5850 3750 5850 4650
Wire Wire Line
	5950 3650 5950 4550
Wire Wire Line
	6050 3550 6050 4450
Wire Wire Line
	6150 3450 6150 4350
Wire Wire Line
	6250 3350 6250 4250
Wire Wire Line
	6350 3250 6350 4150
Wire Wire Line
	6450 3150 6450 4050
NoConn ~ 4350 2050
Wire Wire Line
	5650 2950 6050 2950
Wire Wire Line
	6050 2950 6050 2350
Wire Wire Line
	6050 2350 4350 2350
Wire Wire Line
	5650 2750 5850 2750
Wire Wire Line
	5850 2750 5850 2150
Wire Wire Line
	5850 2150 4350 2150
Wire Wire Line
	4350 2250 5950 2250
Wire Wire Line
	5950 2250 5950 2850
Wire Wire Line
	5950 2850 5650 2850
$EndSCHEMATC
