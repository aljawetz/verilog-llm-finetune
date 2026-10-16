`timescale 1ns/1ps

module tb_comare;

    reg [7:0] a, b, c, d;
    wire [7:0] min;

    // Instantiate the module under test (uut)
    comare uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .min(min)
    );

    initial begin
        // Test case 1: a = 1, b = 2, c = 3, d = 4
        a = 8'd1; b = 8'd2; c = 8'd3; d = 8'd4;
        #10;
        if (min !== 8'd1) $display("FAIL: Test case 1 failed, expected min = 1, got min = %d", min);

        // Test case 2: a = 5, b = 3, c = 2, d = 4
        a = 8'd5; b = 8'd3; c = 8'd2; d = 8'd4;
        #10;
        if (min !== 8'd2) $display("FAIL: Test case 2 failed, expected min = 2, got min = %d", min);

        // Test case 3: a = 7, b = 7, c = 7, d = 7
        a = 8'd7; b = 8'd7; c = 8'd7; d = 8'd7;
        #10;
        if (min !== 8'd7) $display("FAIL: Test case 3 failed, expected min = 7, got min = %d", min);

        // Test case 4: a = 0, b = 255, c = 128, d = 64
        a = 8'd0; b = 8'd255; c = 8'd128; d = 8'd64;
        #10;
        if (min !== 8'd0) $display("FAIL: Test case 4 failed, expected min = 0, got min = %d", min);

        // Test case 5: a = 10, b = 20, c = 5, d = 15
        a = 8'd10; b = 8'd20; c = 8'd5; d = 8'd15;
        #10;
        if (min !== 8'd5) $display("FAIL: Test case 5 failed, expected min = 5, got min = %d", min);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule