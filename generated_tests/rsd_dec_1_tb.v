`timescale 1ns/1ps

module tb_rsd_dec;

    reg [7:0] opcode;
    reg [2:0] valid;
    wire [4:0] offset_sel_rsd;

    // Instantiate the module under test (uut)
    rsd_dec uut (
        .opcode(opcode),
        .valid(valid),
        .offset_sel_rsd(offset_sel_rsd)
    );

    initial begin
        // Test case 1: istore_1
        opcode = 8'h3c; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 1 failed");

        // Test case 2: fstore_1
        opcode = 8'h44; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 2 failed");

        // Test case 3: astore_1
        opcode = 8'h4c; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 3 failed");

        // Test case 4: lstore_1
        opcode = 8'h40; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 4 failed");

        // Test case 5: dstore_1
        opcode = 8'h48; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 5 failed");

        // Test case 6: istore_2
        opcode = 8'h3d; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00010) $display("FAIL: Test case 6 failed");

        // Test case 7: fstore_2
        opcode = 8'h45; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00010) $display("FAIL: Test case 7 failed");

        // Test case 8: astore_2
        opcode = 8'h4d; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00010) $display("FAIL: Test case 8 failed");

        // Test case 9: lstore_2
        opcode = 8'h41; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00010) $display("FAIL: Test case 9 failed");

        // Test case 10: dstore_2
        opcode = 8'h49; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00010) $display("FAIL: Test case 10 failed");

        // Test case 11: istore_3
        opcode = 8'h3e; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00011) $display("FAIL: Test case 11 failed");

        // Test case 12: fstore_3
        opcode = 8'h46; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00011) $display("FAIL: Test case 12 failed");

        // Test case 13: astore_3
        opcode = 8'h4e; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00011) $display("FAIL: Test case 13 failed");

        // Test case 14: lstore_3
        opcode = 8'h42; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00011) $display("FAIL: Test case 14 failed");

        // Test case 15: dstore_3
        opcode = 8'h4a; valid = 3'b001; #10;
        if (offset_sel_rsd !== 5'b00011) $display("FAIL: Test case 15 failed");

        // Test case 16: istore with valid[1]
        opcode = 8'h36; valid = 3'b011; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 16 failed");

        // Test case 17: fstore with valid[1]
        opcode = 8'h38; valid = 3'b011; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 17 failed");

        // Test case 18: astore with valid[1]
        opcode = 8'h3a; valid = 3'b011; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 18 failed");

        // Test case 19: dstore with valid[1]
        opcode = 8'h39; valid = 3'b011; #10;
        if (offset_sel_rsd !== 5'b00001) $display("FAIL: Test case 19 failed");

        // Test case 20: iinc
        opcode = 8'h84; valid = 3'b111; #10;
        if (offset_sel_rsd !== 5'b10000) $display("FAIL: Test case 20 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule