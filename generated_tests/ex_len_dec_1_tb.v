`timescale 1ns/1ps

module tb_ex_len_dec;

    reg [7:0] opcode;
    reg [4:0] valid;
    wire len0, len1, len2, len3, len4, len5;

    // Instantiate the module under test (uut)
    ex_len_dec uut (
        .opcode(opcode),
        .valid(valid),
        .len0(len0),
        .len1(len1),
        .len2(len2),
        .len3(len3),
        .len4(len4),
        .len5(len5)
    );

    initial begin
        // Test case 1: Check len1 activation
        opcode = 8'd0; valid = 5'b00001; #10;
        if (len1 !== 1'b1 || len2 !== 1'b0 || len3 !== 1'b0 || len4 !== 1'b0 || len5 !== 1'b0 || len0 !== 1'b0) 
            $display("FAIL: Test case 1 failed");

        // Test case 2: Check len2 activation
        opcode = 8'd16; valid = 5'b00011; #10;
        if (len2 !== 1'b1 || len1 !== 1'b0 || len3 !== 1'b0 || len4 !== 1'b0 || len5 !== 1'b0 || len0 !== 1'b0) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: Check len3 activation
        opcode = 8'd17; valid = 5'b00111; #10;
        if (len3 !== 1'b1 || len1 !== 1'b0 || len2 !== 1'b0 || len4 !== 1'b0 || len5 !== 1'b0 || len0 !== 1'b0) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: Check len4 activation
        opcode = 8'd197; valid = 5'b11110; #10;
        if (len4 !== 1'b1 || len1 !== 1'b0 || len2 !== 1'b0 || len3 !== 1'b0 || len5 !== 1'b0 || len0 !== 1'b0) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: Check len5 activation
        opcode = 8'd200; valid = 5'b11111; #10;
        if (len5 !== 1'b1 || len1 !== 1'b0 || len2 !== 1'b0 || len3 !== 1'b0 || len4 !== 1'b0 || len0 !== 1'b0) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: Check len0 activation
        opcode = 8'd255; valid = 5'b00000; #10;
        if (len0 !== 1'b1 || len1 !== 1'b0 || len2 !== 1'b0 || len3 !== 1'b0 || len4 !== 1'b0 || len5 !== 1'b0) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule