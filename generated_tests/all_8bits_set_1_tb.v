`timescale 1ns/1ps

module tb_all_8bits_set;

    reg [7:0] in;
    wire all_set;

    // Instantiate the module under test (uut)
    all_8bits_set uut (
        .in(in),
        .all_set(all_set)
    );

    initial begin
        // Test case 1: Input is all ones
        in = 8'b11111111; 
        #10;
        if (all_set !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected all_set = 1");
            $finish;
        end

        // Test case 2: Input is all zeros
        in = 8'b00000000; 
        #10;
        if (all_set !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected all_set = 0");
            $finish;
        end

        // Test case 3: Input is a mix of ones and zeros
        in = 8'b10101010; 
        #10;
        if (all_set !== 1'b0) begin
            $display("FAIL: Test case 3 failed, expected all_set = 0");
            $finish;
        end

        // Test case 4: Input is all ones again
        in = 8'b11111111; 
        #10;
        if (all_set !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected all_set = 1");
            $finish;
        end

        // Test case 5: Input is one less than all ones
        in = 8'b11111110; 
        #10;
        if (all_set !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected all_set = 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule