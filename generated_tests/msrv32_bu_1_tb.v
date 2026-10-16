`timescale 1ns/1ps

module tb_msrv32_bu;

    reg [4:0] opcode_6_to_2_in;
    reg [2:0] funct3_in;
    reg [31:0] rs1_in, rs2_in;
    wire branch_taken_out;

    // Instantiate the module under test
    msrv32_bu uut (
        .opcode_6_to_2_in(opcode_6_to_2_in),
        .funct3_in(funct3_in),
        .rs1_in(rs1_in),
        .rs2_in(rs2_in),
        .branch_taken_out(branch_taken_out)
    );

    initial begin
        // Test case 1: Equal registers for BEQ
        opcode_6_to_2_in = 5'b11000; // OPCODE_BRANCH
        funct3_in = 3'b000; // BEQ
        rs1_in = 32'hA; 
        rs2_in = 32'hA; 
        #10;
        if (branch_taken_out !== 1'b1) $display("FAIL: Test case 1 failed (BEQ)"); 

        // Test case 2: Not equal registers for BNE
        funct3_in = 3'b001; // BNE
        rs2_in = 32'hB; 
        #10;
        if (branch_taken_out !== 1'b1) $display("FAIL: Test case 2 failed (BNE)"); 

        // Test case 3: Less than for BLT
        funct3_in = 3'b110; // BLT
        rs1_in = 32'hA; 
        rs2_in = 32'hB; 
        #10;
        if (branch_taken_out !== 1'b1) $display("FAIL: Test case 3 failed (BLT)"); 

        // Test case 4: Greater than or equal for BGE
        funct3_in = 3'b111; // BGE
        rs1_in = 32'hB; 
        rs2_in = 32'hA; 
        #10;
        if (branch_taken_out !== 1'b1) $display("FAIL: Test case 4 failed (BGE)"); 

        // Test case 5: JAL instruction
        opcode_6_to_2_in = 5'b11011; // OPCODE_JAL
        funct3_in = 3'bxxx; // Don't care
        #10;
        if (branch_taken_out !== 1'b1) $display("FAIL: Test case 5 failed (JAL)"); 

        // Test case 6: JALR instruction
        opcode_6_to_2_in = 5'b11001; // OPCODE_JALR
        #10;
        if (branch_taken_out !== 1'b1) $display("FAIL: Test case 6 failed (JALR)"); 

        // Test case 7: Default case
        opcode_6_to_2_in = 5'b00000; // Invalid opcode
        funct3_in = 3'b000; // BEQ
        #10;
        if (branch_taken_out !== 1'b0) $display("FAIL: Test case 7 failed (default case)"); 

        $display("PASS");
        $finish;
    end

endmodule