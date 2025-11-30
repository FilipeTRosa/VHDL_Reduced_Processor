onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb/clock_sg
add wave -noupdate -radix decimal /tb/reset_sg
add wave -noupdate -divider processador
add wave -noupdate -radix decimal /tb/inst_processador_mono/clock
add wave -noupdate -radix decimal /tb/inst_processador_mono/reset
add wave -noupdate -radix decimal /tb/inst_processador_mono/inst
add wave -noupdate -radix decimal /tb/inst_processador_mono/opcode
add wave -noupdate -radix decimal /tb/inst_processador_mono/reg0
add wave -noupdate -radix decimal /tb/inst_processador_mono/reg1
add wave -noupdate -radix decimal /tb/inst_processador_mono/regDest
add wave -noupdate -radix decimal /tb/inst_processador_mono/imm
add wave -noupdate -radix decimal /tb/inst_processador_mono/memInst
add wave -noupdate -radix decimal /tb/inst_processador_mono/pc
add wave -noupdate -radix decimal /tb/inst_processador_mono/enableReg
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaOut
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaIn0
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaIn1
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaOp
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaComp
add wave -noupdate -radix decimal /tb/inst_processador_mono/memDataEnd
add wave -noupdate -radix decimal /tb/inst_processador_mono/memDatain
add wave -noupdate -radix decimal /tb/inst_processador_mono/memDataOut
add wave -noupdate -radix decimal /tb/inst_processador_mono/brReg0
add wave -noupdate -radix decimal /tb/inst_processador_mono/brReg1
add wave -noupdate -radix decimal /tb/inst_processador_mono/brRegDest
add wave -noupdate -radix decimal /tb/inst_processador_mono/brData
add wave -noupdate -radix decimal /tb/inst_processador_mono/brEnable
add wave -noupdate -radix decimal /tb/inst_processador_mono/brOut0
add wave -noupdate -divider ULA
add wave -noupdate -radix decimal /tb/inst_processador_mono/brOut1
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaProcess/ulaOp
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaProcess/ulaIn_0
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaProcess/ulaIn_1
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaProcess/ulaOut
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaProcess/ulaComp
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaProcess/comp
add wave -noupdate -divider BR
add wave -noupdate -radix decimal /tb/inst_processador_mono/ulaProcess/multi
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/brReg0
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/brReg1
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/brRegDest
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/brData
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/brEnable
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/clock
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/brOut0
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/brOut1
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/br_o
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/endBr0
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/endBr1
add wave -noupdate -divider MEMORIA
add wave -noupdate -radix decimal /tb/inst_processador_mono/bregistradoresProcess/endRegDest
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/memDataEnd
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/memDataOut
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/opcode
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/memDataIn
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/clock
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/mem_ram
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/endInt
add wave -noupdate -radix decimal /tb/inst_processador_mono/memoriaProcess/enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
