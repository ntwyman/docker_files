.PHONY sel4_dev:
sel4_dev: riscv
ifeq ("$(shell docker images -q sel4_dev 2>/dev/null)", "")
	docker build sel4 -t sel4_dev
endif

.PHONY riscv:
riscv:
ifeq ("$(shell docker images -q riscv 2>/dev/null)","")
	docker build gnu-riscv -t riscv
endif
	

