`timescale 1ns/1ps

module tb_full_adder;

    // Inputs
    reg in0;
    reg in1;
    reg cin;

    // Outputs
    wire out;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .in0(in0),
        .in1(in1),
        .cin(cin),
        .out(out),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, cout = 0
        in0 = 0; in1 = 0; cin = 0;
        #10;
        if (out !== 0 || cout !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 0 + 0 + 1 = 1, cout = 0
        in0 = 0; in1 = 0; cin = 1;
        #10;
        if (out !== 1 || cout !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 0 + 1 + 0 = 1, cout = 0
        in0 = 0; in1 = 1; cin = 0;
        #10;
        if (out !== 1 || cout !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 0 + 1 + 1 = 0, cout = 1
        in0 = 0; in1 = 1; cin = 1;
        #10;
        if (out !== 0 || cout !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 1 + 0 + 0 = 1, cout = 0
        in0 = 1; in1 = 0; cin = 0;
        #10;
        if (out !== 1 || cout !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 1 + 0 + 1 = 0, cout = 1
        in0 = 1; in1 = 0; cin = 1;
        #10;
        if (out !== 0 || cout !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 1 + 1 + 0 = 0, cout = 1
        in0 = 1; in1 = 1; cin = 0;
        #10;
        if (out !== 0 || cout !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 1 + 1 + 1 = 1, cout = 1
        in0 = 1; in1 = 1; cin = 1;
        #10;
        if (out !== 1 || cout !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule