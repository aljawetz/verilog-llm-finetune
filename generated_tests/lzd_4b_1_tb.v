`timescale 1ns/1ps

module tb_lzd_4b;
    reg [3:0] i_a;
    wire [1:0] o_po;
    wire o_po_valid;

    // Instantiate the module under test (uut)
    lzd_4b uut (
        .i_a(i_a),
        .o_po(o_po),
        .o_po_valid(o_po_valid)
    );

    initial begin
        // Test case 1: Input is 4'b0000
        i_a = 4'b0000; #10;
        if (o_po != 2'b00 || o_po_valid != 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Input is 4'b0001
        i_a = 4'b0001; #10;
        if (o_po != 2'b00 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Input is 4'b0010
        i_a = 4'b0010; #10;
        if (o_po != 2'b01 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Input is 4'b0100
        i_a = 4'b0100; #10;
        if (o_po != 2'b10 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Input is 4'b1000
        i_a = 4'b1000; #10;
        if (o_po != 2'b11 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Input is 4'b1111
        i_a = 4'b1111; #10;
        if (o_po != 2'b11 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Input is 4'b1100
        i_a = 4'b1100; #10;
        if (o_po != 2'b11 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Input is 4'b1010
        i_a = 4'b1010; #10;
        if (o_po != 2'b11 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: Input is 4'b0110
        i_a = 4'b0110; #10;
        if (o_po != 2'b10 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: Input is 4'b0011
        i_a = 4'b0011; #10;
        if (o_po != 2'b01 || o_po_valid != 1'b1) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule