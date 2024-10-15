onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_stopwatch/clk_50Mhz
add wave -noupdate /tb_stopwatch/reset
add wave -noupdate /tb_stopwatch/start_pause
add wave -noupdate /tb_stopwatch/hex0
add wave -noupdate /tb_stopwatch/hex1
add wave -noupdate /tb_stopwatch/hex2
add wave -noupdate /tb_stopwatch/hex3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4520 ns} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {5019 ns}
