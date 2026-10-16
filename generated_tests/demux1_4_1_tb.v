`timescale 1ns/1ps

module tb_demux1_4;

    reg in;
    reg [1:0] sel;
    wire [3:0] y;

    // Instantiate the demux1_4 module
    demux1_4 uut (
        .y(y),
        .in(in),
        .sel(sel)
    );

    initial begin
        // Test case 1: Select 0, input 1
        in = 1'b1; sel = 2'b00; #10;
        if (y !== 4'b0001) $display("FAIL: Test case 1 failed, expected y = 0001, got y = %b", y);

        // Test case 2: Select 1, input 1
        in = 1'b1; sel = 2'b01; #10;
        if (y !== 4'b0010) $display("FAIL: Test case 2 failed, expected y = 0010, got y = %b", y);

        // Test case 3: Select 2, input 1
        in = 1'b1; sel = 2'b10; #10;
        if (y !== 4'b0100) $display("FAIL: Test case 3 failed, expected y = 0100, got y = %b", y);

        // Test case 4: Select 3, input 1
        in = 1'b1; sel = 2'b11; #10;
        if (y !== 4'b1000) $display("FAIL: Test case 4 failed, expected y = 1000, got y = %b", y);

        // Test case 5: Select 0, input 0
        in = 1'b0; sel = 2'b00; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 5 failed, expected y = 0000, got y = %b", y);

        // Test case 6: Select 1, input 0
        in = 1'b0; sel = 2'b01; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 6 failed, expected y = 0000, got y = %b", y);

        // Test case 7: Select 2, input 0
        in = 1'b0; sel = 2'b10; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 7 failed, expected y = 0000, got y = %b", y);

        // Test case 8: Select 3, input 0
        in = 1'b0; sel = 2'b11; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 8 failed, expected y = 0000, got y = %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule