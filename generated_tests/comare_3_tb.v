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
        // Test case 1: a = 5, b = 10, c = 3, d = 7
        a = 8'd5; b = 8'd10; c = 8'd3; d = 8'd7;
        #10;
        if (min !== 8'd3) $display("FAIL: Test case 1 failed, expected min = 3, got min = %d", min);

        // Test case 2: a = 15, b = 5, c = 20, d = 10
        a = 8'd15; b = 8'd5; c = 8'd20; d = 8'd10;
        #10;
        if (min !== 8'd5) $display("FAIL: Test case 2 failed, expected min = 5, got min = %d", min);

        // Test case 3: a = 8, b = 8, c = 8, d = 8
        a = 8'd8; b = 8'd8; c = 8'd8; d = 8'd8;
        #10;
        if (min !== 8'd8) $display("FAIL: Test case 3 failed, expected min = 8, got min = %d", min);

        // Test case 4: a = 0, b = 255, c = 128, d = 64
        a = 8'd0; b = 8'd255; c = 8'd128; d = 8'd64;
        #10;
        if (min !== 8'd0) $display("FAIL: Test case 4 failed, expected min = 0, got min = %d", min);

        // Test case 5: a = 100, b = 50, c = 150, d = 25
        a = 8'd100; b = 8'd50; c = 8'd150; d = 8'd25;
        #10;
        if (min !== 8'd25) $display("FAIL: Test case 5 failed, expected min = 25, got min = %d", min);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule