`timescale 1ns/1ps

module tb_mac_36;

parameter DATA_WIDTH = 4;  
reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

// Instantiate the module under test
mac_36 #(.DATA_WIDTH(DATA_WIDTH)) uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Basic multiplication and addition
    a = 4; b = 3; c = 2; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 1 failed. Expected %d, got %d", (a * b + c), out);
        $finish;
    end

    // Test case 2: Zero multiplication
    a = 0; b = 5; c = 1; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 2 failed. Expected %d, got %d", (a * b + c), out);
        $finish;
    end

    // Test case 3: Maximum values for DATA_WIDTH
    a = 15; b = 15; c = 0; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 3 failed. Expected %d, got %d", (a * b + c), out);
        $finish;
    end

    // Test case 4: Adding a positive number
    a = 2; b = 2; c = 3; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 4 failed. Expected %d, got %d", (a * b + c), out);
        $finish;
    end

    // Test case 5: Adding a larger number
    a = 1; b = 1; c = 15; 
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 5 failed. Expected %d, got %d", (a * b + c), out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule