`timescale 1ns/1ps

module tb_mac_18;

parameter DATA_WIDTH = 18;
reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

// Instantiate the module under test
mac_18 uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Simple multiplication and addition
    a = 18'h0003; // 3
    b = 18'h0004; // 4
    c = 18'h0002; // 2
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Zero multiplication
    a = 18'h0000; // 0
    b = 18'h0005; // 5
    c = 18'h0001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Maximum values
    a = 18'h3FFFF; // Maximum 18-bit value
    b = 18'h3FFFF; // Maximum 18-bit value
    c = 18'h0001;  // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Negative result check (if applicable)
    a = 18'h0002; // 2
    b = 18'hFFFF; // -1 in 18-bit signed
    c = 18'h0000; // 0
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Random values
    a = 18'h000A; // 10
    b = 18'h000B; // 11
    c = 18'h000C; // 12
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule