`timescale 1ns/1ps

module tb_encoder_3_8;

    reg [2:0] a_in;
    wire [7:0] d_out;

    // Instantiate the module under test
    encoder_3_8 uut (
        .a_in(a_in),
        .d_out(d_out)
    );

    initial begin
        // Test case 1: a_in = 3'b000
        a_in = 3'b000;
        #10;
        if (d_out !== 8'b0000_0001) begin
            $display("FAIL: Test case 1 failed for a_in = 3'b000");
            $finish;
        end

        // Test case 2: a_in = 3'b001
        a_in = 3'b001;
        #10;
        if (d_out !== 8'b0000_0010) begin
            $display("FAIL: Test case 2 failed for a_in = 3'b001");
            $finish;
        end

        // Test case 3: a_in = 3'b010
        a_in = 3'b010;
        #10;
        if (d_out !== 8'b0000_0100) begin
            $display("FAIL: Test case 3 failed for a_in = 3'b010");
            $finish;
        end

        // Test case 4: a_in = 3'b011
        a_in = 3'b011;
        #10;
        if (d_out !== 8'b0000_1000) begin
            $display("FAIL: Test case 4 failed for a_in = 3'b011");
            $finish;
        end

        // Test case 5: a_in = 3'b100
        a_in = 3'b100;
        #10;
        if (d_out !== 8'b0001_0000) begin
            $display("FAIL: Test case 5 failed for a_in = 3'b100");
            $finish;
        end

        // Test case 6: a_in = 3'b101
        a_in = 3'b101;
        #10;
        if (d_out !== 8'b0010_0000) begin
            $display("FAIL: Test case 6 failed for a_in = 3'b101");
            $finish;
        end

        // Test case 7: a_in = 3'b110
        a_in = 3'b110;
        #10;
        if (d_out !== 8'b0100_0000) begin
            $display("FAIL: Test case 7 failed for a_in = 3'b110");
            $finish;
        end

        // Test case 8: a_in = 3'b111
        a_in = 3'b111;
        #10;
        if (d_out !== 8'b1000_0000) begin
            $display("FAIL: Test case 8 failed for a_in = 3'b111");
            $finish;
        end

        // Test case 9: a_in = 3'bxxx (default case)
        a_in = 3'bxxx; // Invalid input
        #10;
        if (d_out !== 8'b0000_0000) begin
            $display("FAIL: Test case 9 failed for invalid a_in");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule