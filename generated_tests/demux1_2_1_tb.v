`timescale 1ns/1ps

module tb_demux1_2;

    reg in;
    reg sel;
    wire [1:0] y;

    // Instantiate the module under test (uut)
    demux1_2 uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: sel = 0, in = 0
        in = 0; sel = 0;
        #10;
        if (y !== 2'b00) begin
            $display("FAIL: Test case 1 failed, expected y = 00, got y = %b", y);
            $finish;
        end

        // Test case 2: sel = 0, in = 1
        in = 1; sel = 0;
        #10;
        if (y !== 2'b01) begin
            $display("FAIL: Test case 2 failed, expected y = 01, got y = %b", y);
            $finish;
        end

        // Test case 3: sel = 1, in = 0
        in = 0; sel = 1;
        #10;
        if (y !== 2'b00) begin
            $display("FAIL: Test case 3 failed, expected y = 00, got y = %b", y);
            $finish;
        end

        // Test case 4: sel = 1, in = 1
        in = 1; sel = 1;
        #10;
        if (y !== 2'b10) begin
            $display("FAIL: Test case 4 failed, expected y = 10, got y = %b", y);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule