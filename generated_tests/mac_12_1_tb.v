`timescale 1ns/1ps

module tb_mac_12;

parameter DATA_WIDTH = 12;

reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

// Instantiate the module under test
mac_12 uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Simple multiplication and addition
    a = 12'd3; b = 12'd4; c = 12'd5; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Zero multiplication
    a = 12'd0; b = 12'd10; c = 12'd5; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Maximum values
    a = 12'd4095; b = 12'd1; c = 12'd0; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Overflow scenario
    a = 12'd2048; b = 12'd2; c = 12'd0; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Adding a large value
    a = 12'd1; b = 12'd1; c = 12'd4095; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule