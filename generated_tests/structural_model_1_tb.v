`timescale 1ns/1ps

module tb_structural_model;

    reg a;
    reg b;
    wire and_g;
    wire or_g;
    wire not_g;
    wire nand_g;
    wire nor_g;
    wire xor_g;
    wire xnor_g;

    // Instantiate the module under test (uut)
    structural_model uut (
        .a(a),
        .b(b),
        .and_g(and_g),
        .or_g(or_g),
        .not_g(not_g),
        .nand_g(nand_g),
        .nor_g(nor_g),
        .xor_g(xor_g),
        .xnor_g(xnor_g)
    );

    initial begin
        // Test all combinations of a and b
        a = 0; b = 0; #10;
        if (and_g !== 0 || or_g !== 0 || not_g !== 1 || nand_g !== 1 || nor_g !== 1 || xor_g !== 0 || xnor_g !== 1) begin
            $display("FAIL: Test case a=0, b=0 failed");
            $finish;
        end

        a = 0; b = 1; #10;
        if (and_g !== 0 || or_g !== 1 || not_g !== 1 || nand_g !== 1 || nor_g !== 0 || xor_g !== 1 || xnor_g !== 0) begin
            $display("FAIL: Test case a=0, b=1 failed");
            $finish;
        end

        a = 1; b = 0; #10;
        if (and_g !== 0 || or_g !== 1 || not_g !== 0 || nand_g !== 1 || nor_g !== 0 || xor_g !== 1 || xnor_g !== 0) begin
            $display("FAIL: Test case a=1, b=0 failed");
            $finish;
        end

        a = 1; b = 1; #10;
        if (and_g !== 1 || or_g !== 1 || not_g !== 0 || nand_g !== 0 || nor_g !== 0 || xor_g !== 0 || xnor_g !== 1) begin
            $display("FAIL: Test case a=1, b=1 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule