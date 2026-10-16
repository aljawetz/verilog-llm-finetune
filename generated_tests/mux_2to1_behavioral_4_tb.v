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
        in = 2'b01; // Input values
        sel = 1'b0; // Select first input
        #10; // Wait for 10 time units
        if (out !== in[sel]) begin
            $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 2: Select second input (in[1])
        in = 2'b10; // Input values
        sel = 1'b1; // Select second input
        #10; // Wait for 10 time units
        if (out !== in[sel]) begin
            $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 3: Select first input (in[0]) with different values
        in = 2'b11; // Input values
        sel = 1'b0; // Select first input
        #10; // Wait for 10 time units
        if (out !== in[sel]) begin
            $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // Test case 4: Select second input (in[1]) with different values
        in = 2'b00; // Input values
        sel = 1'b1; // Select second input
        #10; // Wait for 10 time units
        if (out !== in[sel]) begin
            $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", in[sel], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule