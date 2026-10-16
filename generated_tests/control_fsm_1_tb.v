`timescale 1ns/1ps

module tb_control_fsm;

    // Inputs
    reg [4:0] op_code;
    reg [1:0] reg_instr_op;

    // Outputs
    wire halt;
    wire exception;
    wire reg_write;
    wire imm_len;
    wire imm_sign;
    wire RTI;
    wire mem_write;
    wire mem_read;
    wire branch;
    wire mem_to_reg;
    wire J_JAL;
    wire JR_JALR;
    wire JAL_JALR;
    wire [1:0] rd_sel;
    wire [4:0] ALU_fn;

    // Instantiate the Unit Under Test (UUT)
    control_fsm uut (
        .op_code(op_code),
        .reg_instr_op(reg_instr_op),
        .halt(halt),
        .exception(exception),
        .reg_write(reg_write),
        .imm_len(imm_len),
        .imm_sign(imm_sign),
        .RTI(RTI),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .branch(branch),
        .mem_to_reg(mem_to_reg),
        .J_JAL(J_JAL),
        .JR_JALR(JR_JALR),
        .JAL_JALR(JAL_JALR),
        .rd_sel(rd_sel),
        .ALU_fn(ALU_fn)
    );

    // Clock generation
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        op_code = 5'b00000; // Default state
        reg_instr_op = 2'b00;

        // Test HALT
        #10 op_code = 5'h00; // HALT
        #10;
        if (!halt) $display("FAIL: HALT signal not asserted");
        
        // Test ADDI
        #10 op_code = 5'h08; // ADDI
        #10;
        if (!reg_write || !imm_len || !imm_sign || (ALU_fn !== 5'b00000)) 
            $display("FAIL: ADDI control signals incorrect");

        // Test SUBI
        #10 op_code = 5'h09; // SUBI
        #10;
        if (!reg_write || !imm_len || !imm_sign || (ALU_fn !== 5'b00001)) 
            $display("FAIL: SUBI control signals incorrect");

        // Test LD
        #10 op_code = 5'h11; // LD
        #10;
        if (!reg_write || !mem_read || !mem_to_reg || !imm_len || !imm_sign) 
            $display("FAIL: LD control signals incorrect");

        // Test ST
        #10 op_code = 5'h10; // ST
        #10;
        if (!mem_write || !imm_len || !imm_sign) 
            $display("FAIL: ST control signals incorrect");

        // Test JAL
        #10 op_code = 5'h06; // JAL
        #10;
        if (!reg_write || !J_JAL || (rd_sel !== 2'b11)) 
            $display("FAIL: JAL control signals incorrect");

        // Test JR
        #10 op_code = 5'h05; // JR
        #10;
        if (!JR_JALR || (ALU_fn !== 5'b11001)) 
            $display("FAIL: JR control signals incorrect");

        // Test exception handling
        #10 op_code = 5'h02; // SIIC
        #10;
        if (!exception) 
            $display("FAIL: Exception signal not asserted");

        // Test RTI
        #10 op_code = 5'h03; // RTI_INSTR
        #10;
        if (!RTI) 
            $display("FAIL: RTI signal not asserted");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule