`timescale 1ns/1ps

module tb_comparator;

reg [7:0] a, b;
wire smaller, equal, bigger;

// Instantiate the module under test (uut)
comparator uut (
    .a(a),
    .b(b),
    .smaller(smaller),
    .equal(equal),
    .bigger(bigger)
);

initial begin
    // Test case 1: a < b
    a = 8'd5; b = 8'd10; 
    #10;
    if (smaller !== 1 || equal !== 0 || bigger !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a > b
    a = 8'd15; b = 8'd10; 
    #10;
    if (smaller !== 0 || equal !== 0 || bigger !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a == b
    a = 8'd10; b = 8'd10; 
    #10;
    if (smaller !== 0 || equal !== 1 || bigger !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a < b (boundary case)
    a = 8'd0; b = 8'd1; 
    #10;
    if (smaller !== 1 || equal !== 0 || bigger !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a > b (boundary case)
    a = 8'd255; b = 8'd0; 
    #10;
    if (smaller !== 0 || equal !== 0 || bigger !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a == b (boundary case)
    a = 8'd128; b = 8'd128; 
    #10;
    if (smaller !== 0 || equal !== 1 || bigger !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule