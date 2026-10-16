`timescale 1ns/1ps

module tb_carry_generator;
    reg Cg;
    reg Cp;
    reg Ci;
    wire Cgen;

    // Instantiate the carry_generator module
    carry_generator uut (
        .Cg(Cg),
        .Cp(Cp),
        .Ci(Ci),
        .Cgen(Cgen)
    );

    initial begin
        // Test case 1: Cg = 0, Cp = 0, Ci = 0 -> Cgen should be 0
        Cg = 0; Cp = 0; Ci = 0;
        #10;
        if (Cgen !== 0) begin
            $display("FAIL: Test case 1 failed, expected Cgen = 0, got Cgen = %b", Cgen);
            $finish;
        end

        // Test case 2: Cg = 0, Cp = 0, Ci = 1 -> Cgen should be 0
        Cg = 0; Cp = 0; Ci = 1;
        #10;
        if (Cgen !== 0) begin
            $display("FAIL: Test case 2 failed, expected Cgen = 0, got Cgen = %b", Cgen);
            $finish;
        end

        // Test case 3: Cg = 0, Cp = 1, Ci = 0 -> Cgen should be 0
        Cg = 0; Cp = 1; Ci = 0;
        #10;
        if (Cgen !== 0) begin
            $display("FAIL: Test case 3 failed, expected Cgen = 0, got Cgen = %b", Cgen);
            $finish;
        end

        // Test case 4: Cg = 0, Cp = 1, Ci = 1 -> Cgen should be 1
        Cg = 0; Cp = 1; Ci = 1;
        #10;
        if (Cgen !== 1) begin
            $display("FAIL: Test case 4 failed, expected Cgen = 1, got Cgen = %b", Cgen);
            $finish;
        end

        // Test case 5: Cg = 1, Cp = 0, Ci = 0 -> Cgen should be 1
        Cg = 1; Cp = 0; Ci = 0;
        #10;
        if (Cgen !== 1) begin
            $display("FAIL: Test case 5 failed, expected Cgen = 1, got Cgen = %b", Cgen);
            $finish;
        end

        // Test case 6: Cg = 1, Cp = 0, Ci = 1 -> Cgen should be 1
        Cg = 1; Cp = 0; Ci = 1;
        #10;
        if (Cgen !== 1) begin
            $display("FAIL: Test case 6 failed, expected Cgen = 1, got Cgen = %b", Cgen);
            $finish;
        end

        // Test case 7: Cg = 1, Cp = 1, Ci = 0 -> Cgen should be 1
        Cg = 1; Cp = 1; Ci = 0;
        #10;
        if (Cgen !== 1) begin
            $display("FAIL: Test case 7 failed, expected Cgen = 1, got Cgen = %b", Cgen);
            $finish;
        end

        // Test case 8: Cg = 1, Cp = 1, Ci = 1 -> Cgen should be 1
        Cg = 1; Cp = 1; Ci = 1;
        #10;
        if (Cgen !== 1) begin
            $display("FAIL: Test case 8 failed, expected Cgen = 1, got Cgen = %b", Cgen);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule