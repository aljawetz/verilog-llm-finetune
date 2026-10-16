`timescale 1ns/1ps

module tb_mac_32;

parameter DATA_WIDTH = 32;  
reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

// Instantiate the module under test
mac_32 uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: Simple multiplication and addition
    a = 32'h00000002; // 2
    b = 32'h00000003; // 3
    c = 32'h00000004; // 4
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 1 failed. Expected %h, got %h", (a * b + c), out);
        $finish;
    end

    // Test case 2: Zero multiplication
    a = 32'h00000000; // 0
    b = 32'h00000005; // 5
    c = 32'h00000006; // 6
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 2 failed. Expected %h, got %h", (a * b + c), out);
        $finish;
    end

    // Test case 3: Large numbers
    a = 32'h7FFFFFFF; // Max positive 32-bit signed
    b = 32'h00000002; // 2
    c = 32'h00000001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 3 failed. Expected %h, got %h", (a * b + c), out);
        $finish;
    end

    // Test case 4: Negative multiplication
    a = 32'hFFFFFFFF; // -1
    b = 32'hFFFFFFFF; // -1
    c = 32'h00000001; // 1
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 4 failed. Expected %h, got %h", (a * b + c), out);
        $finish;
    end

    // Test case 5: All zeros
    a = 32'h00000000; // 0
    b = 32'h00000000; // 0
    c = 32'h00000000; // 0
    #10;
    if (out !== (a * b + c)) begin
        $display("FAIL: Test case 5 failed. Expected %h, got %h", (a * b + c), out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule