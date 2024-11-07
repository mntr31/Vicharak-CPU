transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/CPU.v}
vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/ProgramCounter.v}
vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/InstDeco.v}
vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/InstFetch.v}
vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/ControlUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU {C:/Users/mantr/Desktop/Vicharak/Vicharak-CPU/DataMemory.v}

