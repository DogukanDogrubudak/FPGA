
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:072

00:00:082	
549.6372	
234.828Z17-268h px� 
�
Command: %s
1870*	planAhead2n
lread_checkpoint -auto_incremental -incremental C:/FPGA/UART/UART.srcs/utils_1/imports/synth_1/top_module.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2?
=C:/FPGA/UART/UART.srcs/utils_1/imports/synth_1/top_module.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
f
Command: %s
53*	vivadotcl25
3synth_design -top top_module -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 
[
$Part: %s does not have CEAM library.966*device2
xc7a100tcsg324-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
17216Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1419.039 ; gain = 448.629
h px� 
�
synthesizing module '%s'638*oasys2

top_module27
3C:/FPGA/UART/UART.srcs/sources_1/new/top_module.vhd2
258@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Seven_Segment28
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
52

component12
Seven_Segment27
3C:/FPGA/UART/UART.srcs/sources_1/new/top_module.vhd2
838@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Seven_Segment2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
128@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Clock_Divider28
6C:/FPGA/UART/UART.srcs/sources_1/new/Clock_Divider.vhd2
62

component12
Clock_Divider2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
448@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Clock_Divider2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Clock_Divider.vhd2
138@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Clock_Divider2
02
12:
6C:/FPGA/UART/UART.srcs/sources_1/new/Clock_Divider.vhd2
138@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
Decoder22
0C:/FPGA/UART/UART.srcs/sources_1/new/Decoder.vhd2
42

component22	
Decoder2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
458@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
Decoder24
0C:/FPGA/UART/UART.srcs/sources_1/new/Decoder.vhd2
118@Z8-638h px� 
}
default block is never used226*oasys24
0C:/FPGA/UART/UART.srcs/sources_1/new/Decoder.vhd2
188@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
Decoder2
02
124
0C:/FPGA/UART/UART.srcs/sources_1/new/Decoder.vhd2
118@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Input_Controller2;
9C:/FPGA/UART/UART.srcs/sources_1/new/Input_Controller.vhd2
42

component32
Input_Controller2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
468@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Input_Controller2=
9C:/FPGA/UART/UART.srcs/sources_1/new/Input_Controller.vhd2
118@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Input_Controller2
02
12=
9C:/FPGA/UART/UART.srcs/sources_1/new/Input_Controller.vhd2
118@Z8-256h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
X2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
488@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
temp2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
488@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Seven_Segment2
02
12:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
128@Z8-256h px� 
M
%s
*synth25
3	Parameter TOTAL_BITS bound to: 8 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter BAUD_RATE bound to: 115200 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter SYS_FREQ bound to: 100000000 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
uart_rx22
0C:/FPGA/UART/UART.srcs/sources_1/new/uart_rx.vhd2
42

component22	
uart_rx27
3C:/FPGA/UART/UART.srcs/sources_1/new/top_module.vhd2
858@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
uart_rx24
0C:/FPGA/UART/UART.srcs/sources_1/new/uart_rx.vhd2
218@Z8-638h px� 
M
%s
*synth25
3	Parameter TOTAL_BITS bound to: 8 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter SYS_FREQ bound to: 100000000 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter BAUD_RATE bound to: 115200 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
uart_rx2
02
124
0C:/FPGA/UART/UART.srcs/sources_1/new/uart_rx.vhd2
218@Z8-256h px� 
M
%s
*synth25
3	Parameter TOTAL_BITS bound to: 9 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter BAUD_RATE bound to: 115200 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter SYS_FREQ bound to: 100000000 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
uart_tx22
0C:/FPGA/UART/UART.srcs/sources_1/new/uart_tx.vhd2
42

component32	
uart_tx27
3C:/FPGA/UART/UART.srcs/sources_1/new/top_module.vhd2
888@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
uart_tx24
0C:/FPGA/UART/UART.srcs/sources_1/new/uart_tx.vhd2
248@Z8-638h px� 
M
%s
*synth25
3	Parameter TOTAL_BITS bound to: 9 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter SYS_FREQ bound to: 100000000 - type: integer 
h p
x
� 
Q
%s
*synth29
7	Parameter BAUD_RATE bound to: 115200 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
uart_tx2
02
124
0C:/FPGA/UART/UART.srcs/sources_1/new/uart_tx.vhd2
248@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

top_module2
02
127
3C:/FPGA/UART/UART.srcs/sources_1/new/top_module.vhd2
258@Z8-256h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1530.363 ; gain = 559.953
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1530.363 ; gain = 559.953
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1530.363 ; gain = 559.953
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0052

1530.3632
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
r
Parsing XDC File [%s]
179*designutils21
-C:/FPGA/UART/UART.srcs/constrs_1/new/UART.xdc8Z20-179h px� 
{
Finished Parsing XDC File [%s]
178*designutils21
-C:/FPGA/UART/UART.srcs/constrs_1/new/UART.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2/
-C:/FPGA/UART/UART.srcs/constrs_1/new/UART.xdc2
.Xil/top_module_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1625.8552
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0032

1625.8552
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
k
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2	
uart_rxZ8-802h px� 
k
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2	
uart_txZ8-802h px� 
�
!inferring latch for variable '%s'327*oasys2
X_reg2=
9C:/FPGA/UART/UART.srcs/sources_1/new/Input_Controller.vhd2
318@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

temp_reg2:
6C:/FPGA/UART/UART.srcs/sources_1/new/Seven_Segment.vhd2
538@Z8-327h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                   start |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                   shift |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                    stop |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2	
uart_rxZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                   start |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_                   shift |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                    stop |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2	
uart_txZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 2     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 4     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   4 Input   10 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   8 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   8 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 11    
h p
x
� 
F
%s
*synth2.
,	   8 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 11    
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 2     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
component1/temp_reg[7]2

top_moduleZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
component1/temp_reg[0]2

top_moduleZ8-3332h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     2|
h px� 
2
%s*synth2
|2     |CARRY4 |    25|
h px� 
2
%s*synth2
|3     |LUT1   |    15|
h px� 
2
%s*synth2
|4     |LUT2   |    45|
h px� 
2
%s*synth2
|5     |LUT3   |    18|
h px� 
2
%s*synth2
|6     |LUT4   |    20|
h px� 
2
%s*synth2
|7     |LUT5   |    34|
h px� 
2
%s*synth2
|8     |LUT6   |    47|
h px� 
2
%s*synth2
|9     |FDRE   |   126|
h px� 
2
%s*synth2
|10    |FDSE   |     4|
h px� 
2
%s*synth2
|11    |LD     |     9|
h px� 
2
%s*synth2
|12    |IBUF   |    12|
h px� 
2
%s*synth2
|13    |OBUF   |    18|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:38 ; elapsed = 00:00:39 . Memory (MB): peak = 1625.855 ; gain = 655.445
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 5 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:27 ; elapsed = 00:00:37 . Memory (MB): peak = 1625.855 ; gain = 559.953
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:38 ; elapsed = 00:00:40 . Memory (MB): peak = 1625.855 ; gain = 655.445
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0052

1625.8552
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
34Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1625.8552
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2G
E  A total of 9 instances were transformed.
  LD => LDCE: 9 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

2e6b275eZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
472
72
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:432

00:00:472

1625.8552

1072.016Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:012
00:00:00.0022

1625.8552
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2/
-C:/FPGA/UART/UART.runs/synth_1/top_module.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2_
]report_utilization -file top_module_utilization_synth.rpt -pb top_module_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Wed Dec 18 03:53:24 2024Z17-206h px� 


End Record