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
        // Test case 1: a = 5, b = 10, c = 3, d = 8
        a = 8'd5; b = 8'd10; c = 8'd3; d = 8'd8;
        #10;
        if (min !== 8'd3) $display("FAIL: Test case 1 failed, expected min = 3, got min = %d", min);

        // Test case 2: a = 15, b = 7, c = 12, d = 4
        a = 8'd15; b = 8'd7; c = 8'd12; d = 8'd4;
        #10;
        if (min !== 8'd4) $display("FAIL: Test case 2 failed, expected min = 4, got min = %d", min);

        // Test case 3: a = 20, b = 20, c = 20, d = 20
        a = 8'd20; b = 8'd20; c = 8'd20; d = 8'd20;
        #10;
        if (min !== 8'd20) $display("FAIL: Test case 3 failed, expected min = 20, got min = %d", min);

        // Test case 4: a = 1, b = 2, c = 3, d = 0
        a = 8'd1; b = 8'd2; c = 8'd3; d = 8'd0;
        #10;
        if (min !== 8'd0) $display("FAIL: Test case 4 failed, expected min = 0, got min = %d", min);

        // Test case 5: a = 255, b = 0, c = 128, d = 64
        a = 8'd255; b = 8'd0; c = 8'd128; d = 8'd64;
        #10;
        if (min !== 8'd0) $display("FAIL: Test case 5 failed, expected min = 0, got min = %d", min);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule