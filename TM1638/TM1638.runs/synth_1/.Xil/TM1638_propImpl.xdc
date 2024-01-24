set_property SRC_FILE_INFO {cfile:D:/WorkSpace/Mag/3/Vivado/Course-work/Course-work/TM1638/TM1638.srcs/constrs_1/new/TM1638.xdc rfile:../../../TM1638.srcs/constrs_1/new/TM1638.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports rst]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports dio]
set_property src_info {type:XDC file:1 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS33} [get_ports clk_kHz]
set_property src_info {type:XDC file:1 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN A11 IOSTANDARD LVCMOS33} [get_ports stb]
set_property src_info {type:XDC file:1 line:225 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_0 ila
set_property src_info {type:XDC file:1 line:226 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:227 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:228 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:229 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 131072 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:230 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:231 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:232 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:233 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:234 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
set_property src_info {type:XDC file:1 line:235 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property src_info {type:XDC file:1 line:236 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:237 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:238 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list clk_kHz_OBUF]]
set_property src_info {type:XDC file:1 line:239 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:240 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:241 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:242 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe1 [get_nets [list dio_OBUF]]
set_property src_info {type:XDC file:1 line:243 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:244 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:245 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
set_property src_info {type:XDC file:1 line:246 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe2 [get_nets [list stb_OBUF]]
set_property src_info {type:XDC file:1 line:247 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:248 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:249 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:250 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
