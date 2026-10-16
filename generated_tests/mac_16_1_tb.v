`timescale 1ns/1ps

module tb_mac_16;

parameter DATA_WIDTH = 16;
reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

// Instantiate the module under test
mac_16 uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Simple multiplication and addition
    a = 16'h0002; // 2
    b = 16'h0003; // 3
    c = 16'h0001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Zero multiplication
    a = 16'h0000; // 0
    b = 16'h0003; // 3
    c = 16'h0001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Maximum values
    a = 16'hFFFF; // -1
    b = 16'hFFFF; // -1
    c = 16'h0001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Mixed values
    a = 16'h0004; // 4
    b = 16'h0002; // 2
    c = 16'h000A; // 10
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Negative results (underflow)
    a = 16'h8000; // -32768
    b = 16'h8000; // -32768
    c = 16'h0000; // 0
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule