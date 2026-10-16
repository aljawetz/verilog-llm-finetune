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
    // Test 1: Check initial condition
    in = 1'b0; #10;
    if (out !== 1'b0) begin
        $display("FAIL: Test 1 failed, expected out = 0, got out = %b", out);
        $finish;
    end

    // Test 2: Change input to 1
    in = 1'b1; #10;
    if (out !== 1'b1) begin
        $display("FAIL: Test 2 failed, expected out = 1, got out = %b", out);
        $finish;
    end

    // Test 3: Change input back to 0
    in = 1'b0; #10;
    if (out !== 1'b0) begin
        $display("FAIL: Test 3 failed, expected out = 0, got out = %b", out);
        $finish;
    end

    // Test 4: Change input to 1 again
    in = 1'b1; #10;
    if (out !== 1'b1) begin
        $display("FAIL: Test 4 failed, expected out = 1, got out = %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule