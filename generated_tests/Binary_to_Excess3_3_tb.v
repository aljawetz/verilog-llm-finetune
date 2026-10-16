`timescale 1ns/1ps

module tb_Binary_to_Excess3;
    reg [3:0] B_IN;
    wire [3:0] EX_OUT;
    
    // Instantiate the module under test (uut)
    Binary_to_Excess3 uut (
        .B_IN(B_IN),
        .EX_OUT(EX_OUT)
    );

    initial begin
        // Test cases
        // Test case 1: B_IN = 0 (0 + 3 = 3)
        B_IN = 4'b0000; #10;
        if (EX_OUT !== 4'b0011) begin
            $display("FAIL: Test case 1 failed for B_IN = 0");
            $finish;
        end

        // Test case 2: B_IN = 5 (5 + 3 = 8)
        B_IN = 4'b0101; #10;
        if (EX_OUT !== 4'b1000) begin
            $display("FAIL: Test case 2 failed for B_IN = 5");
            $finish;
        end

        // Test case 3: B_IN = 9 (9 + 3 = 12)
        B_IN = 4'b1001; #10;
        if (EX_OUT !== 4'b1100) begin
            $display("FAIL: Test case 3 failed for B_IN = 9");
            $finish;
        end

        // Test case 4: B_IN = 12 (12 + 3 = 15)
        B_IN = 4'b1100; #10;
        if (EX_OUT !== 4'b1111) begin
            $display("FAIL: Test case 4 failed for B_IN = 12");
            $finish;
        end

        // Test case 5: B_IN = 13 (undefined)
        B_IN = 4'b1101; #10;
        if (EX_OUT !== 4'bxxxx) begin
            $display("FAIL: Test case 5 failed for B_IN = 13");
            $finish;
        end

        // Test case 6: B_IN = 15 (undefined)
        B_IN = 4'b1111; #10;
        if (EX_OUT !== 4'bxxxx) begin
            $display("FAIL: Test case 6 failed for B_IN = 15");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule