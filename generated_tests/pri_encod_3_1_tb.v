`timescale 1ns/1ps

module tb_pri_encod_3;

    reg in0;
    reg in1;
    reg in2;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    pri_encod_3 uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    initial begin
        // Test case 1: Only in0 is high
        in0 = 1; in1 = 0; in2 = 0;
        #10;
        if (out !== 3'b001) $display("FAIL: Test case 1 failed, expected 3'b001, got %b", out);

        // Test case 2: Only in1 is high
        in0 = 0; in1 = 1; in2 = 0;
        #10;
        if (out !== 3'b010) $display("FAIL: Test case 2 failed, expected 3'b010, got %b", out);

        // Test case 3: Only in2 is high
        in0 = 0; in1 = 0; in2 = 1;
        #10;
        if (out !== 3'b100) $display("FAIL: Test case 3 failed, expected 3'b100, got %b", out);

        // Test case 4: in0 and in1 are high (in0 has priority)
        in0 = 1; in1 = 1; in2 = 0;
        #10;
        if (out !== 3'b001) $display("FAIL: Test case 4 failed, expected 3'b001, got %b", out);

        // Test case 5: in1 and in2 are high (in1 has priority)
        in0 = 0; in1 = 1; in2 = 1;
        #10;
        if (out !== 3'b010) $display("FAIL: Test case 5 failed, expected 3'b010, got %b", out);

        // Test case 6: All inputs low
        in0 = 0; in1 = 0; in2 = 0;
        #10;
        if (out !== 3'b000) $display("FAIL: Test case 6 failed, expected 3'b000, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule