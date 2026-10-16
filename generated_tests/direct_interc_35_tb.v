`timescale 1ns/1ps

module tb_direct_interc;

//----- INPUT PORTS -----
reg [0:0] in;

//----- OUTPUT PORTS -----
wire [0:0] out;

//----- Instantiate the Unit Under Test (UUT) -----
direct_interc uut (
    .in(in),
    .out(out)
);

//----- Test Sequence -----
initial begin
    // Test case 1: Check when input is 0
    in = 1'b0;
    #10; // Wait for 10 time units
    if (out !== 1'b0) begin
        $display("FAIL: Expected out = 0, got out = %b", out);
        $finish;
    end

    // Test case 2: Check when input is 1
    in = 1'b1;
    #10; // Wait for 10 time units
    if (out !== 1'b1) begin
        $display("FAIL: Expected out = 1, got out = %b", out);
        $finish;
    end

    // Test case 3: Check for stability
    in = 1'b0;
    #10; // Wait for 10 time units
    if (out !== 1'b0) begin
        $display("FAIL: Expected out = 0, got out = %b", out);
        $finish;
    end

    in = 1'b1;
    #10; // Wait for 10 time units
    if (out !== 1'b1) begin
        $display("FAIL: Expected out = 1, got out = %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule