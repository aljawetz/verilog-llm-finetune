`timescale 1ns/1ps

module tb_mux_2x1;

    reg sum0;
    reg sum1;
    reg sel;
    wire y;

    // Instantiate the module under test (uut)
    mux_2x1 uut (
        .sum0(sum0),
        .sum1(sum1),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, expect y = sum1
        sum0 = 1'b0; sum1 = 1'b0; sel = 1'b0;
        #10;
        if (y !== sum1) begin
            $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", sum1, y);
            $finish;
        end

        // Test case 2: sel = 0, expect y = sum1
        sum0 = 1'b0; sum1 = 1'b1; sel = 1'b0;
        #10;
        if (y !== sum1) begin
            $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", sum1, y);
            $finish;
        end

        // Test case 3: sel = 1, expect y = sum0
        sum0 = 1'b1; sum1 = 1'b0; sel = 1'b1;
        #10;
        if (y !== sum0) begin
            $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", sum0, y);
            $finish;
        end

        // Test case 4: sel = 1, expect y = sum0
        sum0 = 1'b1; sum1 = 1'b1; sel = 1'b1;
        #10;
        if (y !== sum0) begin
            $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", sum0, y);
            $finish;
        end

        // Test case 5: sel = 0, expect y = sum1
        sum0 = 1'b1; sum1 = 1'b0; sel = 1'b0;
        #10;
        if (y !== sum1) begin
            $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", sum1, y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule