`timescale 1ns/1ps

module tb_comparator_n_bit;

reg [31:0] a, b;
wire L, G, E;

// Instantiate the module under test
comparator_n_bit uut (
    .a(a),
    .b(b),
    .L(L),
    .G(G),
    .E(E)
);

initial begin
    // Test case 1: a < b
    a = 32'h00000001; 
    b = 32'h00000002; 
    #10;
    if (L !== 1 || G !== 0 || E !== 0) begin
        $display("FAIL: Test case 1 failed (a < b)");
        $finish;
    end

    // Test case 2: a > b
    a = 32'h00000003; 
    b = 32'h00000002; 
    #10;
    if (L !== 0 || G !== 1 || E !== 0) begin
        $display("FAIL: Test case 2 failed (a > b)");
        $finish;
    end

    // Test case 3: a == b
    a = 32'h00000002; 
    b = 32'h00000002; 
    #10;
    if (L !== 0 || G !== 0 || E !== 1) begin
        $display("FAIL: Test case 3 failed (a == b)");
        $finish;
    end

    // Test case 4: a < b (edge case)
    a = 32'hFFFFFFFF; 
    b = 32'h00000000; 
    #10;
    if (L !== 0 || G !== 1 || E !== 0) begin
        $display("FAIL: Test case 4 failed (a < b edge case)");
        $finish;
    end

    // Test case 5: a > b (edge case)
    a = 32'h00000000; 
    b = 32'hFFFFFFFF; 
    #10;
    if (L !== 1 || G !== 0 || E !== 0) begin
        $display("FAIL: Test case 5 failed (a > b edge case)");
        $finish;
    end

    // Test case 6: a == b (edge case)
    a = 32'hFFFFFFFF; 
    b = 32'hFFFFFFFF; 
    #10;
    if (L !== 0 || G !== 0 || E !== 1) begin
        $display("FAIL: Test case 6 failed (a == b edge case)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule