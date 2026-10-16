`timescale 1ns/1ps

module tb_demux4_1;

    // Inputs
    reg in;
    reg [1:0] sel;

    // Outputs
    wire [3:0] y;

    // Instantiate the Unit Under Test (UUT)
    demux4_1 uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Initialize inputs
        in = 0;
        sel = 2'b00;

        // Test case 1: sel = 00, in = 1
        in = 1; sel = 2'b00; #10;
        if (y !== 4'b0001) $display("FAIL: Test case 1 failed, expected y = 0001, got y = %b", y);

        // Test case 2: sel = 01, in = 1
        in = 1; sel = 2'b01; #10;
        if (y !== 4'b0010) $display("FAIL: Test case 2 failed, expected y = 0010, got y = %b", y);

        // Test case 3: sel = 10, in = 1
        in = 1; sel = 2'b10; #10;
        if (y !== 4'b0100) $display("FAIL: Test case 3 failed, expected y = 0100, got y = %b", y);

        // Test case 4: sel = 11, in = 1
        in = 1; sel = 2'b11; #10;
        if (y !== 4'b1000) $display("FAIL: Test case 4 failed, expected y = 1000, got y = %b", y);

        // Test case 5: sel = 00, in = 0
        in = 0; sel = 2'b00; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 5 failed, expected y = 0000, got y = %b", y);

        // Test case 6: sel = 01, in = 0
        in = 0; sel = 2'b01; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 6 failed, expected y = 0000, got y = %b", y);

        // Test case 7: sel = 10, in = 0
        in = 0; sel = 2'b10; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 7 failed, expected y = 0000, got y = %b", y);

        // Test case 8: sel = 11, in = 0
        in = 0; sel = 2'b11; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 8 failed, expected y = 0000, got y = %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule