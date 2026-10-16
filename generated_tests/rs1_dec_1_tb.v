`timescale 1ns/1ps

module tb_rs1_dec;

    reg [15:0] opcode;
    reg [2:0] valid;
    wire valid_rs1;
    wire [4:0] offset_sel_rs1;
    wire mem_op;
    wire help_rs1;
    wire [7:0] type;
    wire lv_rs1;
    wire lvars_acc_rs1;
    wire reverse_ops;
    wire st_index_op;
    wire update_optop;

    // Instantiate the Unit Under Test (UUT)
    rs1_dec uut (
        .opcode(opcode),
        .valid(valid),
        .valid_rs1(valid_rs1),
        .offset_sel_rs1(offset_sel_rs1),
        .mem_op(mem_op),
        .help_rs1(help_rs1),
        .type(type),
        .lv_rs1(lv_rs1),
        .lvars_acc_rs1(lvars_acc_rs1),
        .reverse_ops(reverse_ops),
        .st_index_op(st_index_op),
        .update_optop(update_optop)
    );

    initial begin
        // Initialize Inputs
        opcode = 16'b0;
        valid = 3'b0;

        // Test 1: Check aconst_null
        opcode = 16'h0100; // opcode for aconst_null
        valid = 3'b001; // valid
        #10;
        if (valid_rs1 !== 1'b1) $display("FAIL: Test 1 failed for aconst_null");
        
        // Test 2: Check iconst_1
        opcode = 16'h0400; // opcode for iconst_1
        valid = 3'b001; // valid
        #10;
        if (valid_rs1 !== 1'b1) $display("FAIL: Test 2 failed for iconst_1");

        // Test 3: Check istore_0
        opcode = 16'h3B00; // opcode for istore_0
        valid = 3'b001; // valid
        #10;
        if (mem_op !== 1'b1) $display("FAIL: Test 3 failed for istore_0");

        // Test 4: Check lload_0
        opcode = 16'h1600; // opcode for lload_0
        valid = 3'b001; // valid
        #10;
        if (type[0] !== 1'b1) $display("FAIL: Test 4 failed for lload_0");

        // Test 5: Check dstore
        opcode = 16'h3900; // opcode for dstore
        valid = 3'b001; // valid
        #10;
        if (mem_op !== 1'b1) $display("FAIL: Test 5 failed for dstore");

        // Test 6: Check lcmp
        opcode = 16'h9600; // opcode for lcmp
        valid = 3'b001; // valid
        #10;
        if (type[7] !== 1'b1) $display("FAIL: Test 6 failed for lcmp");

        // Test 7: Check invalid opcode
        opcode = 16'hFF00; // invalid opcode
        valid = 3'b001; // valid
        #10;
        if (valid_rs1 !== 1'b0) $display("FAIL: Test 7 failed for invalid opcode");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule