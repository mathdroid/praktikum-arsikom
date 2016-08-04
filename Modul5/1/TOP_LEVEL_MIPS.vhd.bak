-- Praktikum EL3111 Arsitektur Sistem Komputer 
-- Modul 		: 05
-- Percobaan 	: 01
-- Tanggal 		: 4 Desember 2014
-- Kelompok 	: 13 
-- Rombongan 	: D 
-- Nama (NIM) 1 : Muhammad Nur Pratama (13212140) 
-- Nama (NIM) 2 : Jedidiah Wahana (13212141) 
-- Nama File 	: top_level_mips.vhd

LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 

ENTITY top_level_mips IS
	PORT(
		clock, reset		: IN STD_LOGIC;
		--sinyal yang ditest
		ALU_result_out		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		PCin_out			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		PCout_out			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		instr_out			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		pcplus4_out			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		rd1_out				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		rd2_out				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		instr_15_11_out		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
		instr_20_16_out		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
		instr_25_21_out		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
		signJump_out		: OUT STD_LOGIC;
		signBNE_out			: OUT STD_LOGIC;
		signBranch_out		: OUT STD_LOGIC;
		signMemToReg_out	: OUT STD_LOGIC;
		signMemRead_out		: OUT STD_LOGIC;
		signMemWrite_out	: OUT STD_LOGIC;
		signRegdest_out		: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		signRegwrite_out	: OUT STD_LOGIC;
		signALUsrc_out		: OUT STD_LOGIC;
		signALUctrl_out		: OUT STD_LOGIC;
		signextend_out		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		leftshift28_out		: OUT STD_LOGIC_VECTOR (27 DOWNTO 0);
		leftshift32_out		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		BranchResult		: OUT STD_LOGIC;
		RDData_out			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		WRData3_out			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		OP_In_out			: OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
		FUNCT_In_out		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
END top_level_mips;

ARCHITECTURE structure OF top_level_mips IS
	--deklarasi komponen
	COMPONENT ALU
		PORT (
			OPRND_1		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			OPRND_2		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			OP_SEL		: IN STD_LOGIC;
			RESULT		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT bus_merger
		PORT (
			DATA_IN1	: IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- Data Input 1 
			DATA_IN2	: IN STD_LOGIC_VECTOR (27 DOWNTO 0); -- Data Input 2 
			DATA_OUT	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0) -- Selected Data 
		);
	END COMPONENT;
	
	COMPONENT cla_32
		PORT (
			OPRND_1		: IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- Operand 1
			OPRND_2		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Operand 2
			C_IN		: IN STD_LOGIC; -- Carry In
			RESULT		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Result
			C_OUT		: OUT STD_LOGIC -- Overflow
		);
	END COMPONENT;
	
	COMPONENT comparator
		PORT (
			D_1			: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 1 
			D_2			: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 2 
			EQ			: OUT STD_LOGIC -- Selected Data 
		);
	END COMPONENT;
	
	COMPONENT cu
		PORT (
			OP_In		 	: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			FUNCT_In 		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			Sig_Jmp 		: OUT STD_LOGIC;
			Sig_Bne 		: OUT STD_LOGIC;
			Sig_Branch 		: OUT STD_LOGIC;
			Sig_MemtoReg	: OUT STD_LOGIC;
			Sig_MemRead 	: OUT STD_LOGIC;
			Sig_MemWrite 	: OUT STD_LOGIC;
			Sig_RegDest 	: OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
			Sig_RegWrite 	: OUT STD_LOGIC;
			Sig_ALUSrc 		: OUT STD_LOGIC;
			Sig_ALUCtrl 	: OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT data_memory
		PORT(
			ADDR		: IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- Alamat 
			WR_EN		: IN STD_LOGIC; -- Indikator Penulisan 
			RD_EN		: IN STD_LOGIC; -- Indikator Pembacaan 
			clock		: IN STD_LOGIC; -- clock 
			RD_Data		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0); 
			WR_Data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT instruction_memory
		PORT(
			ADDR		: IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- Alamat 
			clock,reset	: IN STD_LOGIC; -- Clock 
			INSTR		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0) -- Output 
		);
	END COMPONENT;
	
	COMPONENT lshift_26_28
		PORT (
			D_IN		: IN STD_LOGIC_VECTOR (25 DOWNTO 0); -- Input 26 bit;
			D_OUT		: OUT STD_LOGIC_VECTOR (27 DOWNTO 0) -- Output 28 bit;
		);
	END COMPONENT;
	
	COMPONENT lshift_32_32
		PORT (
			D_IN		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Input 32 bit;
			D_OUT		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0) -- Output 32 bit;
		);
	END COMPONENT;
	
	COMPONENT mux_2to1_32bit
		PORT (
			D1		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 1
			D2		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 2
			Y		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Selected Data
			S		: IN STD_LOGIC -- Selector
		);
	END COMPONENT;
	
	COMPONENT mux_4to1_5bit
		PORT (
			D1		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Data Input 1
			D2		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Data Input 2
			D3		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Data Input 3
			D4		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Data Input 4
			Y		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0); -- Selected Data
			S		: IN STD_LOGIC_VECTOR (1 DOWNTO 0) -- Selector
		);
	END COMPONENT;
	
	COMPONENT mux_4to1_32bit
		PORT (
			D1		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 1
			D2		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 2
			D3		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 3
			D4		: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- Data Input 4
			Y		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- Selected Data
			S		: IN STD_LOGIC_VECTOR (1 DOWNTO 0) -- Selector
		);
	END COMPONENT;
	
	COMPONENT program_counter
		PORT (
			clk,reset	: IN STD_LOGIC;
			PC_in		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			PC_out		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT reg_file
		PORT (
			clock 		: IN STD_LOGIC; 							-- Clock 
			WR_EN 		: IN STD_LOGIC; 							-- Write enable 
			ADDR_1 		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); 		-- Input 1 
			ADDR_2 		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); 		-- Input 2 
			ADDR_3 		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); 		-- Input 3 
			WR_Data_3 	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);		-- Write data 
			RD_Data_1 	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);		-- Read data 1 
			RD_Data_2 	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 		-- Read data 2 
		); 
	END COMPONENT;
	
	COMPONENT sign_extender
		PORT (
			D_In		: IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- Data Input 1
			D_Out		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0) -- Data Input 2
		);
	END COMPONENT;
	
	--sinyal buffer
	SIGNAL PCin				: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL PCout			: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL instr			: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL pcplus4			: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL out2to1mux1		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL out2to1mux2		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL out4to1mux5bit	: STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL datatowrite		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL busmerge			: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL signJump			: STD_LOGIC;
	SIGNAL signBNE			: STD_LOGIC;
	SIGNAL signBranch		: STD_LOGIC;
	SIGNAL signMemToReg		: STD_LOGIC;
	SIGNAL signMemRead		: STD_LOGIC;
	SIGNAL signMemWrite		: STD_LOGIC;
	SIGNAL signRegdest		: STD_LOGIC_VECTOR (1 DOWNTO 0);
	SIGNAL signRegwrite		: STD_LOGIC;
	SIGNAL signALUsrc		: STD_LOGIC;
	SIGNAL signALUctrl		: STD_LOGIC;
	SIGNAL outCLA2			: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL rd1				: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL rd2				: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL outcomparator	: STD_LOGIC;
	SIGNAL ALU_result		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL signextend		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL leftshift28		: STD_LOGIC_VECTOR (27 DOWNTO 0);
	SIGNAL leftshift32		: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL RDdata			: STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL signBranchResult	: STD_LOGIC;
	SIGNAL reset_in			: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL RD_Data1			: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL carryout1		: STD_LOGIC;
	SIGNAL carryout2		: STD_LOGIC;
	
BEGIN
	signBranchResult <= (outcomparator AND signBranch) OR ((NOT outcomparator) AND signBNE);
	RD_Data1 <= "000000000000000000000000" & RDdata;
	
	--pemanggilan komponen
	ALU_1 : ALU
	PORT MAP (
		OPRND_1		=> rd1, --IN 32 bit
		OPRND_2		=> out2to1mux2, --IN 32 bit
		OP_SEL		=> signALUctrl, --IN
		RESULT		=> ALU_result --OUT 32 bit
	);
	
	bus_merger_1 : bus_merger
	PORT MAP (
		DATA_IN1	=> pcplus4 (31 DOWNTO 28), --IN 4 bit
		DATA_IN2	=> leftshift28, --IN 28 bit
		DATA_OUT	=> busmerge --OUT 32 bit
	);
	
	cla_32_1 : cla_32
	PORT MAP (
		OPRND_1		=> PCout, --IN 32 bit
		OPRND_2		=> "00000000000000000000000000000100", --IN 32 bit
		C_IN		=> '0', --IN
		RESULT		=> pcplus4, --OUT 32 bit
		C_OUT		=> carryout1 --OUT --dontcare
	);
	
	cla_32_2 : cla_32
	PORT MAP (
		OPRND_1		=> leftshift32, --IN 32 bit
		OPRND_2		=> pcplus4, --IN 32 bit
		C_IN		=> '0', --IN
		RESULT		=> outCLA2, --OUT 32 bit
		C_OUT		=> carryout2 --OUT --dontcare
	);
	
	comparator_1 : comparator
	PORT MAP (
		D_1			=> rd1, --IN 32 bit
		D_2			=> rd2, --IN 32 bit
		EQ			=> outcomparator --OUT
	);
	
	cu_1 : cu
	PORT MAP (
		OP_In		 	=> instr (31 DOWNTO 26), --IN 6 bit
		FUNCT_In 		=> instr (5 DOWNTO 0), --IN 6 bit
		Sig_Jmp 		=> signJump, --OUT
		Sig_Bne 		=> signBNE, --OUT
		Sig_Branch 		=> signBranch, --OUT
		Sig_MemtoReg	=> signMemToReg, --OUT
		Sig_MemRead 	=> signMemRead, --OUT
		Sig_MemWrite 	=> signMemWrite, --OUT
		Sig_RegDest 	=> signRegdest, --OUT 2 bit
		Sig_RegWrite 	=> signRegwrite, --OUT
		Sig_ALUSrc 		=> signALUsrc, --OUT
		Sig_ALUCtrl 	=> signALUctrl --OUT 2 bit
	);
	
	data_memory_1 : data_memory
	PORT MAP (
		ADDR		=> ALU_result (7 DOWNTO 0), --IN 8 bit
		WR_EN		=> signMemWrite, --IN
		RD_EN		=> signMemRead, --IN
		clock		=> clock, --IN
		RD_Data		=> RDdata, --OUT 8 bit
		WR_Data		=> rd2 (7 DOWNTO 0) --IN 8 bit
	);
	
	instruction_memory_1 : instruction_memory
	PORT MAP (
		ADDR		=> PCout (15 DOWNTO 0), --IN 16 bit
		clock		=> clock, --IN
		reset		=> reset,
		INSTR		=> instr --OUT 32 bit
	);
	
	lshift_26_28_1 : lshift_26_28
	PORT MAP (
		D_IN		=> instr (25 DOWNTO 0), --IN 26 bit
		D_OUT		=> leftshift28 --OUT 28 bit
	);
	
	lshift_32_32_1 : lshift_32_32
	PORT MAP (
		D_IN		=> signextend, --IN 32 bit
		D_OUT		=> leftshift32 --OUT 32 bit
	);
	
	mux_2to1_32bit_1 : mux_2to1_32bit
	PORT MAP (
		D1			=> pcplus4, --IN 32 bit
		D2			=> outCLA2, --IN 32 bit
		Y			=> out2to1mux1, --OUT 32 bit
		S			=> signBranchResult --IN
	);
	
	mux_2to1_32bit_2 : mux_2to1_32bit
	PORT MAP (
		D1			=> rd2, --IN 32 bit
		D2			=> signextend, --IN 32 bit
		Y			=> out2to1mux2, --OUT 32 bit
		S			=> signALUsrc --IN
	);
	
	mux_2to1_32bit_3 : mux_2to1_32bit
	PORT MAP (
		D1			=> out2to1mux1, --IN 32 bit
		D2			=> busmerge, --IN 32 bit
		Y			=> reset_in, --OUT 32 bit
		S			=> signJump --IN 2 bit
	);
	
	mux_2to1_32bit_4 : mux_2to1_32bit
	PORT MAP (
		D1			=> reset_in, --IN 32 bit
		D2			=> "00000000000000000000000000000000", --IN 32 bit
		Y			=> PCin, --OUT 32 bit
		S			=> reset --IN 2 bit
	);
	
	mux_2to1_32bit_5 : mux_2to1_32bit
	PORT MAP (
		D1			=> ALU_result, --IN 32 bit
		D2			=> RD_Data1, --IN 32 bit
		Y			=> datatowrite,  --OUT 32 bit
		S			=> signMemToReg --IN
	);
	
	mux_4to1_5bit_1 : mux_4to1_5bit
	PORT MAP (
		D1			=> instr (20 DOWNTO 16), --IN 5 bit
		D2			=> instr (15 DOWNTO 11), --IN 5 bit
		D3			=> "00000", --IN 5 bit
		D4			=> "00000", --IN 5 bit
		Y			=> out4to1mux5bit, --OUT 5 bit
		S			=> signRegdest --IN 2 bit
	);
	
	program_counter_1 : program_counter
	PORT MAP (
		reset		=> reset,
		clk			=> clock, --IN
		PC_in		=> PCin, --IN 32 bit
		PC_out		=> PCout --OUT 32 bit
	);
	
	reg_file_1 : reg_file
	PORT MAP (
		clock 		=> clock, --IN
		WR_EN 		=> signRegwrite, --IN
		ADDR_1 		=> instr (25 DOWNTO 21), --IN 5 bit
		ADDR_2 		=> instr (20 DOWNTO 16), --IN 5 bit
		ADDR_3 		=> out4to1mux5bit, --IN 5 bit
		WR_Data_3 	=> datatowrite, --IN 32 bit
		RD_Data_1 	=> rd1, --OUT 32 bit
		RD_Data_2 	=> rd2 --OUT 32 bit
	);
	
	sign_extender_1 : sign_extender
	PORT MAP (
		D_In		=> instr (15 DOWNTO 0), --IN 16 bit
		D_Out		=> signextend --OUT 32 bit
	);
	
	ALU_result_out		<= ALU_result;
	PCin_out			<= PCin;
	PCout_out			<= PCout;
	instr_out			<= instr;
	pcplus4_out			<= pcplus4;
	rd1_out				<= rd1;
	rd2_out				<= rd2;
	instr_15_11_out		<= instr (15 DOWNTO 11);
	instr_20_16_out		<= instr (20 DOWNTO 16);
	instr_25_21_out		<= instr (25 DOWNTO 21);
	signJump_out		<= signJump;
	signBNE_out			<= signBNE;
	signBranch_out		<= signBranch;
	signMemToReg_out	<= signMemToReg;
	signMemRead_out		<= signMemRead;
	signMemWrite_out	<= signMemWrite;
	signRegdest_out		<= signRegdest;
	signRegwrite_out	<= signRegwrite;
	signALUsrc_out		<= signALUsrc;
	signALUctrl_out		<= signALUctrl;
	ALU_result_out		<= ALU_result;
	signextend_out		<= signextend;
	leftshift28_out		<= leftshift28;
	leftshift32_out		<= leftshift32;
	BranchResult		<= signBranchResult;
	RDData_out			<= RDdata;
	WRData3_out			<= datatowrite;
	OP_In_out			<= instr (31 DOWNTO 26);
	FUNCT_In_out		<= instr (5 DOWNTO 0);
END structure;