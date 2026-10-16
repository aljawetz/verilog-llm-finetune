`timescale 1ns/1ps

module tb_mux_2to1_behavioral;

    reg [1:0] in;
    reg sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_2to1_behavioral uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select first input (in[0])
        in = 2'b01; // in[0] = 1, in[1] = 0
        sel = 1'b0; // Select in[0]
        #10; // Wait for 10 time units
        if (out !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 2: Select second input (in[1])
        in = 2'b10; // in[0] = 0, in[1] = 1
        sel = 1'b1; // Select in[1]
        #10; // Wait for 10 time units
        if (out !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 3: Select first input (in[0]) again
        in = 2'b11; // in[0] = 1, in[1] = 1
        sel = 1'b0; // Select in[0]
        #10; // Wait for 10 time units
        if (out !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 4: Select second input (in[1]) again
        in = 2'b00; // in[0] = 0, in[1] = 0
        sel = 1'b1; // Select in[1]
        #10; // Wait for 10 time units
        if (out !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule