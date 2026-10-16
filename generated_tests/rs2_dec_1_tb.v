`timescale 1ns/1ps

module tb_rs2_dec;

    reg [15:0] opcode;
    reg [2:0] valid;
    wire [4:0] offset_sel_rs2;
    wire lv_rs2;
    wire lvars_acc_rs2;

    // Instantiate the module under test
    rs2_dec uut (
        .opcode(opcode),
        .valid(valid),
        .offset_sel_rs2(offset_sel_rs2),
        .lv_rs2(lv_rs2),
        .lvars_acc_rs2(lvars_acc_rs2)
    );

    initial begin
        // Test case 1: Test literal load (opcode 26)
        opcode = 16'h001A; // opcode for iload_0
        valid = 3'b001;    // valid
        #10;
        if (offset_sel_rs2 !== 5'b00001 || lv_rs2 !== 1'b1 || lvars_acc_rs2 !== 1'b1) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: Test local variable access (opcode 43)
        opcode = 16'h002B; // opcode for aload_1
        valid = 3'b001;    // valid
        #10;
        if (offset_sel_rs2 !== 5'b00010 || lv_rs2 !== 1'b1 || lvars_acc_rs2 !== 1'b1) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: Test invalid opcode
        opcode = 16'h00FF; // invalid opcode
        valid = 3'b000;    // not valid
        #10;
        if (offset_sel_rs2 !== 5'b00000 || lv_rs2 !== 1'b0 || lvars_acc_rs2 !== 1'b0) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: Test valid opcode with multiple valid flags (opcode 17)
        opcode = 16'h0011; // opcode for sipush
        valid = 3'b111;    // all valid
        #10;
        if (offset_sel_rs2 !== 5'b10000 || lv_rs2 !== 1'b1 || lvars_acc_rs2 !== 1'b0) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: Test another opcode (opcode 21)
        opcode = 16'h0015; // opcode for iload
        valid = 3'b011;    // valid
        #10;
        if (offset_sel_rs2 !== 5'b00000 || lv_rs2 !== 1'b1 || lvars_acc_rs2 !== 1'b1) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule