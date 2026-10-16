`timescale 1ns/1ps

module tb_direct_interc;

//----- INPUT PORTS -----
reg [0:0] in;

//----- OUTPUT PORTS -----
wire [0:0] out;

// Instantiate the module under test (uut)
direct_interc uut (
    .in(in),
    .out(out)
);

// Test procedure
initial begin
    // Initialize input
    in = 1'b0;

    // Test case 1: Check when input is 0
    #10; // Wait for 10 ns
    if (out !== 1'b0) begin
        $display("FAIL: Expected out = 0, got out = %b", out);
        $finish;
    end

    // Test case 2: Check when input is 1
    in = 1'b1;
    #10; // Wait for 10 ns
    if (out !== 1'b1) begin
        $display("FAIL: Expected out = 1, got out = %b", out);
        $finish;
    end

    // Test case 3: Check when input is toggled
    in = 1'b0;
    #10; // Wait for 10 ns
    if (out !== 1'b0) begin
        $display("FAIL: Expected out = 0, got out = %b", out);
        $finish;
    end

    in = 1'b1;
    #10; // Wait for 10 ns
    if (out !== 1'b1) begin
        $display("FAIL: Expected out = 1, got out = %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule