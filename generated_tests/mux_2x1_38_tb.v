`timescale 1ns/1ps

module tb_mux_2x1;

parameter N = 4;

// Inputs
reg [N-1:0] a0;
reg [N-1:0] a1;
reg s;

// Output
wire [N-1:0] y;

// Instantiate the Unit Under Test (UUT)
mux_2x1 uut (
    .a0(a0),
    .a1(a1),
    .s(s),
    .y(y)
);

// Test procedure
initial begin
    // Initialize inputs
    a0 = 4'b0000;
    a1 = 4'b0000;
    s = 1'b0;

    // Test case 1: Select a0 when s = 0
    a0 = 4'b1010; // a0 = 10
    a1 = 4'b0101; // a1 = 5
    s = 1'b0;     // Select a0
    #10;          // Wait for 10 time units
    if (y !== a0) begin
        $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a0, y);
        $finish;
    end

    // Test case 2: Select a1 when s = 1
    s = 1'b1;     // Select a1
    #10;          // Wait for 10 time units
    if (y !== a1) begin
        $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", a1, y);
        $finish;
    end

    // Test case 3: Change inputs and test again
    a0 = 4'b1111; // a0 = 15
    a1 = 4'b0000; // a1 = 0
    s = 1'b0;     // Select a0
    #10;          // Wait for 10 time units
    if (y !== a0) begin
        $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a0, y);
        $finish;
    end

    // Test case 4: Select a1
    s = 1'b1;     // Select a1
    #10;          // Wait for 10 time units
    if (y !== a1) begin
        $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", a1, y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule