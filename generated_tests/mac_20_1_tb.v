`timescale 1ns/1ps

module tb_mac_20;

parameter DATA_WIDTH = 20;

// Inputs
reg [DATA_WIDTH - 1 : 0] a;
reg [DATA_WIDTH - 1 : 0] b;
reg [DATA_WIDTH - 1 : 0] c;

// Outputs
wire [DATA_WIDTH - 1 : 0] out;

// Instantiate the Unit Under Test (UUT)
mac_20 uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Basic multiplication and addition
    a = 20'h0001; // 1
    b = 20'h0002; // 2
    c = 20'h0003; // 3
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Zero multiplication
    a = 20'h0000; // 0
    b = 20'h0002; // 2
    c = 20'h0003; // 3
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Large values
    a = 20'hFFFFF; // Max value for 20 bits
    b = 20'hFFFFF; // Max value for 20 bits
    c = 20'h0001;  // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Negative-like behavior (using max values)
    a = 20'hFFFFF; // Max value for 20 bits
    b = 20'h0001;  // 1
    c = 20'h0000;  // 0
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: All zeros
    a = 20'h0000; // 0
    b = 20'h0000; // 0
    c = 20'h0000; // 0
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule