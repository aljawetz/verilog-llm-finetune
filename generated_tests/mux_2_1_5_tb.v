`timescale 1ns/1ps

module tb_mux_2_1;

    // Inputs
    reg [1:0] in;
    reg S;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux_2_1 uut (
        .in(in),
        .S(S),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        in = 2'b01; // in[0] = 1, in[1] = 0
        S = 1'b0;   // Select in[0]
        #10;        // Wait for 10 time units
        if (out !== in[0]) begin
            $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", in[0], out);
            $finish;
        end

        // Test case 2: Select input 1
        S = 1'b1;   // Select in[1]
        #10;        // Wait for 10 time units
        if (out !== in[1]) begin
            $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", in[1], out);
            $finish;
        end

        // Test case 3: Change inputs
        in = 2'b10; // in[0] = 0, in[1] = 1
        S = 1'b0;   // Select in[0]
        #10;        // Wait for 10 time units
        if (out !== in[0]) begin
            $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", in[0], out);
            $finish;
        end

        // Test case 4: Select input 1 again
        S = 1'b1;   // Select in[1]
        #10;        // Wait for 10 time units
        if (out !== in[1]) begin
            $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", in[1], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule