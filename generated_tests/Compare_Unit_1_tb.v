`timescale 1ns/1ps

module tb_Compare_Unit;

    reg [31:0] a, b;
    reg compare_signed;
    wire a_lt_b, a_eq_b;

    // Instantiate the module under test
    Compare_Unit uut (
        .a(a),
        .b(b),
        .compare_signed(compare_signed),
        .a_lt_b(a_lt_b),
        .a_eq_b(a_eq_b)
    );

    initial begin
        // Test case 1: Equal unsigned comparison
        a = 32'h00000001; 
        b = 32'h00000001; 
        compare_signed = 1'b1; // unsigned comparison
        #10;
        if (a_lt_b !== 1'b0 || a_eq_b !== 1'b1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Less than unsigned comparison
        a = 32'h00000001; 
        b = 32'h00000002; 
        compare_signed = 1'b1; // unsigned comparison
        #10;
        if (a_lt_b !== 1'b1 || a_eq_b !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Greater than unsigned comparison
        a = 32'h00000002; 
        b = 32'h00000001; 
        compare_signed = 1'b1; // unsigned comparison
        #10;
        if (a_lt_b !== 1'b0 || a_eq_b !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Equal signed comparison
        a = 32'hFFFFFFFF; 
        b = 32'hFFFFFFFF; 
        compare_signed = 1'b0; // signed comparison
        #10;
        if (a_lt_b !== 1'b0 || a_eq_b !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Less than signed comparison
        a = 32'hFFFFFFFE; 
        b = 32'hFFFFFFFF; 
        compare_signed = 1'b0; // signed comparison
        #10;
        if (a_lt_b !== 1'b1 || a_eq_b !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Greater than signed comparison
        a = 32'hFFFFFFFF; 
        b = 32'hFFFFFFFE; 
        compare_signed = 1'b0; // signed comparison
        #10;
        if (a_lt_b !== 1'b0 || a_eq_b !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule