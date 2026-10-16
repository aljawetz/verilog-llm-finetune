`timescale 1ns/1ps

module tb_mux_2to1;

    reg [1:0] d;
    reg s;
    wire y;

    // Instantiate the module under test (uut)
    mux_2to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: s = 0, expect y = d[0]
        d = 2'b00; s = 0; #10;
        if (y !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: s = 0, expect y = d[0]
        d = 2'b01; s = 0; #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 3: s = 1, expect y = d[1]
        d = 2'b10; s = 1; #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 4: s = 1, expect y = d[1]
        d = 2'b11; s = 1; #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 5: s = 0, expect y = d[0]
        d = 2'b10; s = 0; #10;
        if (y !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 6: s = 0, expect y = d[0]
        d = 2'b11; s = 0; #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 6 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule