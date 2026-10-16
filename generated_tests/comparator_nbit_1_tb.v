`timescale 1ns/1ps

module tb_comparator_nbit;

reg [31:0] a, b;
wire Lesser, Greater, Equal;

// Instantiate the module under test (uut)
comparator_nbit uut (
    .a(a),
    .b(b),
    .Lesser(Lesser),
    .Greater(Greater),
    .Equal(Equal)
);

initial begin
    // Test case 1: a < b
    a = 32'h00000001; 
    b = 32'h00000002; 
    #10;
    if (Lesser !== 1 || Greater !== 0 || Equal !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a > b
    a = 32'h00000003; 
    b = 32'h00000002; 
    #10;
    if (Lesser !== 0 || Greater !== 1 || Equal !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a == b
    a = 32'h00000002; 
    b = 32'h00000002; 
    #10;
    if (Lesser !== 0 || Greater !== 0 || Equal !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a < b (with larger numbers)
    a = 32'h7FFFFFFF; 
    b = 32'h80000000; 
    #10;
    if (Lesser !== 1 || Greater !== 0 || Equal !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a > b (with larger numbers)
    a = 32'h80000000; 
    b = 32'h7FFFFFFF; 
    #10;
    if (Lesser !== 0 || Greater !== 1 || Equal !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a == b (with larger numbers)
    a = 32'hFFFFFFFF; 
    b = 32'hFFFFFFFF; 
    #10;
    if (Lesser !== 0 || Greater !== 0 || Equal !== 1) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule