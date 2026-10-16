`timescale 1ns/1ps

module tb_mux_16to1;

    reg [15:0] d;
    reg [3:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_16to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test sequence
        // Test case 1: Select d[0]
        d = 16'b0000000000000001; // d[0] = 1
        s = 4'b0000; // Select line for d[0]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: Select d[1]
        d = 16'b0000000000000010; // d[1] = 1
        s = 4'b0001; // Select line for d[1]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

        // Test case 3: Select d[2]
        d = 16'b0000000000000100; // d[2] = 1
        s = 4'b0010; // Select line for d[2]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

        // Test case 4: Select d[3]
        d = 16'b0000000000001000; // d[3] = 1
        s = 4'b0011; // Select line for d[3]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

        // Test case 5: Select d[4]
        d = 16'b0000000000010000; // d[4] = 1
        s = 4'b0100; // Select line for d[4]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

        // Test case 6: Select d[15]
        d = 16'b1000000000000000; // d[15] = 1
        s = 4'b1111; // Select line for d[15]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

        // Test case 7: Select d[7]
        d = 16'b0000000010000000; // d[7] = 1
        s = 4'b0111; // Select line for d[7]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule