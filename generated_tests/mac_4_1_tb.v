`timescale 1ns/1ps

module tb_mac_4;

parameter DATA_WIDTH = 4;
reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

// Instantiate the module under test (uut)
mac_4 uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Basic multiplication and addition
    a = 4'b0011; // 3
    b = 4'b0010; // 2
    c = 4'b0001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 1 failed. Expected %b, got %b", (a * b + c), out);
        $finish;
    end

    // Test case 2: Zero multiplication
    a = 4'b0000; // 0
    b = 4'b1010; // 10
    c = 4'b0001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 2 failed. Expected %b, got %b", (a * b + c), out);
        $finish;
    end

    // Test case 3: Maximum values
    a = 4'b1111; // 15
    b = 4'b1111; // 15
    c = 4'b0000; // 0
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 3 failed. Expected %b, got %b", (a * b + c), out);
        $finish;
    end

    // Test case 4: Adding a non-zero value
    a = 4'b0101; // 5
    b = 4'b0011; // 3
    c = 4'b0001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 4 failed. Expected %b, got %b", (a * b + c), out);
        $finish;
    end

    // Test case 5: All inputs zero
    a = 4'b0000; // 0
    b = 4'b0000; // 0
    c = 4'b0000; // 0
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 5 failed. Expected %b, got %b", (a * b + c), out);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule