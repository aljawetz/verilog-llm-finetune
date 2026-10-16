`timescale 1ns/1ps

module tb_inputmajoritycircuit;

    reg [6:0] datain;
    wire y;

    // Instantiate the module under test (uut)
    inputmajoritycircuit uut (
        .datain(datain),
        .y(y)
    );

    initial begin
        // Test case 1: All bits low
        datain = 7'b0000000; #10;
        if (y !== 1'b0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

        // Test case 2: Three bits high
        datain = 7'b0000111; #10;
        if (y !== 1'b0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

        // Test case 3: Four bits high
        datain = 7'b1111000; #10;
        if (y !== 1'b1) $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);

        // Test case 4: Five bits high
        datain = 7'b1111100; #10;
        if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

        // Test case 5: Six bits high
        datain = 7'b1111110; #10;
        if (y !== 1'b1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

        // Test case 6: All bits high
        datain = 7'b1111111; #10;
        if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

        // Test case 7: Two bits high
        datain = 7'b0000001; #10;
        if (y !== 1'b0) $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);

        // Test case 8: Four bits high, mixed positions
        datain = 7'b1010101; #10;
        if (y !== 1'b1) $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule