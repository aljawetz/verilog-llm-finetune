`timescale 1ns/1ps

module tb_encoder_4to2;

    reg Y3, Y2, Y1, Y0;
    wire A1, A0;

    // Instantiate the module under test (uut)
    encoder_4to2 uut (
        .Y3(Y3),
        .Y2(Y2),
        .Y1(Y1),
        .Y0(Y0),
        .A1(A1),
        .A0(A0)
    );

    initial begin
        // Test case 1: Y0 is high
        Y3 = 0; Y2 = 0; Y1 = 0; Y0 = 1;
        #10;
        if (A1 !== 1'b0 || A0 !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Y1 is high
        Y3 = 0; Y2 = 0; Y1 = 1; Y0 = 0;
        #10;
        if (A1 !== 1'b0 || A0 !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Y2 is high
        Y3 = 0; Y2 = 1; Y1 = 0; Y0 = 0;
        #10;
        if (A1 !== 1'b1 || A0 !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Y3 is high
        Y3 = 1; Y2 = 0; Y1 = 0; Y0 = 0;
        #10;
        if (A1 !== 1'b1 || A0 !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Multiple inputs high (undefined case)
        Y3 = 1; Y2 = 1; Y1 = 0; Y0 = 0;
        #10;
        if (A1 !== 1'bx || A0 !== 1'bx) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: All inputs low (undefined case)
        Y3 = 0; Y2 = 0; Y1 = 0; Y0 = 0;
        #10;
        if (A1 !== 1'bx || A0 !== 1'bx) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Multiple inputs high (undefined case)
        Y3 = 0; Y2 = 1; Y1 = 1; Y0 = 0;
        #10;
        if (A1 !== 1'bx || A0 !== 1'bx) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule