`timescale 1ns/1ps

module tb_carry_lookahead_adder_16;

    reg [15:0] in1;
    reg [15:0] in2;
    reg cin;
    wire [15:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    carry_lookahead_adder_16 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        in1 = 16'h0000; in2 = 16'h0000; cin = 1'b0;
        #10;
        if (sum !== 16'h0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        in1 = 16'h0001; in2 = 16'h0001; cin = 1'b0;
        #10;
        if (sum !== 16'h0002 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 1 + 1 + 1
        in1 = 16'h0001; in2 = 16'h0001; cin = 1'b1;
        #10;
        if (sum !== 16'h0003 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: Max values
        in1 = 16'hFFFF; in2 = 16'hFFFF; cin = 1'b1;
        #10;
        if (sum !== 16'hFFFF || cout !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: Random values
        in1 = 16'h1234; in2 = 16'h5678; cin = 1'b0;
        #10;
        if (sum !== 16'h68AC || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: Another random values
        in1 = 16'hABCD; in2 = 16'hEF01; cin = 1'b1;
        #10;
        if (sum !== 16'hABC0 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        $display("PASS");
        $finish;
    end

endmodule